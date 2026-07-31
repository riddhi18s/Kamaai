import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../data/models/kaam_entry_type.dart';
import '../navigation/kaam_khata_navigation.dart';
import '../providers/kaam_khata_providers.dart';
import '../providers/naya_kaam_form_provider.dart';
import '../widgets/kaam_khata_bottom_nav.dart';
import '../widgets/kaam_khata_top_bar.dart';
import '../widgets/kaam_type_selector.dart';
import '../widgets/voice_amount_field.dart';
import '../widgets/voice_location_field.dart';

/// "Darj" tab of Kaam Khata — form to record a new daily or fixed/Mahavari
/// income entry.
class NayaKaamDarjScreen extends ConsumerWidget {
  const NayaKaamDarjScreen({super.key});

  Future<void> _pickPeriodDate(
    BuildContext context,
    WidgetRef ref, {
    required bool isStart,
  }) async {
    final notifier = ref.read(nayaKaamFormProvider.notifier);
    final current = ref.read(nayaKaamFormProvider);
    final initial = isStart ? current.periodStart : current.periodEnd;

    final picked = await showDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked == null) return;

    if (isStart) {
      notifier.setPeriodStart(picked);
    } else {
      notifier.setPeriodEnd(picked);
    }
  }

  Future<void> _pickSingleDate(BuildContext context, WidgetRef ref) async {
    final notifier = ref.read(nayaKaamFormProvider.notifier);
    final current = ref.read(nayaKaamFormProvider);

    final picked = await showDatePicker(
      context: context,
      initialDate: current.date ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked == null) return;
    notifier.setDate(picked);
  }

  Future<void> _submit(BuildContext context, WidgetRef ref) async {
    final notifier = ref.read(nayaKaamFormProvider.notifier);
    final formState = ref.read(nayaKaamFormProvider);

    if (formState.amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.kaamKhataErrorAmount)),
      );
      return;
    }

    final success = await notifier.submit();
    if (!context.mounted) return;

    if (success) {
      ref.invalidate(kaamEntriesProvider);
      ref.invalidate(allKaamEntriesProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.kaamKhataSavedSuccess)),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.kaamKhataSaveFailed)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(nayaKaamFormProvider);
    final notifier = ref.read(nayaKaamFormProvider.notifier);
    final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const KaamKhataTopBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.kaamKhataNewEntryTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSizes.lg),
            Text(
              context.l10n.kaamKhataTypeLabel.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textHint,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSizes.sm),
            KaamTypeSelector(selected: formState.type, onChanged: notifier.setType),
            const SizedBox(height: AppSizes.xl),
            _SectionCard(
              title: context.l10n.kaamKhataAmountLabel,
              child: VoiceAmountField(
                amount: formState.amount,
                onChanged: notifier.setAmount,
              ),
            ),
            const SizedBox(height: AppSizes.lg),
            if (formState.type == KaamEntryType.daily)
              _SectionCard(
                title: context.l10n.kaamKhataDateLabel,
                child: _DatePickerField(
                  label: formState.date != null
                      ? DateFormat('dd/MM/yyyy', locale).format(formState.date!)
                      : '',
                  onTap: () => _pickSingleDate(context, ref),
                ),
              )
            else
              _SectionCard(
                title: context.l10n.kaamKhataPeriodLabel,
                child: Row(
                  children: [
                    Expanded(
                      child: _DatePickerField(
                        caption: context.l10n.kaamKhataPeriodStart,
                        label: formState.periodStart != null
                            ? DateFormat('dd/MM/yyyy', locale)
                                .format(formState.periodStart!)
                            : '',
                        onTap: () =>
                            _pickPeriodDate(context, ref, isStart: true),
                      ),
                    ),
                    const SizedBox(width: AppSizes.md),
                    Expanded(
                      child: _DatePickerField(
                        caption: context.l10n.kaamKhataPeriodEnd,
                        label: formState.periodEnd != null
                            ? DateFormat('dd/MM/yyyy', locale)
                                .format(formState.periodEnd!)
                            : '',
                        onTap: () =>
                            _pickPeriodDate(context, ref, isStart: false),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: AppSizes.lg),
            _SectionCard(
              title: context.l10n.kaamKhataLocationLabel,
              child: VoiceLocationField(
                location: formState.location,
                onChanged: notifier.setLocation,
              ),
            ),
            const SizedBox(height: AppSizes.xxl),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: formState.isSaving ? null : () => _submit(context, ref),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                  ),
                ),
                child: formState.isSaving
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.4,
                        ),
                      )
                    : Text(
                        context.l10n.kaamKhataSaveButton,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: AppSizes.md),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                onPressed: () => KaamKhataNavigation.goHome(context),
                child: Text(context.l10n.kaamKhataBackButton),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const KaamKhataBottomNav(currentTab: KaamKhataTab.darj),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textHint,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          child,
        ],
      ),
    );
  }
}

class _DatePickerField extends StatelessWidget {
  const _DatePickerField({
    required this.label,
    required this.onTap,
    this.caption,
  });

  final String label;
  final String? caption;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusXL),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusXL),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (caption != null)
                  Text(
                    caption!,
                    style: const TextStyle(fontSize: 11, color: AppColors.textHint),
                  ),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Icon(Icons.calendar_today_rounded, size: 18, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
