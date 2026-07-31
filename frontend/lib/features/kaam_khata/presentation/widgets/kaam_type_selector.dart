import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../data/models/kaam_entry_type.dart';

class KaamTypeSelector extends StatelessWidget {
  const KaamTypeSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final KaamEntryType selected;
  final ValueChanged<KaamEntryType> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _TypeCard(
            icon: Icons.wb_sunny_rounded,
            label: context.tr('kaamKhataTypeDaily'),
            selected: selected == KaamEntryType.daily,
            onTap: () => onChanged(KaamEntryType.daily),
          ),
        ),
        const SizedBox(width: AppSizes.md),
        Expanded(
          child: _TypeCard(
            icon: Icons.calendar_month_rounded,
            label: context.tr('kaamKhataTypeFixed'),
            selected: selected == KaamEntryType.fixed,
            onTap: () => onChanged(KaamEntryType.fixed),
          ),
        ),
      ],
    );
  }
}

class _TypeCard extends StatelessWidget {
  const _TypeCard({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusXL),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.lg),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryLight : AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusXL),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 24,
              color: selected ? AppColors.primary : AppColors.textSecondary,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
