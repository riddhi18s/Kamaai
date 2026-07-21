import 'language_model.dart';
import 'supported_languages.dart';

class LanguageMapper {
  LanguageMapper._();

  static final Map<String, LanguageModel> _codeMap = {
    for (final language in SupportedLanguages.all)
      language.code: language,
  };

  static final Map<String, LanguageModel> _localeMap = {
    for (final language in SupportedLanguages.all)
      language.localeCode.toLowerCase(): language,
  };

  static final Map<String, LanguageModel> _speechMap = {
    for (final language in SupportedLanguages.all)
      language.speechLocale.toLowerCase(): language,
  };

  static LanguageModel? fromCode(String code) {
    return _codeMap[code.toLowerCase()];
  }

  static LanguageModel? fromLocale(String localeCode) {
    return _localeMap[localeCode.toLowerCase()];
  }

  static LanguageModel? fromSpeechLocale(String speechLocale) {
    return _speechMap[speechLocale.toLowerCase()];
  }

  static LanguageModel? fromName(String value) {
    final query = value.trim().toLowerCase();

    for (final language in SupportedLanguages.all) {
      if (language.englishName.toLowerCase() == query ||
          language.nativeName.toLowerCase() == query ||
          language.hinglishName.toLowerCase() == query) {
        return language;
      }
    }

    return null;
  }

  static String speechLocale(String code) {
    return fromCode(code)?.speechLocale ?? 'en_IN';
  }

  static String localeCode(String code) {
    return fromCode(code)?.localeCode ?? 'en_IN';
  }

  static String nativeName(String code) {
    return fromCode(code)?.nativeName ?? 'English';
  }

  static String englishName(String code) {
    return fromCode(code)?.englishName ?? 'English';
  }

  static bool isSupported(String code) {
    return _codeMap.containsKey(code.toLowerCase());
  }
}