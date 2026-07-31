import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../../../core/localization/bilingual_text.dart';
import '../providers/auth_provider.dart';

// KAMAAI brand tokens (kept local to this widget file — UI only).
class _KColors {
  static const primaryGreen = Color(0xff2E7D32);
  static const lightGreen = Color(0xffE8F5E9);
  static const background = Color(0xffF6F8F5);
  static const accent = Color(0xffFFB300);
}

class OtpStep extends ConsumerWidget {
  const OtpStep({
    super.key,
    required this.onVerifyOtp,
    required this.onResendOtp,
    required this.phoneNumber,
  });

  final VoidCallback onVerifyOtp;
  final VoidCallback onResendOtp;
  final String phoneNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),

        // Header card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: _KColors.lightGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.sms_outlined,
                  color: _KColors.primaryGreen,
                  size: 30,
                ),
              ),

              const SizedBox(height: 16),

              BilingualText(
                textKey: "verifyOtp",
                nativeStyle: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff1B1B1B),
                ),
                secondaryStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "${context.l10n.otpSentTo}\n+91 $phoneNumber",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  height: 1.5,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Pin input
        PinCodeTextField(
          appContext: context,
          controller: notifier.otpController,
          length: 6,
          keyboardType: TextInputType.number,
          autoDisposeControllers: false,
          animationType: AnimationType.fade,
          animationDuration: const Duration(milliseconds: 200),
          cursorColor: _KColors.primaryGreen,
          enableActiveFill: true,
          beforeTextPaste: (text) => true,
          onChanged: notifier.updateOtp,
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff1B1B1B),
          ),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(16),
            fieldHeight: 56,
            fieldWidth: 46,
            borderWidth: 1.4,
            activeFillColor: _KColors.lightGreen,
            selectedFillColor: _KColors.lightGreen,
            inactiveFillColor: Colors.grey.shade100,
            inactiveColor: Colors.grey.shade300,
            selectedColor: _KColors.primaryGreen,
            activeColor: _KColors.primaryGreen,
          ),
        ),

        const SizedBox(height: 22),

        Center(
          child: TextButton.icon(
            onPressed: auth.isLoading ? null : onResendOtp,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: const Icon(Icons.refresh_rounded, size: 20),
            label: BilingualText(
              textKey: "sendOtp",
              nativeStyle: TextStyle(
                color: _KColors.primaryGreen,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
              secondaryStyle: TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ),
        ),

        const SizedBox(height: 28),

        // Primary CTA
        SizedBox(
          width: double.infinity,
          height: 58,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: auth.isOtpValid ? 1 : 0.55,
            child: ElevatedButton(
              onPressed: auth.isOtpValid
                  ? () {
                      FocusScope.of(context).unfocus();
                      onVerifyOtp();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _KColors.primaryGreen,
                disabledBackgroundColor: Colors.grey.shade300,
                foregroundColor: Colors.white,
                elevation: auth.isOtpValid ? 3 : 0,
                shadowColor: _KColors.primaryGreen.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: auth.isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    )
                  : BilingualText(
                      textKey: "verifyOtp",
                      nativeStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      secondaryStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
            ),
          ),
        ),

        const SizedBox(height: 22),

        Center(
          child: OutlinedButton.icon(
            onPressed: notifier.previousStep,
            icon: const Icon(Icons.arrow_back_rounded, size: 18),
            label: Text(
              context.l10n.changePhoneNumber,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: _KColors.primaryGreen,
              side: const BorderSide(
                color: _KColors.primaryGreen,
                width: 1.3,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 13,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}