class LanguageModel {
  final String code;
  final String locale;
  final String englishName;
  final String nativeName;
  final String greeting;
  final String hinglishGreeting;

  const LanguageModel({
    required this.code,
    required this.locale,
    required this.englishName,
    required this.nativeName,
    required this.greeting,
    required this.hinglishGreeting,
  });
}