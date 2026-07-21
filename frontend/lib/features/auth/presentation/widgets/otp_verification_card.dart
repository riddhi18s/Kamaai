import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/auth_text_model.dart';

class PhoneInputCard extends StatefulWidget {
  final AuthTextModel texts;
  final Function(String phone) onPhoneChanged;

  const PhoneInputCard({
    super.key,
    required this.texts,
    required this.onPhoneChanged,
  });

  @override
  State<PhoneInputCard> createState() =>
      _PhoneInputCardState();
}

class _PhoneInputCardState
    extends State<PhoneInputCard> {
  final TextEditingController _controller =
      TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

          const SizedBox(height: 18),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.texts.phoneTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff165C34),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.texts.phoneHinglish,
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
                  // TODO:
                  // TTSService.instance.speak(
                  // widget.texts.phoneVoiceMessage,
                  // );
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
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            cursorColor: const Color(0xff165C34),

            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),

            autofillHints: const [
              AutofillHints.telephoneNumber,
            ],

            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],

            onChanged: widget.onPhoneChanged,

            decoration: InputDecoration(
              hintText: widget.texts.phoneHint,

              hintStyle: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),

              filled: true,
              fillColor: const Color(0xffF6F5F2),

              prefixIcon: Container(
                width: 90,
                alignment: Alignment.center,
                child: const Text(
                  "🇮🇳 +91",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff165C34),
                  ),
                ),
              ),

              prefixIconConstraints:
                  const BoxConstraints(
                minWidth: 90,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xff165C34),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.lock_outline_rounded,
                color: Colors.green,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.texts.phoneSecurity,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}