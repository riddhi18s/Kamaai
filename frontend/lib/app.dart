import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_routes.dart';

// ===========================
// LOCALIZATION
// ===========================
import 'generated/app_localizations.dart';

// ===========================
// SPLASH
// ===========================
import 'features/splash/presentation/screens/splash_screen.dart';

// ===========================
// LANGUAGE
// ===========================
import 'features/language/presentation/providers/language_provider.dart';
import 'features/language/presentation/screens/language_selection_screen.dart';

// ===========================
// AUTHENTICATION
// ===========================
import 'features/auth/screens/auth_selection_screen.dart';
import 'features/auth/screens/auth_screen.dart';

// ===========================
// PROFILE
// ===========================
import 'features/profile/screens/profile_setup_screen.dart';

// ===========================
// DASHBOARD
// ===========================
import 'features/dashboard/presentation/screens/dashboard_screen.dart';

// ===========================
// KAAM KHATA
// ===========================
import 'features/kaam_khata/presentation/screens/kaam_khata_home_screen.dart';
import 'features/kaam_khata/presentation/screens/naya_kaam_darj_screen.dart';
import 'features/kaam_khata/presentation/screens/itihaas_screen.dart';
import 'features/kaam_khata/presentation/screens/income_certificate_screen.dart';

// ===========================
// MANDI BHAV
// Uncomment after creating the screen.
// ===========================
// import 'features/mandi_bhav/presentation/screens/mandi_bhav_home_screen.dart';

class KamaaiApp extends ConsumerWidget {
  const KamaaiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kamaai',

      locale: Locale(language.code),

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),

      initialRoute: AppRoutes.splash,

      routes: {
        // ===========================
        // Splash
        // ===========================
        AppRoutes.splash: (_) => const SplashScreen(),

        // ===========================
        // Language
        // ===========================
        AppRoutes.language: (_) => const LanguageSelectionScreen(),

        // ===========================
        // Authentication
        // ===========================
        AppRoutes.authSelection: (_) => const AuthSelectionScreen(),
        AppRoutes.register: (_) => const AuthScreen(),
        AppRoutes.login: (_) => const AuthSelectionScreen(),
        AppRoutes.otp: (_) => const AuthSelectionScreen(),

        // ===========================
        // Profile
        // ===========================
        AppRoutes.profileSetup: (_) => const ProfileSetupScreen(),
        AppRoutes.profile: (_) => const ProfileSetupScreen(),

        // ===========================
        // Dashboard
        // ===========================
        AppRoutes.dashboard: (_) => const DashboardScreen(),

        // ===========================
        // Kaam Khata
        // ===========================
        AppRoutes.kaamKhata: (_) => const KaamKhataHomeScreen(),
        AppRoutes.nayaKaamDarj: (_) => const NayaKaamDarjScreen(),
        AppRoutes.kaamItihaas: (_) => const ItihaasScreen(),
        AppRoutes.incomeCertificate: (_) =>
             IncomeCertificateScreen(),

        // ===========================
        // Mandi Bhav
        // Uncomment after creating the screen.
        // ===========================
        // AppRoutes.mandiBhav: (_) => const MandiBhavHomeScreen(),
      },
    );
  }
}