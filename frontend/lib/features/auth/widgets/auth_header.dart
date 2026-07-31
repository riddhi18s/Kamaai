import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.currentStep,
    required this.title,
    required this.subtitle,
  });

  final int currentStep;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        Hero(
          tag: "kamaai_logo",
          child: Image.asset(
            "assets/images/kamaai_logo.png",
            height: 90,
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          "KAMAAI",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
            color: Color(0xff1B5E20),
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          "Earn • Work • Grow",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 28),

        _ProgressIndicator(currentStep: currentStep),

        const SizedBox(height: 32),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
            height: 1.5,
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({
    required this.currentStep,
  });

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    const active = Color(0xff2E7D32);

    Widget circle(int number) {
      final enabled = currentStep >= number;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: enabled ? active : Colors.grey.shade300,
        ),
        child: Center(
          child: Text(
            "$number",
            style: TextStyle(
              color: enabled ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    Widget line(bool activeLine) {
      return Expanded(
        child: Container(
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: activeLine ? active : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            circle(1),
            line(currentStep > 1),
            circle(2),
            line(currentStep > 2),
            circle(3),
          ],
        ),

        const SizedBox(height: 14),

        const Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Phone",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "OTP",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Profile",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}