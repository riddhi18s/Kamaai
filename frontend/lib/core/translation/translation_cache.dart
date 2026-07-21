import 'dart:collection';

class TranslationCache {
  TranslationCache._();

  static final Map<String, String> _cache = HashMap();

  static String _key({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
  }) {
    return '${sourceLanguage}_$targetLanguage\_$text';
  }

  static void save({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    required String translatedText,
  }) {
    _cache[_key(
      text: text,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
    )] = translatedText;
  }

  static String? get({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
  }) {
    return _cache[_key(
      text: text,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
    )];
  }

  static bool contains({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
  }) {
    return _cache.containsKey(
      _key(
        text: text,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
      ),
    );
  }

  static void clear() {
    _cache.clear();
  }

  static int get size => _cache.length;
}