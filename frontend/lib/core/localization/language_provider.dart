import 'package:flutter/foundation.dart';

import 'language_model.dart';
import 'supported_languages.dart';

class LanguageProvider extends ChangeNotifier {
  final List<LanguageModel> _languages = SupportedLanguages.all;

  late LanguageModel _selectedLanguage =
      SupportedLanguages.defaultLanguage;

  List<LanguageModel> _filteredLanguages =
      SupportedLanguages.all;

  List<LanguageModel> get languages =>
      List.unmodifiable(_languages);

  List<LanguageModel> get filteredLanguages =>
      List.unmodifiable(_filteredLanguages);

  List<LanguageModel> get recommendedLanguages =>
      SupportedLanguages.recommended;

  LanguageModel get selectedLanguage =>
      _selectedLanguage;

  void selectLanguage(LanguageModel language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void selectByCode(String code) {
    final language = SupportedLanguages.fromCode(code);

    if (language == null) return;

    selectLanguage(language);
  }

  void search(String query) {
    final value = query.trim().toLowerCase();

    if (value.isEmpty) {
      _filteredLanguages = _languages;
    } else {
      _filteredLanguages = _languages.where((language) {
        return language.nativeName.toLowerCase().contains(value) ||
            language.englishName.toLowerCase().contains(value) ||
            language.hinglishName.toLowerCase().contains(value);
      }).toList();
    }

    notifyListeners();
  }

  void clearSearch() {
    _filteredLanguages = _languages;
    notifyListeners();
  }
}