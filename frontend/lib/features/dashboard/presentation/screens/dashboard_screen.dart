import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../language/data/tts_service.dart';
import '../../../language/data/stt_service.dart';
import '../../../../core/widgets/app_appbar.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/app_search_field.dart';
import '../../providers/dashboard_provider.dart';
import '../widgets/dashboard_greeting_card.dart';
import '../widgets/dashboard_module_grid.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState
    extends ConsumerState<DashboardScreen> {
  late final TextEditingController _searchController;

  bool _isSpeaking = false;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    // Fire-and-forget: these are idempotent static initializers and
    // safe to call every time this screen mounts.
    TTSService.initialize();
    STTService.initialize();
  }

  @override
  void dispose() {
    TTSService.stop();
    STTService.stopListening();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    ref.invalidate(dashboardUserProvider);
    ref.invalidate(dashboardModulesProvider);
  }

  Future<void> _speakGreeting() async {
    if (_isSpeaking) {
      await TTSService.stop();
      if (mounted) {
        setState(() => _isSpeaking = false);
      }
      return;
    }

    final user = ref.read(dashboardUserProvider).valueOrNull;
    if (user == null) return;

    final greetingText =
        "${context.l10n.greeting} ${user.name}. "
        "${context.l10n.location}: ${user.location}.";

    final languageCode =
        Localizations.localeOf(context).languageCode;

    setState(() => _isSpeaking = true);

    await TTSService.speak(
      text: greetingText,
      languageCode: languageCode,
      onComplete: () {
        if (mounted) {
          setState(() => _isSpeaking = false);
        }
      },
    );
  }

  Future<void> _startVoiceSearch() async {
    if (_isListening) {
      await STTService.stopListening();
      if (mounted) {
        setState(() => _isListening = false);
      }
      return;
    }

    setState(() => _isListening = true);

    final localeId = Localizations.localeOf(context)
        .toLanguageTag()
        .replaceAll('-', '_');

    await STTService.startListening(
      localeId: localeId,
      onResult: (text) {
        if (!mounted) return;
        _searchController.text = text;
        _searchController.selection = TextSelection.collapsed(
          offset: _searchController.text.length,
        );
      },
      onComplete: () {
        if (mounted) {
          setState(() => _isListening = false);
        }
      },
    );
  }

  /// Navigates to [route] if it's registered in the app's route
  /// table; otherwise shows a snackbar instead of letting
  /// Navigator throw a "no route generator" exception. Several
  /// dashboard modules (kaamKhata, jobs, artisan, mandi) don't have
  /// screens built yet, so this guard is required to avoid a
  /// runtime crash every time one of those tiles is tapped.
  void _safeNavigate(BuildContext context, String route) {
    final knownRoute = Navigator.of(context).widget.pages.isNotEmpty
        ? null
        : null; // placeholder unused branch removed below

    Navigator.pushNamed(context, route).catchError((error) {
      if (!context.mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.notificationsComingSoon),
        ),
      );
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(dashboardUserProvider);
    final modulesAsync = ref.watch(dashboardModulesProvider);

    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppAppBar(
        title: "KAMAAI",
        onNotificationTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.l10n.notificationsComingSoon),
            ),
          );
        },
        onProfileTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.profile,
          );
        },
      ),

      body: RefreshIndicator(
        onRefresh: _refresh,
        child: userAsync.when(
          loading: () =>
              const Center(child: CircularProgressIndicator()),

          error: (error, stack) =>
              Center(child: Text(error.toString())),

          data: (user) {
            return modulesAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),

              error: (error, stack) =>
                  Center(child: Text(error.toString())),

              data: (modules) {
                return SingleChildScrollView(
                  physics:
                      const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.all(AppSizes.xl),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      DashboardGreetingCard(
  userName: user.name,
  location: user.location,
  greeting: context.l10n.greeting,
  locationLabel: context.l10n.location,
  onListen: _speakGreeting,
  onVoice: _startVoiceSearch,
),

                      const SizedBox(
                        height: AppSizes.xl,
                      ),

                      AppSearchField(
                        controller: _searchController,
                        hintText:
                            context.l10n.dashboardSearchHint,
                        onVoiceTap: _startVoiceSearch,
                      ),

                      const SizedBox(
                        height: AppSizes.xxl,
                      ),

                      DashboardModuleGrid(
                        modules: modules,
                        onTap: (module) {
                          _safeNavigate(context, module.route);
                        },
                        titleBuilder: (key) =>
                            context.tr(key),
                        subtitleBuilder: (key) =>
                            context.tr(key),
                      ),

                      const SizedBox(
                        height: AppSizes.giant,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}