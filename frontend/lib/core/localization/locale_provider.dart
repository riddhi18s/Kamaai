import 'package:flutter/material.dart';

import 'locale_service.dart';
import 'supported_languages.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = SupportedLanguages.defaultLanguage.locale;

  Locale get locale => _locale;

  bool get isEnglish => _locale.languageCode == 'en';

  Future<void> initialize() async {
    _locale = await LocaleService.loadLocale();
    notifyListeners();
  }

  Future<void> changeLocale(Locale locale) async {
    if (_locale.languageCode == locale.languageCode) return;

    _locale = locale;

    await LocaleService.saveLocale(locale);

    notifyListeners();
  }

  Future<void> changeLanguage(String languageCode) async {
    final language = SupportedLanguages.fromCode(languageCode);

    if (language == null) return;

    await changeLocale(language.locale);
  }

  Future<void> reset() async {
    _locale = SupportedLanguages.defaultLanguage.locale;

    await LocaleService.resetLocale();

    notifyListeners();
  }

  bool isSelected(String code) {
    return _locale.languageCode == code;
  }
}