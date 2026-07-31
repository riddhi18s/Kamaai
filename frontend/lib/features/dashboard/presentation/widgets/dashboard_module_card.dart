import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../language/data/tts_service.dart';
import '../../models/dashboard_module.dart';

class DashboardModuleCard extends StatefulWidget {
  final DashboardModule module;
  final VoidCallback onTap;

  final String Function(String key) titleBuilder;
  final String Function(String key) subtitleBuilder;

  const DashboardModuleCard({
    super.key,
    required this.module,
    required this.onTap,
    required this.titleBuilder,
    required this.subtitleBuilder,
  });

  @override
  State<DashboardModuleCard> createState() =>
      _DashboardModuleCardState();
}

class _DashboardModuleCardState extends State<DashboardModuleCard> {
  bool _isSpeaking = false;

  Future<void> _speak() async {
    if (_isSpeaking) {
      await TTSService.stop();
      if (mounted) {
        setState(() => _isSpeaking = false);
      }
      return;
    }

    final title = widget.titleBuilder(widget.module.titleKey);
    final subtitle = widget.subtitleBuilder(widget.module.subtitleKey);
    final languageCode =
        Localizations.localeOf(context).languageCode;

    setState(() => _isSpeaking = true);

    await TTSService.speak(
      text: "$title. $subtitle",
      languageCode: languageCode,
      onComplete: () {
        if (mounted) {
          setState(() => _isSpeaking = false);
        }
      },
    );
  }

  @override
  void dispose() {
    TTSService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: widget.onTap,
      padding: const EdgeInsets.all(AppSizes.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: widget.module.color.withOpacity(.16),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  widget.module.icon,
                  color: widget.module.color,
                  size: 30,
                ),
              ),

              const Spacer(),

              IconButton(
                onPressed: _speak,
                icon: Icon(
                  _isSpeaking
                      ? Icons.stop_circle_rounded
                      : Icons.volume_up_rounded,
                  color: widget.module.color,
                ),
                tooltip: "Speak",
              ),
            ],
          ),

          const Spacer(),

          Text(
            widget.titleBuilder(widget.module.titleKey),
            style: AppTextStyles.moduleTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),

          Text(
            widget.subtitleBuilder(widget.module.subtitleKey),
            style: AppTextStyles.moduleSubtitle.copyWith(
              color: Colors.grey.shade600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}