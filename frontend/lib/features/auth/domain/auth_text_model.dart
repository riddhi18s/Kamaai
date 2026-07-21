class AuthTextModel {
  // Welcome Section
  final String welcomeTitle;
  final String welcomeHinglish;

  final String instructionText;
  final String instructionHinglish;

  // Create Account
  final String createAccountText;
  final String createAccountShort;
  final String createAccountHinglish;

  // Login
  final String loginText;
  final String loginShort;
  final String loginHinglish;

  // Voice Assistant
  final String voiceText;
  final String voiceHinglish;
  final String voiceListeningText;
  final String voiceCancelText;

  // Phone Number
  final String phoneTitle;
  final String phoneHinglish;
  final String phoneHint;
  final String phoneSecurity;
  final String phoneVoiceMessage;

  // OTP
  final String otpTitle;
  final String otpHinglish;
  final String otpHint;
  final String invalidOtp;
  final String verifyButton;
  final String resendOtp;
  final String otpVoiceMessage;

  // Password
  final String passwordTitle;
  final String passwordHinglish;
  final String passwordHint;
  final String confirmPasswordHint;
  final String skipPassword;
  final String createPassword;
  final String passwordVoiceMessage;

  // Common Buttons
  final String continueText;
  final String continueHinglish;
  final String backText;

  // Language
  final String languageChangeText;
  final String languageChangeHinglish;

  // Speech
  final String speechLocale;
  final String registrationOpeningText;
  final String loginOpeningText;
  final String fullPageSpeechText;

  // Voice Recognition Keywords
  final List<String> createAccountKeywords;
  final List<String> loginKeywords;

  const AuthTextModel({
    // Welcome
    required this.welcomeTitle,
    required this.welcomeHinglish,
    required this.instructionText,
    required this.instructionHinglish,

    // Create Account
    required this.createAccountText,
    required this.createAccountShort,
    required this.createAccountHinglish,

    // Login
    required this.loginText,
    required this.loginShort,
    required this.loginHinglish,

    // Voice
    required this.voiceText,
    required this.voiceHinglish,
    required this.voiceListeningText,
    required this.voiceCancelText,

    // Phone
    required this.phoneTitle,
    required this.phoneHinglish,
    required this.phoneHint,
    required this.phoneSecurity,
    required this.phoneVoiceMessage,

    // OTP
    required this.otpTitle,
    required this.otpHinglish,
    required this.otpHint,
    required this.invalidOtp,
    required this.verifyButton,
    required this.resendOtp,
    required this.otpVoiceMessage,

    // Password
    required this.passwordTitle,
    required this.passwordHinglish,
    required this.passwordHint,
    required this.confirmPasswordHint,
    required this.skipPassword,
    required this.createPassword,
    required this.passwordVoiceMessage,

    // Common
    required this.continueText,
    required this.continueHinglish,
    required this.backText,

    // Language
    required this.languageChangeText,
    required this.languageChangeHinglish,

    // Speech
    required this.speechLocale,
    required this.registrationOpeningText,
    required this.loginOpeningText,
    required this.fullPageSpeechText,

    // Keywords
    required this.createAccountKeywords,
    required this.loginKeywords,
  });
}