import 'package:flutter/material.dart';

import '../features/splash/presentation/screens/splash_screen.dart';
import 'theme/app_theme.dart';

class KamaaiApp extends StatelessWidget {
  const KamaaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kamaai',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}