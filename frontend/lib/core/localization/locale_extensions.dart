import 'package:flutter/material.dart';
import 'package:kamaai/generated/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension LocaleExtension on Locale {
  String get language => languageCode;

  bool get isEnglish => languageCode == 'en';

  bool get isHindi => languageCode == 'hi';

  bool get isTamil => languageCode == 'ta';

  bool get isTelugu => languageCode == 'te';

  bool get isBengali => languageCode == 'bn';

  bool get isMarathi => languageCode == 'mr';

  bool get isGujarati => languageCode == 'gu';

  bool get isKannada => languageCode == 'kn';

  bool get isMalayalam => languageCode == 'ml';

  bool get isPunjabi => languageCode == 'pa';

  bool get isUrdu => languageCode == 'ur';

  bool get isRTL =>
      languageCode == 'ur' ||
      languageCode == 'sd';
}