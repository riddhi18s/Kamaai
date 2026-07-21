import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/language_model.dart';
import '../../../../core/localization/supported_languages.dart';
import '../../../../services/storage_service.dart';
import '../../data/language_aliases.dart';

class LanguageNotifier extends StateNotifier<LanguageModel> {
  LanguageNotifier()
      : super(
          SupportedLanguages.defaultLanguage,
        );

  void setLanguage(LanguageModel language) {
    state = language;
  }

  Future<void> saveLanguage() async {
    await StorageService.saveLanguage(state.code);
    await StorageService.setLanguageSelected(true);
  }

  Future<void> loadSavedLanguage() async {
    final code = StorageService.getLanguage();

    if (code == null) return;

    final language = SupportedLanguages.fromCode(code);

    if (language != null) {
      state = language;
    }
  }

  void detectDeviceLanguage(BuildContext context) {
    final deviceCode = Localizations.localeOf(context).languageCode;

    state = SupportedLanguages.fromCode(deviceCode) ??
        SupportedLanguages.defaultLanguage;
  }

  List<LanguageModel> searchLanguages(String query) {
    if (query.trim().isEmpty) {
      return SupportedLanguages.all;
    }

    return SupportedLanguages.all
        .where((language) => LanguageAliases.searchMatches(language, query))
        .toList();
  }

  List<LanguageModel> getRecommendedLanguages(
    BuildContext context, {
    String? stateName,
  }) {
    final recommended = <LanguageModel>[];

    void addByCode(String? code) {
      if (code == null) return;

      final language = SupportedLanguages.fromCode(code);

      if (language != null && !recommended.contains(language)) {
        recommended.add(language);
      }
    }

    addByCode(StorageService.getLanguage());

    addByCode(Localizations.localeOf(context).languageCode);

    if (stateName != null &&
        SupportedLanguages.stateLanguageMap.containsKey(stateName)) {
      for (final code
          in SupportedLanguages.stateLanguageMap[stateName]!) {
        addByCode(code);
      }
    }

    addByCode("en");

    return recommended;
  }
}

final languageProvider =
    StateNotifierProvider<LanguageNotifier, LanguageModel>(
  (ref) => LanguageNotifier(),
);