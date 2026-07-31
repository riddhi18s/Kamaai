import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../language/data/stt_service.dart';

class VoiceAmountField extends StatefulWidget {
  const VoiceAmountField({
    super.key,
    required this.amount,
    required this.onChanged,
  });

  final double amount;
  final ValueChanged<double> onChanged;

  @override
  State<VoiceAmountField> createState() => _VoiceAmountFieldState();
}

class _VoiceAmountFieldState extends State<VoiceAmountField> {
  late final TextEditingController _controller;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.amount == 0 ? '' : widget.amount.toStringAsFixed(0),
    );
  }

  @override
  void didUpdateWidget(covariant VoiceAmountField oldWidget) {
    super.didUpdateWidget(oldWidget);
    final text = widget.amount == 0 ? '' : widget.amount.toStringAsFixed(0);
    if (text != _controller.text) {
      _controller.value = TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
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
        final digits = RegExp(r'\d+').allMatches(text).map((m) => m.group(0)).join();
        if (digits.isEmpty) return;
        final value = double.tryParse(digits) ?? 0;
        _controller.text = value.toStringAsFixed(0);
        _controller.selection =
            TextSelection.collapsed(offset: _controller.text.length);
        widget.onChanged(value);
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
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          decoration: const InputDecoration(
            prefixText: '₹ ',
            prefixStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
          onChanged: (value) => widget.onChanged(double.tryParse(value) ?? 0),
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
                : context.tr('kaamKhataSpeakAmount'),
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
