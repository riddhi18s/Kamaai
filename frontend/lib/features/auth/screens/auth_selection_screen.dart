import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../core/constants/app_routes.dart';
import '../../../core/extensions/locale_extensions.dart';

import '../../../features/language/presentation/providers/language_provider.dart';
import '../../language/data/stt_service.dart';
import '../../language/data/tts_service.dart';
import '../../../core/localization/supported_languages.dart';

class AuthSelectionScreen extends ConsumerStatefulWidget {
  const AuthSelectionScreen({super.key});

  @override
  ConsumerState<AuthSelectionScreen> createState() =>
      _AuthSelectionScreenState();
}

class _AuthSelectionScreenState
    extends ConsumerState<AuthSelectionScreen> {
  bool _isListening = false;
  bool _isSpeaking = false;
  bool _pageReady = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initialize();
    });
  }

  Future<void> _initialize() async {

    await STTService.initialize();
    await TTSService.initialize();

    final language =
        ref.read(languageProvider);

    setState(() {
      _pageReady = true;
    });

    _speakGreeting(language.greeting, language.speechLocale);
  }

  Future<void> _speakGreeting(
    String text,
    String language,
  ) async {

    if (_isSpeaking) return;

    setState(() {
      _isSpeaking = true;
    });

    await TTSService.speak(
      text: text,
      languageCode: language,
      onComplete: () {
        if (!mounted) return;

        setState(() {
          _isSpeaking = false;
        });
      },
    );
  }

  Future<void> _startVoiceCommand() async {
    if (_isListening) return;

    final language =
        ref.read(languageProvider);

    HapticFeedback.mediumImpact();

    await TTSService.stop();

    setState(() {
      _isListening = true;
    });

    await STTService.startListening(
      localeId: language.speechLocale,
      onResult: (text) {
        _handleVoiceCommand(text);
      },
      onComplete: () {
        if (!mounted) return;

        setState(() {
          _isListening = false;
        });
      },
    );
  }

  void _handleVoiceCommand(String text) {
    final command = text.toLowerCase().trim();

    debugPrint("VOICE COMMAND: $command");

    //---------------------------
    // LOGIN
    //---------------------------
    if (command.contains("login") ||
        command.contains("log in") ||
        command.contains("लॉगिन")) {
       Navigator.pushNamed(
  context,
  AppRoutes.login,
);
      return;
    }

    //---------------------------
    // REGISTER
    //---------------------------
    if (command.contains("register") ||
        command.contains("sign up") ||
        command.contains("create account") ||
        command.contains("naya khata") ||
        command.contains("नया खाता")) {
        Navigator.pushNamed(
  context,
  AppRoutes.register,
);
      return;
    }

    //---------------------------
    // LANGUAGE
    //---------------------------
    if (command.contains("language") ||
        command.contains("change language") ||
        command.contains("भाषा")) {
     Navigator.pushNamed(
  context,
  AppRoutes.language,
);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          context.l10n.voiceCommandNotRecognized,
        ),
      ),
    );
  }

  Widget _buildSpeakerButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () async {
        if (_isSpeaking) {
           await TTSService.stop();

          if (mounted) {
            setState(() {
              _isSpeaking = false;
            });
          }

          return;
        }

        setState(() {
          _isSpeaking = true;
        });

        await _readWholeScreen();

        if (mounted) {
          setState(() {
            _isSpeaking = false;
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _isSpeaking
              ? const Color(0xff2E7D32)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          _isSpeaking ? Icons.stop_rounded : Icons.volume_up_rounded,
          color: _isSpeaking
              ? Colors.white
              : const Color(0xff2E7D32),
        ),
      ),
    );
  }

  String _screenText() {
  final language = ref.read(languageProvider);

  return [
    language.greeting,
    language.hinglishGreeting,
    context.l10n.authSelectionSubtitle,
    context.l10n.createAccount,
    context.l10n.createAccountSubtitle,
    context.l10n.login,
    context.l10n.loginSubtitle,
    context.l10n.voiceAssistant,
    context.l10n.voiceAssistantSubtitle,
  ].join('\n\n');
}

 Future<void> _readWholeScreen() async {
  final language = ref.read(languageProvider);

  await TTSService.speak(
    text: _screenText(),
    languageCode: language.speechLocale,
    onComplete: () {
      if (!mounted) return;

      setState(() {
        _isSpeaking = false;
      });
    },
  );
}
  

  @override
  Widget build(BuildContext context) {

    final language =
        ref.watch(languageProvider);

    return Scaffold(

      backgroundColor: const Color(0xffF7FAF5),

      body: SafeArea(

        child: AnimatedOpacity(

          opacity: _pageReady ? 1 : 0,

          duration: const Duration(
            milliseconds: 500,
          ),

          child: SingleChildScrollView(

            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 18,
            ),

            child: Column(

              children: [

                //-----------------------------------------
                // Top Bar
                //-----------------------------------------

                Row(

                  children: [

                    const Spacer(),
                      _buildSpeakerButton(),

                    const SizedBox(width: 12),
                    PopupMenuButton(
                      offset: const Offset(0, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onSelected: (selectedLanguage) async {
                        final notifier = ref.read(languageProvider.notifier);

                        notifier.setLanguage(selectedLanguage);

                        await notifier.saveLanguage();

                        if (mounted) {
                          setState(() {});
                        }
                      },
                      itemBuilder: (context) {
                        return SupportedLanguages.all.map((lang) {
                          return PopupMenuItem(
                            value: lang,
                            child: Row(
                              children: [
                                if (lang.code == language.code)
                                  const Icon(
                                    Icons.check,
                                    color: Color(0xff2E7D32),
                                    size: 18,
                                  ),

                                if (lang.code == language.code)
                                  const SizedBox(width: 8),

                                Text(lang.nativeName),
                              ],
                            ),
                          );
                        }).toList();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: Color(0xff2E7D32),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              language.nativeName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    )

                  ],

                )

                    .animate()
                    .fade(duration: 500.ms)
                    .slideY(
                      begin: -.25,
                    ),

                const SizedBox(height: 25),

                //-----------------------------------------
                // Logo
                //-----------------------------------------

                Hero(

                  tag: "kamaai_logo",

                  child: Container(

                    width: 120,
                    height: 120,

                    decoration: BoxDecoration(

                      color: Colors.white,

                      shape: BoxShape.circle,

                      boxShadow: [

                        BoxShadow(

                          color: Colors.green
                              .withOpacity(.15),

                          blurRadius: 30,

                          offset: const Offset(
                            0,
                            12,
                          ),

                        ),

                      ],

                    ),

                    child: const Icon(

                      Icons.handshake_rounded,

                      color: Color(0xff2E7D32),

                      size: 56,

                    ),

                  ),

                )

                    .animate()
                    .scale(
                      duration: 700.ms,
                    ),

                const SizedBox(height: 26),

                //-----------------------------------------
                // Welcome Card
                //-----------------------------------------

                Container(

                  width: double.infinity,

                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(26),

                    boxShadow: [

                      BoxShadow(

                        color: Colors.black12,

                        blurRadius: 20,

                        offset: const Offset(
                          0,
                          8,
                        ),

                      ),

                    ],

                  ),

                  child: Column(

                    children: [

                      Text(

                        language.greeting,

                        textAlign: TextAlign.center,

                        style: const TextStyle(

                          fontSize: 24,

                          fontWeight:
                              FontWeight.bold,

                          color: Color(0xff2E7D32),

                        ),

                      ),

                      const SizedBox(height: 10),

                      Text(

                        language.hinglishGreeting,

                        textAlign: TextAlign.center,

                        style: TextStyle(

                          fontSize: 15,

                          color:
                              Colors.grey.shade700,

                          height: 1.5,

                        ),

                      ),

                      const SizedBox(height: 18),

                      Container(

                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(

                          color: const Color(
                            0xffEAF7EE,
                          ),

                          borderRadius:
                              BorderRadius.circular(
                            100,
                          ),

                        ),

                        child: Text(

                          context.l10n.authSelectionSubtitle,

                          style: const TextStyle(

                            color:
                                Color(0xff2E7D32),

                            fontWeight:
                                FontWeight.w600,

                          ),

                        ),

                      ),

                    ],

                  ),

                )

                    .animate()
                    .fade(delay: 300.ms)
                    .slideY(begin: .15),

                const SizedBox(height: 28),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.08),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                    onTap: () {
  HapticFeedback.lightImpact();

  Navigator.pushNamed(
    context,
    AppRoutes.register,
  );
},
                      child: Padding(
                        padding: const EdgeInsets.all(22),
                        child: Row(
                          children: [
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                color: const Color(0xffE8F5E9),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Icon(
                                Icons.person_add_alt_1_rounded,
                                color: Color(0xff2E7D32),
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.l10n.createAccount,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    context.l10n.createAccountSubtitle,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xff2E7D32),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                    .animate()
                    .fade(delay: 450.ms)
                    .slideX(begin: -.15),

                const SizedBox(height: 18),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.08),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                     onTap: () {
  HapticFeedback.lightImpact();

  Navigator.pushNamed(
    context,
    AppRoutes.login,
  );
},
                      child: Padding(
                        padding: const EdgeInsets.all(22),
                        child: Row(
                          children: [
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                color: const Color(0xffFFF4E0),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Icon(
                                Icons.login_rounded,
                                color: Color(0xffF9A825),
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.l10n.login,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    context.l10n.loginSubtitle,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xffF9A825),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                    .animate()
                    .fade(delay: 650.ms)
                    .slideX(begin: .15),

                const SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff2E7D32),
                        Color(0xff43A047),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(.25),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white24,
                        child: IconButton(
                          icon: Icon(
                            _isListening
                                ? Icons.graphic_eq_rounded
                                : Icons.mic_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: _startVoiceCommand,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        context.l10n.voiceAssistant,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        context.l10n.voiceAssistantSubtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                )
                    .animate()
                    .fade(delay: 850.ms)
                    .slideY(begin: .20),

                const SizedBox(height: 40),
              ],

            ),

          ),

        ),

      ),

    );

  }

}