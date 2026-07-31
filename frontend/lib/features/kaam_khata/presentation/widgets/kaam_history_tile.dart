import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../data/models/kaam_entry_model.dart';
import '../../data/models/kaam_entry_type.dart';

class KaamHistoryTile extends StatelessWidget {
  const KaamHistoryTile({super.key, required this.entry, this.onTap});

  final KaamEntryModel entry;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final currency =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
    final isFixed = entry.type == KaamEntryType.fixed;

    final dateLabel = isFixed && entry.periodStart != null && entry.periodEnd != null
        ? '${DateFormat('d MMM', locale).format(entry.periodStart!)} '
            '${context.tr('kaamKhataToLabel')} '
            '${DateFormat('d MMM', locale).format(entry.periodEnd!)}'
        : DateFormat('EEE, d MMM', locale).format(entry.date);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusXL),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSizes.sm),
        padding: const EdgeInsets.all(AppSizes.lg),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppSizes.radiusXL),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            if (isFixed)
              Container(
                margin: const EdgeInsets.only(right: AppSizes.sm),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  context.tr('kaamKhataTypeFixed').toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateLabel,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (entry.location != null && entry.location!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      entry.location!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Text(
              currency.format(entry.amount),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.success,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right_rounded, color: AppColors.textHint, size: 20),
          ],
        ),
      ),
    );
  }
}
