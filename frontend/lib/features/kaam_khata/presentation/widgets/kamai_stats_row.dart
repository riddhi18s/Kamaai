import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../providers/kaam_khata_providers.dart';

class KamaiStatsRow extends StatelessWidget {
  const KamaiStatsRow({super.key, required this.stats});

  final KaamKhataStats stats;

  String _compact(double value) {
    if (value >= 1000) {
      return '₹${(value / 1000).toStringAsFixed(1)}k';
    }
    return '₹${value.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context) {
    final currency =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

    return Row(
      children: [
        Expanded(
          child: _StatChip(
            value: _compact(stats.monthTotal),
            label: context.tr('kaamKhataStatMonthTotal'),
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: AppSizes.sm),
        Expanded(
          child: _StatChip(
            value: '${stats.daysWorked}',
            label: context.tr('kaamKhataStatDaysWorked'),
            color: AppColors.accent,
          ),
        ),
        const SizedBox(width: AppSizes.sm),
        Expanded(
          child: _StatChip(
            value: currency.format(stats.dailyAverage),
            label: context.tr('kaamKhataStatDailyAverage'),
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.value,
    required this.label,
    required this.color,
  });

  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: AppSizes.md, horizontal: AppSizes.sm),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
