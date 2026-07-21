import 'package:flutter/material.dart';

import '../localization/language_mapper.dart';
import '../localization/language_model.dart';

class LanguageDetector {
  LanguageDetector._();

  /// Detect language from the current app locale.
  static LanguageModel detectFromLocale(Locale locale) {
    return LanguageMapper.fromCode(locale.languageCode) ??
        LanguageMapper.fromCode('en')!;
  }

  /// Detect language from a language code.
  static LanguageModel detectFromCode(String code) {
    return LanguageMapper.fromCode(code) ??
        LanguageMapper.fromCode('en')!;
  }

  /// Detect language from a speech locale.
  static LanguageModel detectFromSpeechLocale(String speechLocale) {
    return LanguageMapper.fromSpeechLocale(speechLocale) ??
        LanguageMapper.fromCode('en')!;
  }

  /// Placeholder for future automatic language detection.
  /// Later this can call ML Kit, Gemini, Azure, Google Translate, etc.
  static Future<LanguageModel> detectFromText(String text) async {
    return LanguageMapper.fromCode('en')!;
  }
}