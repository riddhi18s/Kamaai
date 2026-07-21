import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kamaai/generated/app_localizations.dart';
import 'package:kamaai/features/language/data/tts_service.dart';

class PhoneInputCard extends StatefulWidget {
  final String phoneVoiceMessage;
  final VoidCallback onOtpSent;

  const PhoneInputCard({
    super.key,
    required this.phoneVoiceMessage,
    required this.onOtpSent,
  });

  @override
  State<PhoneInputCard> createState() => _PhoneInputCardState();
}

class _PhoneInputCardState extends State<PhoneInputCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendOtp() {
    if (_controller.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid 10-digit phone number"),
        ),
      );
      return;
    }

    // TODO:
    // Integrate Firebase/Auth API OTP sending here.

    widget.onOtpSent();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: const BoxDecoration(
              color: Color(0xffF6F5F2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.call_rounded,
              color: Color(0xff165C34),
              size: 30,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      l10n.phoneTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff165C34),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.phoneHinglish,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  await TTSService.instance.speak(
                    widget.phoneVoiceMessage,
                  );
                },
                icon: const Icon(
                  Icons.volume_up_rounded,
                  color: Color(0xff165C34),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          TextField(
            controller: _controller,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            cursorColor: const Color(0xff165C34),
            autofillHints: const [
              AutofillHints.telephoneNumber,
            ],
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              counterText: "",
              prefixIcon: Container(
                width: 80,
                alignment: Alignment.center,
                child: const Text(
                  "🇮🇳 +91",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff165C34),
                  ),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 80,
              ),
              hintText: l10n.phoneHint,
              hintStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              filled: true,
              fillColor: const Color(0xffF6F5F2),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xff165C34),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(
                Icons.lock_outline,
                color: Colors.green,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.phoneSecurity,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: _sendOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff165C34),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                l10n.sendOtp,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}