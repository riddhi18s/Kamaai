import 'package:flutter/material.dart';

import '../widgets/phone_number_card.dart';
import '../widgets/otp_verification_card.dart';
import '../widgets/password_card.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool otpSent = false;
  bool otpVerified = false;
  bool passwordsValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F5F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Create Account"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              PhoneNumberCard(
                onOtpSent: () {
                  setState(() {
                    otpSent = true;
                  });
                },
              ),

              const SizedBox(height: 20),

              if (otpSent)
                OtpVerificationCard(
                  onVerified: () {
                    setState(() {
                      otpVerified = true;
                    });
                  },
                ),

              const SizedBox(height: 20),

              if (otpVerified)
                PasswordCard(
                  onValid: (value) {
                    setState(() {
                      passwordsValid = value;
                    });
                  },
                ),

              const SizedBox(height: 30),

              if (passwordsValid)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Continue"),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}