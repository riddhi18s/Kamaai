import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class KamaiCalendar extends StatelessWidget {
  const KamaiCalendar({
    super.key,
    required this.month,
    required this.incomeDays,
    this.selectedDay,
    this.onDaySelected,
  });

  final DateTime month;
  final Set<int> incomeDays;
  final int? selectedDay;
  final ValueChanged<DateTime>? onDaySelected;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final firstOfMonth = DateTime(month.year, month.month, 1);
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    // DateTime.weekday: Mon=1..Sun=7. We want Sunday-first columns.
    final leadingBlanks = firstOfMonth.weekday % 7;
    final today = DateTime.now();

    final weekdayLabels = List.generate(7, (i) {
      final refSunday = DateTime(2024, 1, 7); // a known Sunday
      final label = DateFormat.E(locale).format(refSunday.add(Duration(days: i)));
      return label.length > 2 ? label.substring(0, 2) : label;
    });

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            DateFormat.yMMMM(locale).format(month),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          Row(
            children: weekdayLabels
                .map(
                  (label) => Expanded(
                    child: Center(
                      child: Text(
                        label,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textHint,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppSizes.sm),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
            itemCount: leadingBlanks + daysInMonth,
            itemBuilder: (context, index) {
              if (index < leadingBlanks) return const SizedBox.shrink();

              final day = index - leadingBlanks + 1;
              final date = DateTime(month.year, month.month, day);
              final hasIncome = incomeDays.contains(day);
              final isToday = date.year == today.year &&
                  date.month == today.month &&
                  date.day == today.day;
              final isSelected = selectedDay == day;

              return Padding(
                padding: const EdgeInsets.all(3),
                child: InkWell(
                  onTap: onDaySelected == null ? null : () => onDaySelected!(date),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected || hasIncome
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: isToday && !hasIncome && !isSelected
                          ? Border.all(color: AppColors.primary, width: 1.4)
                          : null,
                    ),
                    child: Text(
                      '$day',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: hasIncome || isSelected
                            ? Colors.white
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
