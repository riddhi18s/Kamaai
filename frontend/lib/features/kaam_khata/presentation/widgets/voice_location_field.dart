import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../language/data/stt_service.dart';

class VoiceLocationField extends StatefulWidget {
  const VoiceLocationField({
    super.key,
    required this.location,
    required this.onChanged,
  });

  final String? location;
  final ValueChanged<String> onChanged;

  @override
  State<VoiceLocationField> createState() => _VoiceLocationFieldState();
}

class _VoiceLocationFieldState extends State<VoiceLocationField> {
  late final TextEditingController _controller;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.location ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggleVoice() async {
    if (_isListening) {
      await STTService.stopListening();
      if (mounted) setState(() => _isListening = false);
      return;
    }

    setState(() => _isListening = true);
    final localeId =
        Localizations.localeOf(context).toLanguageTag().replaceAll('-', '_');

    await STTService.startListening(
      localeId: localeId,
      onResult: (text) {
        _controller.text = text;
        _controller.selection = TextSelection.collapsed(offset: text.length);
        widget.onChanged(text);
      },
      onComplete: () {
        if (mounted) setState(() => _isListening = false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          style: const TextStyle(fontSize: 16, color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: context.tr('kaamKhataLocationHint'),
          ),
          onChanged: widget.onChanged,
        ),
        const SizedBox(height: AppSizes.sm),
        OutlinedButton.icon(
          onPressed: _toggleVoice,
          icon: Icon(
            _isListening ? Icons.mic : Icons.mic_none_rounded,
            color: AppColors.accent,
          ),
          label: Text(
            _isListening
                ? context.tr('kaamKhataListening')
                : context.tr('kaamKhataSpeakLocation'),
            style: const TextStyle(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.accent.withOpacity(0.5)),
            backgroundColor: AppColors.accent.withOpacity(0.08),
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusXL),
            ),
          ),
        ),
      ],
    );
  }
}
