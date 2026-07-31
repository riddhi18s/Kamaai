class AppRoutes {
  AppRoutes._();

  // ===========================
  // Splash
  // ===========================
  static const String splash = '/';

  // ===========================
  // Language
  // ===========================
  static const String language = '/language';

  // ===========================
  // Authentication
  // ===========================
  static const String authSelection = '/auth-selection';
  static const String register = '/register';
  static const String login = '/login';
  static const String otp = '/otp';

  // ===========================
  // User
  // ===========================
  static const String profileSetup = '/profile-setup';
  static const String profile = '/profile';
  static const String dashboard = '/dashboard';

  // ===========================
  // Kaam Khata
  // ===========================
  static const String kaamKhata = '/kaam-khata';
  static const String nayaKaamDarj = '/kaam-khata/darj';
  static const String kaamItihaas = '/kaam-khata/itihaas';
  static const String incomeCertificate = '/kaam-khata/certificate';

  // ===========================
  // Mandi Bhav
  // ===========================
  static const String mandiBhav = '/mandi-bhav';

  // ===========================
  // Other Modules
  // ===========================
  static const String jobs = '/jobs';
  static const String artisan = '/artisan';
  static const String mandi = '/mandi';
}