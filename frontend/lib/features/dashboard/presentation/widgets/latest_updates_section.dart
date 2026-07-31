import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/section_title.dart';

class LatestUpdatesSection extends StatelessWidget {
  final String title;

  const LatestUpdatesSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final updates = <_UpdateItem>[
      _UpdateItem(
        icon: Icons.work_outline_rounded,
        color: AppColors.jobs,
        title: "New jobs available nearby",
        subtitle: "Check opportunities in your area.",
      ),
      _UpdateItem(
        icon: Icons.campaign_outlined,
        color: AppColors.primary,
        title: "Government scheme update",
        subtitle: "New benefits announced for workers.",
      ),
      _UpdateItem(
        icon: Icons.agriculture_outlined,
        color: AppColors.mandi,
        title: "Today's mandi prices",
        subtitle: "View the latest crop prices.",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),

        const SizedBox(height: AppSizes.md),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: updates.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppSizes.md),
          itemBuilder: (context, index) {
            final update = updates[index];

            return AppCard(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: update.color.withOpacity(.12),
                      borderRadius: BorderRadius.circular(
                        AppSizes.radiusLarge,
                      ),
                    ),
                    child: Icon(
                      update.icon,
                      color: update.color,
                    ),
                  ),

                  const SizedBox(width: AppSizes.md),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          update.title,
                          style: AppTextStyles.body.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          update.subtitle,
                          style:
                              AppTextStyles.bodySmall,
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textHint,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _UpdateItem {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  const _UpdateItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });
}