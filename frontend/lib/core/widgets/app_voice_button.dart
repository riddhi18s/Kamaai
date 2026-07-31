import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../utils/app_icons.dart';

class AppVoiceButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isListening;

  const AppVoiceButton({
    super.key,
    required this.onPressed,
    this.isListening = false,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      elevation: 2,
      backgroundColor:
          isListening ? AppColors.error : AppColors.primary,
      onPressed: onPressed,
      child: Icon(
        AppIcons.mic,
        color: Colors.white,
        size: AppSizes.iconMedium,
      ),
    );
  }
}