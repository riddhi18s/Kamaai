import 'package:flutter/material.dart';

import '../../../../services/storage_service.dart';
import '../../../language/presentation/screens/language_selection_screen.dart';
// import '../../../auth/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final languageSelected =
        StorageService.isLanguageSelected();

    if (languageSelected) {
      // TODO:
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => const LoginScreen(),
      //   ),
      // );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LanguageSelectionScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4E8),
      body: Center(
        child: Image.asset(
          "assets/images/kamaai_logo.png",
          height: 160,
        ),
      ),
    );
  }
}