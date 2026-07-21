import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/screens/login_screen.dart';
import '../../data/language_aliases.dart';
import '../../data/language_data.dart';
import '../../data/stt_service.dart';
import '../../data/tts_service.dart';
import '../../domain/language_model.dart';
import '../providers/language_provider.dart';
import '../widgets/continue_button.dart';
import '../widgets/language_card.dart';
import '../widgets/language_search_bar.dart';
import '../widgets/recommended_languages.dart';
import '../widgets/speaker_button.dart';
import '../widgets/voice_listening_overlay.dart';

/// Kamaai — Language Selection Screen.
///
/// First user-facing screen. Lets the user pick their language by
/// tapping a rounded, expandable selector (with search) or by speaking
/// it aloud. Reuses all existing widgets/services/providers per the
/// project's architecture; no new packages are introduced.
class LanguageSelectionScreen extends ConsumerStatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  ConsumerState<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState
    extends ConsumerState<LanguageSelectionScreen>
    with SingleTickerProviderStateMixin {
  static const Color _green = Color(0xFF165C34);
  static const Color _orange = Color(0xFFE76A10);
  static const Color _darkBrown = Color(0xFF3D2A20);
  static const Color _yellowCard = Color(0xFFFFF4C2);

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final ScrollController _languageScrollController = ScrollController();

  late final Map<String, GlobalKey> _cardKeys;

  // Phase 5 — Premium Entrance Animation
  late final AnimationController _pageAnimationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  List<LanguageModel> _recommended = [];
  List<LanguageModel> _filteredLanguages = supportedLanguages;

  bool _isExpanded = false;
  bool _isListening = false;
  bool _isSpeaking = false;
  bool _isSaving = false;
  bool _pageVisible = false;
  bool _bootstrapped = false;
  String _recognizedText = "";

  @override
  void initState() {
    super.initState();
    _cardKeys = {
      for (final language in supportedLanguages) language.code: GlobalKey(),
    };
    _searchController.addListener(_onSearchChanged);

    // Phase 5 — Premium Entrance Animation init
    _pageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _pageAnimationController,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, .08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _pageAnimationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _pageAnimationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _pageVisible = true);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_bootstrapped) {
      _bootstrapped = true;
      _bootstrap();
    }
  }

  Future<void> _bootstrap() async {
    final notifier = ref.read(languageProvider.notifier);
    await notifier.loadSavedLanguage();
    if (!mounted) return;
    setState(() {
      _recommended = notifier.getRecommendedLanguages(context);
    });
  }

  void _onSearchChanged() {
    setState(() {
      _filteredLanguages = ref
          .read(languageProvider.notifier)
          .searchLanguages(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _languageScrollController.dispose();
    _pageAnimationController.dispose();
    STTService.stopListening();
    TTSService.stop();
    super.dispose();
  }

  // ---------------------------------------------------------------------
  // Voice
  // ---------------------------------------------------------------------

  Future<void> _startListening() async {
    final available = await STTService.initialize();

    if (!available) {
      _showSnackbar("माइक्रोफ़ोन उपलब्ध नहीं है। कृपया सूची से भाषा चुनें।");
      return;
    }

    if (!mounted) return;
    setState(() {
      _isListening = true;
      _recognizedText = "";
    });

    await STTService.startListening(
      localeId: "en_IN",
      onResult: (text) {
        if (!mounted) return;
        setState(() => _recognizedText = text);
        _tryAutoSelectFromSpeech(text);
      },
      onComplete: () {
        if (!mounted) return;
        setState(() => _isListening = false);
      },
    );
  }

  void _tryAutoSelectFromSpeech(String text) {
    final matches = supportedLanguages
        .where((language) => LanguageAliases.matches(language, text))
        .toList();

    if (matches.length == 1) {
      _onVoiceLanguageIdentified(matches.first);
    }
  }

  Future<void> _onVoiceLanguageIdentified(LanguageModel language) async {
    await STTService.stopListening();
    if (!mounted) return;

    setState(() {
      _isListening = false;
      _isExpanded = true;
    });

    ref.read(languageProvider.notifier).setLanguage(language);
    _scrollToLanguage(language);

    await TTSService.initialize();
    await TTSService.speak(text: language.greeting, languageCode: language.locale);

    _showSnackbar("भाषा चुनी गई: ${language.nativeName}");
  }

  Future<void> _cancelListening() async {
    await STTService.stopListening();
    if (!mounted) return;
    setState(() => _isListening = false);
  }

  void _scrollToLanguage(LanguageModel language) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = _cardKeys[language.code];
      final cardContext = key?.currentContext;
      if (cardContext != null) {
        Scrollable.ensureVisible(
          cardContext,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          alignment: 0.3,
        );
      }
    });
  }

  Future<void> _handleSpeakerPress() async {
    final selected = ref.read(languageProvider);
    setState(() => _isSpeaking = true);

    await TTSService.initialize();
    await TTSService.speak(
      text: "नीचे सूची में से अपनी भाषा चुनें, या बोलकर भाषा चुनें।",
      languageCode: selected.locale,
      onComplete: () {
        if (mounted) setState(() => _isSpeaking = false);
      },
    );
  }

  // ---------------------------------------------------------------------
  // Selection / navigation
  // ---------------------------------------------------------------------

  void _selectLanguage(LanguageModel language) {
    // Phase 2 — Language Selection Success haptic + keyboard dismiss
    HapticFeedback.selectionClick();

    FocusScope.of(context).unfocus();
    _searchFocusNode.unfocus();
    _searchController.clear();

    ref.read(languageProvider.notifier).setLanguage(language);

    setState(() {
      _isExpanded = false;
    });
  }

  Future<void> _handleContinue() async {
    setState(() => _isSaving = true);

    final notifier = ref.read(languageProvider.notifier);
    await notifier.saveLanguage();

    if (!mounted) return;
    setState(() => _isSaving = false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  void _showSnackbar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: _green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final selectedLanguage = ref.watch(languageProvider);
    final width = MediaQuery.sizeOf(context).width;
    final isTablet = width > 600;
    final horizontalPadding = isTablet ? width * 0.15 : 24.0;

    return Scaffold(
      // Phase 5 — Premium Background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffF9FCF9),
              Colors.white,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Phase 5 — Wrap SafeArea with FadeTransition + SlideTransition
            SafeArea(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: [
                              SpeakerButton(
                                isSpeaking: _isSpeaking,
                                onPressed: _handleSpeakerPress,
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "सुनें",
                                style: TextStyle(fontSize: 12, color: _darkBrown),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Phase 5 — Better Header with ShaderMask logo
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 700),
                          tween: Tween(begin: 0, end: 1),
                          builder: (_, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 30 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: Center(
                            child: Hero(
                              tag: "kamaai_logo",
                              child: TweenAnimationBuilder<double>(
                                tween: Tween(begin: 0, end: 1),
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.easeOutBack,
                                builder: (context, value, child) => Transform.scale(
                                  scale: 0.85 + (0.15 * value),
                                  child: Opacity(opacity: value.clamp(0.0, 1.0).toDouble(), child: child),
                                ),
                                child: Image.asset(
                                  "assets/images/kamaai_logo.png",
                                  height: isTablet ? 160 : 120,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 800),
                          tween: Tween(begin: 0, end: 1),
                          builder: (_, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 30 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Text(
                                "अपनी भाषा चुनें",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: isTablet ? 40 : 32,
                                  fontWeight: FontWeight.w800,
                                  color: _darkBrown,
                                ),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: isTablet ? 18 : 15,
                                    color: _darkBrown,
                                    height: 1.5,
                                  ),
                                  children: const [
                                    TextSpan(text: "आप जिस भाषा में सहज हैं,\nउसी भाषा में "),
                                    TextSpan(
                                      text: "Kamaai",
                                      style: TextStyle(color: _orange, fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(text: " का उपयोग करें"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 28),

                        // Phase 5 — Language Selector with entrance animation
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 900),
                          tween: Tween(begin: 0, end: 1),
                          builder: (_, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 30 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: _buildLanguageSelector(selectedLanguage),
                        ),

                        const SizedBox(height: 24),
                        _buildOrDivider(),
                        const SizedBox(height: 24),

                        // Phase 5 — Voice Card with entrance animation
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 1000),
                          tween: Tween(begin: 0, end: 1),
                          builder: (_, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 30 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: _buildVoiceCard(),
                        ),

                        const SizedBox(height: 20),

                        // Phase 5 — Info Card with entrance animation
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 1100),
                          tween: Tween(begin: 0, end: 1),
                          builder: (_, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 30 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: _buildInfoCard(),
                        ),

                        const SizedBox(height: 28),

                        // Phase 5 — Continue Button with entrance animation
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 1200),
                          tween: Tween(begin: 0, end: 1),
                          builder: (_, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 30 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: ContinueButton(
                            text: "आगे बढ़ें  →",
                            isLoading: _isSaving,
                            onPressed: _handleContinue,
                          ),
                        ),

                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            VoiceListeningOverlay(
              isListening: _isListening,
              recognizedText: _recognizedText,
              onCancel: _cancelListening,
            ),
          ],
        ),
      ),
    );
  }

  // Phase 1 — Google Translate Style Selector (with Phase 2 polish)
  Widget _buildLanguageSelector(LanguageModel selectedLanguage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: _green.withOpacity(.18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            //-----------------------------------------
            // COLLAPSED HEADER
            //-----------------------------------------

            InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: () {
                // Phase 2 — Auto focus search when opening
                setState(() {
                  _isExpanded = !_isExpanded;
                });

                if (_isExpanded) {
                  Future.delayed(
                    const Duration(milliseconds: 250),
                    () {
                      if (mounted) {
                        _searchFocusNode.requestFocus();
                      }
                    },
                  );
                } else {
                  _searchController.clear();
                  _searchFocusNode.unfocus();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                child: Row(
                  children: [

                    // Phase 2 — Rotate Globe Icon
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: _isExpanded
                            ? _green
                            : _green.withOpacity(.08),
                        shape: BoxShape.circle,
                      ),
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 350),
                        turns: _isExpanded ? .05 : 0,
                        child: Icon(
                          Icons.public,
                          color: _isExpanded
                              ? Colors.white
                              : _green,
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    // Phase 2 — Better Search Animation with AnimatedSwitcher
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        switchInCurve: Curves.easeOut,
                        switchOutCurve: Curves.easeIn,
                        child: !_isExpanded
                            ? Column(
                                key: const ValueKey("selected"),
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Language",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    selectedLanguage.nativeName,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              )
                            : LanguageSearchBar(
                                key: const ValueKey("search"),
                                controller: _searchController,
                                focusNode: _searchFocusNode,
                                onChanged: (_) {},
                                onVoicePressed: _startListening,
                              ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Phase 2 — Smooth Arrow
                    AnimatedRotation(
                      turns: _isExpanded ? .5 : 0,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: _isExpanded
                              ? _green.withOpacity(.08)
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 28,
                          color: _green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //-----------------------------------------
            // EXPANDED CONTENT
            //-----------------------------------------

            if (_isExpanded) ...[

              Divider(
                color: Colors.grey.shade200,
                height: 1,
              ),

              const SizedBox(height: 16),

              if (_recommended.isNotEmpty) ...[

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: const [

                      Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                        size: 18,
                      ),

                      SizedBox(width: 6),

                      Text(
                        "Recommended",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                RecommendedLanguages(
                  languages: _recommended,
                  selectedLanguage: selectedLanguage,
                  onLanguageSelected: (language) {
                    _selectLanguage(language);
                    _searchController.clear();
                    setState(() {
                      _isExpanded = false;
                    });
                  },
                ),

                const SizedBox(height: 20),
              ],

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "All Languages",
                  style: TextStyle(
                    color: _green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Phase 4 — Animate the language list with ListView.separated
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: _buildExpandedList(selectedLanguage),
              ),

              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }

  // Phase 3 — Premium Language List
  Widget _buildExpandedList(LanguageModel selectedLanguage) {
    final showRecommended =
        _searchController.text.trim().isEmpty &&
        _recommended.isNotEmpty;

    final listSource = showRecommended
        ? _filteredLanguages
            .where((e) => !_recommended.contains(e))
            .toList()
        : _filteredLanguages;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (listSource.isEmpty)

            // Phase 4 — Search Empty State
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                child: Column(
                  children: [

                    Icon(
                      Icons.travel_explore,
                      size: 52,
                      color: Colors.grey.shade400,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      "No matching language",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "Try another spelling",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            )

          else

            // Phase 4 — Animated list with staggered entrance
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listSource.length,

              separatorBuilder: (_, __) =>
                  const SizedBox(height: 8),

              itemBuilder: (context, index) {

                final language = listSource[index];

                return TweenAnimationBuilder<double>(
                  duration: Duration(
                    milliseconds: 180 + index * 40,
                  ),
                  tween: Tween(begin: 0, end: 1),

                  builder: (_, value, child) {

                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(
                          0,
                          25 * (1 - value),
                        ),
                        child: child,
                      ),
                    );
                  },

                  child: _buildModernLanguageTile(
                    language,
                    selectedLanguage,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  // Phase 3 — Modern Language Tile
  Widget _buildModernLanguageTile(
    LanguageModel language,
    LanguageModel selectedLanguage,
  ) {
    final selected = selectedLanguage.code == language.code;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        // Phase 4 — Better Selected Tile with gradient
        gradient: selected
            ? LinearGradient(
                colors: [
                  _green.withOpacity(.10),
                  Colors.white,
                ],
              )
            : null,
        color: selected ? null : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: selected
              ? _green
              : Colors.grey.shade200,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        // Phase 4 — Ripple Effect
        splashColor: _green.withOpacity(.10),
        highlightColor: Colors.transparent,
        hoverColor: _green.withOpacity(.03),
        onTap: () {
          _selectLanguage(language);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 15,
          ),
          child: Row(
            children: [

              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? _green
                      : Colors.grey.shade100,
                ),
                child: Icon(
                  selected ? Icons.check : Icons.language,
                  color: selected
                      ? Colors.white
                      : Colors.grey.shade700,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      language.nativeName,
                      style: TextStyle(
                        fontWeight: selected
                            ? FontWeight.bold
                            : FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      language.englishName,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              // Phase 4 — Better Check Icon with AnimatedScale + AnimatedOpacity
              AnimatedScale(
                duration: const Duration(milliseconds: 220),
                scale: selected ? 1 : .6,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 220),
                  opacity: selected ? 1 : 0,
                  child: const Icon(
                    Icons.check_circle,
                    color: _green,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1)),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: _green, shape: BoxShape.circle),
          child: const Text(
            "या",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1)),
      ],
    );
  }

  // Phase 5 — Better Voice Card with gradient decoration
  Widget _buildVoiceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xff165C34),
            Color(0xff21864D),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff165C34).withOpacity(.22),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "बोलकर भाषा चुनें",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildSpeechBubble("अपनी भाषा\nमें बोलें")),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: _isListening ? _cancelListening : _startListening,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.95, end: _isListening ? 1.1 : 1.0),
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  builder: (context, scale, child) =>
                      Transform.scale(scale: scale, child: child),
                  child: Container(
                    width: 84,
                    height: 84,
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: Icon(Icons.mic_rounded, color: _green, size: 38),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: _buildSpeechBubble("जैसे: हिन्दी,\nEnglish, தமிழ்")),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "मुझे सुनें और भाषा चुनें",
            style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.85), fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeechBubble(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 6, offset: const Offset(0, 3)),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12, color: _darkBrown, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _yellowCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Text("💡", style: TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "आप कभी भी दूसरी भाषा में बदल सकते हैं",
              style: const TextStyle(color: _darkBrown, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}