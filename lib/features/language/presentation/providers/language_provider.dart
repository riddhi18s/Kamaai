import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../services/storage_service.dart';
import '../../data/language_aliases.dart';
import '../../data/language_data.dart';
import '../../domain/language_model.dart';

class LanguageNotifier extends StateNotifier<LanguageModel> {
  LanguageNotifier()
      : super(
          supportedLanguages.firstWhere(
            (language) => language.code == "hi",
          ),
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

    try {
      state = supportedLanguages.firstWhere(
        (language) => language.code == code,
      );
    } catch (_) {}
  }

  void detectDeviceLanguage(BuildContext context) {
    final deviceCode = Localizations.localeOf(context).languageCode;

    try {
      state = supportedLanguages.firstWhere(
        (language) => language.code == deviceCode,
      );
    } catch (_) {
      state = supportedLanguages.firstWhere(
        (language) => language.code == "hi",
      );
    }
  }

  /// Fuzzy, typo-tolerant search across native name, English name, and
  /// Hinglish/romanized aliases (e.g. "hindee", "gujrati", "marati" all
  /// resolve to their intended language).
  List<LanguageModel> searchLanguages(String query) {
    if (query.trim().isEmpty) {
      return supportedLanguages;
    }

    return supportedLanguages
        .where((language) => LanguageAliases.searchMatches(language, query))
        .toList();
  }

  /// Builds the "Recommended" list per the priority order:
  /// 1. Previously saved language
  /// 2. Device language
  /// 3. User's state (if a location source is available)
  /// 4. That state's common language(s)
  /// 5. English
  ///
  /// [stateName] is optional and currently has no data source wired up
  /// in this project (no location plugin is a dependency yet) — pass it
  /// in once one is added; until then this tier is simply skipped and
  /// recommendations fall back through the remaining tiers.
  List<LanguageModel> getRecommendedLanguages(
    BuildContext context, {
    String? stateName,
  }) {
    final recommended = <LanguageModel>[];

    void addByCode(String? code) {
      if (code == null) return;
      final match =
          supportedLanguages.where((language) => language.code == code);
      if (match.isNotEmpty && !recommended.contains(match.first)) {
        recommended.add(match.first);
      }
    }

    // 1. Previously saved language.
    addByCode(StorageService.getLanguage());

    // 2. Device language.
    addByCode(Localizations.localeOf(context).languageCode);

    // 3 & 4. User's state + that state's common language(s).
    if (stateName != null && stateLanguageMap.containsKey(stateName)) {
      for (final code in stateLanguageMap[stateName]!) {
        addByCode(code);
      }
    }

    // 5. English fallback.
    addByCode("en");

    return recommended;
  }
}

final languageProvider =
    StateNotifierProvider<LanguageNotifier, LanguageModel>(
  (ref) => LanguageNotifier(),
);