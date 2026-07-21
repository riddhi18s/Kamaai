import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'supported_languages.dart';

class LocaleService {
  LocaleService._();

  static const String _localeKey = 'selected_locale';

  /// Save selected language
  static Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }

  /// Load saved language
  static Future<Locale> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();

    final code = prefs.getString(_localeKey);

    if (code == null) {
      return SupportedLanguages.defaultLanguage.locale;
    }

    final language = SupportedLanguages.fromCode(code);

    return language?.locale ??
        SupportedLanguages.defaultLanguage.locale;
  }

  /// Remove saved language
  static Future<void> resetLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_localeKey);
  }

  /// Check if user has already selected a language
  static Future<bool> hasSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_localeKey);
  }

  /// Get current language code
  static Future<String> currentLanguageCode() async {
    final locale = await loadLocale();
    return locale.languageCode;
  }
}