import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../language/data/tts_service.dart';
import '../../data/models/kaam_entry_model.dart';
import '../providers/kaam_khata_providers.dart';
import '../widgets/kaam_history_tile.dart';
import '../widgets/kaam_khata_bottom_nav.dart';
import '../widgets/kaam_khata_top_bar.dart';

/// "Itihaas" tab of Kaam Khata — the selected month's full work history,
/// with a Suno (TTS) summary.
class ItihaasScreen extends ConsumerStatefulWidget {
  const ItihaasScreen({super.key});

  @override
  ConsumerState<ItihaasScreen> createState() => _ItihaasScreenState();
}

class _ItihaasScreenState extends ConsumerState<ItihaasScreen> {
  bool _isSpeaking = false;

  Future<void> _speakAll(List<KaamEntryModel> entries, KaamKhataStats stats) async {
    if (_isSpeaking) {
      await TTSService.stop();
      if (mounted) setState(() => _isSpeaking = false);
      return;
    }

    final text = '${context.l10n.kaamKhataHistoryTotalLabel} '
        '₹${stats.monthTotal.toStringAsFixed(0)}. '
        '${stats.daysWorked} ${context.l10n.kaamKhataDinLabel}.';

    setState(() => _isSpeaking = true);
    await TTSService.speak(
      text: text,
      languageCode: Localizations.localeOf(context).languageCode,
      onComplete: () {
        if (mounted) setState(() => _isSpeaking = false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final month = ref.watch(selectedKaamMonthProvider);
    final stats = ref.watch(kaamKhataStatsProvider);
    final entriesAsync = ref.watch(kaamEntriesProvider);
    final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const KaamKhataTopBar(),
      body: entriesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(e.toString())),
        data: (entries) {
          return ListView(
            padding: const EdgeInsets.all(AppSizes.xl),
            children: [
              Text(
                context.l10n.kaamKhataHistoryTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSizes.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.kaamKhataListenFullHistory,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                  TextButton.icon(
                    onPressed: () => _speakAll(entries, stats),
                    icon: Icon(
                      _isSpeaking ? Icons.volume_up_rounded : Icons.volume_up_outlined,
                      size: 18,
                    ),
                    label: Text(context.l10n.kaamKhataSuno),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.sm),
              Row(
                children: [
                  Text(
                    DateFormat.yMMMM(locale).format(month),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppSizes.md),
                  Text(
                    '₹${stats.monthTotal.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.sm),
              Wrap(
                spacing: AppSizes.sm,
                children: [
                  _MiniChip(label: '${stats.daysWorked} ${context.l10n.kaamKhataDinLabel}'),
                  _MiniChip(
                    label:
                        '${context.l10n.kaamKhataStatDailyAverage} ₹${stats.dailyAverage.toStringAsFixed(0)}',
                  ),
                  if (stats.mahavariCount > 0)
                    _MiniChip(
                      label: '${stats.mahavariCount} ${context.l10n.kaamKhataTypeFixed}',
                      highlight: true,
                    ),
                ],
              ),
              const SizedBox(height: AppSizes.xl),
              if (entries.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.giant),
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.receipt_long_outlined,
                          size: 48,
                          color: AppColors.textHint,
                        ),
                        const SizedBox(height: AppSizes.sm),
                        Text(
                          context.l10n.kaamKhataNoEntries,
                          style: const TextStyle(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                )
              else
                ...entries.map((entry) => KaamHistoryTile(entry: entry)),
            ],
          );
        },
      ),
      bottomNavigationBar: const KaamKhataBottomNav(currentTab: KaamKhataTab.itihaas),
    );
  }
}

class _MiniChip extends StatelessWidget {
  const _MiniChip({required this.label, this.highlight = false});

  final String label;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: highlight ? AppColors.primaryLight : AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: highlight ? AppColors.primary : AppColors.border),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: highlight ? AppColors.primary : AppColors.textSecondary,
        ),
      ),
    );
  }
}
