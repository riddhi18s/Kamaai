import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_voice_button.dart';

class DashboardGreetingCard extends StatelessWidget {
  final String userName;
  final String location;

  final VoidCallback onListen;
  final VoidCallback onVoice;

  final String greeting;
  final String locationLabel;

  const DashboardGreetingCard({
    super.key,
    required this.userName,
    required this.location,
    required this.onListen,
    required this.onVoice,
    required this.greeting,
    required this.locationLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.xl),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSizes.radiusXXL),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$greeting $userName",
                      style: AppTextStyles.greeting.copyWith(
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: Colors.white70,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "$locationLabel: $location",
                            style: AppTextStyles.body.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white.withOpacity(.2),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 34,
                ),
              ),
            ],
          ),

          // Note: hasKaamKhataData + totalIncome block yahan se hata diya.
          // Ye Income Certificate screen me aayega baad me.

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: context.l10n.listen,
                  expanded: false,
                  icon: Icons.volume_up_rounded,
                  onPressed: onListen,
                ),
              ),
              const SizedBox(width: 12),
              AppVoiceButton(onPressed: onVoice),
            ],
          ),
        ],
      ),
    );
  }
}