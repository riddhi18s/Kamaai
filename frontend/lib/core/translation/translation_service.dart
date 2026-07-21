import '../localization/language_mapper.dart';
import 'translation_cache.dart';

class TranslationService {
  TranslationService._();

  /// Main translation method.
  ///
  /// For now it returns the original text.
  /// Later this method will call Google Translate,
  /// Azure Translator, Gemini, OpenAI, etc.
  static Future<String> translate({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
  }) async {
    if (text.trim().isEmpty) {
      return text;
    }

    if (sourceLanguage == targetLanguage) {
      return text;
    }

    final cached = TranslationCache.get(
      text: text,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
    );

    if (cached != null) {
      return cached;
    }

    // ================================
    // Future Translation API goes here
    // ================================

    final translatedText = text;

    TranslationCache.save(
      text: text,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      translatedText: translatedText,
    );

    return translatedText;
  }

  static bool supportsLanguage(String languageCode) {
    return LanguageMapper.isSupported(languageCode);
  }

  static Future<String> translateToEnglish(String text) async {
    return translate(
      text: text,
      sourceLanguage: 'auto',
      targetLanguage: 'en',
    );
  }

  static Future<String> translateFromEnglish({
    required String text,
    required String targetLanguage,
  }) async {
    return translate(
      text: text,
      sourceLanguage: 'en',
      targetLanguage: targetLanguage,
    );
  }

  static Future<String> autoTranslate({
    required String text,
    required String targetLanguage,
  }) async {
    return translate(
      text: text,
      sourceLanguage: 'auto',
      targetLanguage: targetLanguage,
    );
  }

  static void clearCache() {
    TranslationCache.clear();
  }

  static int get cacheSize => TranslationCache.size;
}