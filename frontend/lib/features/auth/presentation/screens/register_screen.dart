import 'package:flutter/material.dart';

import '../../../../core/localization/language_model.dart';

import '../widgets/phone_input_card.dart';
import '../widgets/otp_verification_card.dart';
import '../widgets/password_card.dart';
import '../widgets/welcome_message_card.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool otpSent = false;
  bool otpVerified = false;
  bool passwordsValid = false;

  // TODO:
  // Replace this with your actual selected language
  late LanguageModel currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F5F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              const Center(
                child: FlutterLogo(size: 75),
              ),

              const SizedBox(height: 25),

              WelcomeMessageCard(
                language: currentLanguage,
              ),

              const SizedBox(height: 28),

              PhoneInputCard(
                onOtpSent: () {
                  setState(() {
                    otpSent = true;
                  });
                },
              ),

              if (otpSent) ...[
                const SizedBox(height: 25),

                OtpVerificationCard(
                  onVerified: () {
                    setState(() {
                      otpVerified = true;
                    });
                  },
                ),
              ],

              if (otpVerified) ...[
                const SizedBox(height: 25),

                PasswordCard(
                  onValid: (value) {
                    setState(() {
                      passwordsValid = value;
                    });
                  },
                ),
              ],

              if (passwordsValid) ...[
                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO
                    },
                    child: const Text(
                      "Aage Badhein",
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}