import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../language/data/tts_service.dart';
import '../navigation/kaam_khata_navigation.dart';
import '../providers/kaam_khata_providers.dart';
import '../widgets/kaam_khata_bottom_nav.dart';
import '../widgets/kaam_khata_top_bar.dart';
import '../widgets/kamai_calendar.dart';
import '../widgets/kamai_stats_row.dart';
import '../widgets/kamai_summary_card.dart';

/// "Ghar" tab of Kaam Khata — today's earning, monthly stats, and an
/// income calendar for the selected month.
class KaamKhataHomeScreen extends ConsumerStatefulWidget {
  const KaamKhataHomeScreen({super.key});

  @override
  ConsumerState<KaamKhataHomeScreen> createState() =>
      _KaamKhataHomeScreenState();
}

class _KaamKhataHomeScreenState extends ConsumerState<KaamKhataHomeScreen> {
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    TTSService.initialize();
  }

  @override
  void dispose() {
    TTSService.stop();
    super.dispose();
  }

  Future<void> _speakSummary(KaamKhataStats stats) async {
    if (_isSpeaking) {
      await TTSService.stop();
      if (mounted) setState(() => _isSpeaking = false);
      return;
    }

    final text =
        '${context.l10n.kaamKhataTodayEarningLabel} ₹${stats.todayEarning.toStringAsFixed(0)}. '
        '${context.l10n.kaamKhataStatMonthTotal} ₹${stats.monthTotal.toStringAsFixed(0)}.';
    final languageCode = Localizations.localeOf(context).languageCode;

    setState(() => _isSpeaking = true);
    await TTSService.speak(
      text: text,
      languageCode: languageCode,
      onComplete: () {
        if (mounted) setState(() => _isSpeaking = false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final month = ref.watch(selectedKaamMonthProvider);
    final stats = ref.watch(kaamKhataStatsProvider);
    final incomeDays = ref.watch(kaamIncomeDaysProvider);
    final entriesAsync = ref.watch(kaamEntriesProvider);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const KaamKhataTopBar(),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(kaamEntriesProvider),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(AppSizes.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.kaamKhataSubtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: AppSizes.md),
              KamaiSummaryCard(
                todayEarning: stats.todayEarning,
                isSpeaking: _isSpeaking,
                onSunoTap: () => _speakSummary(stats),
              ),
              const SizedBox(height: AppSizes.lg),
              KamaiStatsRow(stats: stats),
              const SizedBox(height: AppSizes.xl),
              entriesAsync.when(
                data: (_) => KamaiCalendar(month: month, incomeDays: incomeDays),
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.xxl),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, st) =>
                    KamaiCalendar(month: month, incomeDays: incomeDays),
              ),
              const SizedBox(height: AppSizes.xl),
              _IncomeCertificateEntryCard(
                onTap: () => KaamKhataNavigation.goToCertificate(context, ref),
              ),
              const SizedBox(height: AppSizes.giant),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => KaamKhataNavigation.goToDarj(context),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.kaamKhataAddEntry),
      ),
      bottomNavigationBar: const KaamKhataBottomNav(currentTab: KaamKhataTab.home),
    );
  }
}

/// Home-screen entry point into the Income Certificate flow (in addition
/// to the bottom nav's Certificate tab).
class _IncomeCertificateEntryCard extends StatelessWidget {
  const _IncomeCertificateEntryCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusXL),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSizes.lg),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(AppSizes.radiusXL),
          border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            const Icon(Icons.description_rounded, color: AppColors.primary, size: 28),
            const SizedBox(width: AppSizes.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.kaamKhataCertificateTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    context.l10n.kaamKhataCertificateSelfDeclared,
                    style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
