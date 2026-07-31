import 'package:flutter/material.dart';
import 'package:kamaai/generated/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  String tr(String key) {
    switch (key) {
      // =========================
      // States
      // =========================

      case "stateAndamanNicobar":
        return l10n.stateAndamanNicobar;

      case "stateAndhraPradesh":
        return l10n.stateAndhraPradesh;

      case "stateArunachalPradesh":
        return l10n.stateArunachalPradesh;

      case "stateAssam":
        return l10n.stateAssam;

      case "stateBihar":
        return l10n.stateBihar;

      case "stateChhattisgarh":
        return l10n.stateChhattisgarh;

      case "stateGoa":
        return l10n.stateGoa;

      case "stateGujarat":
        return l10n.stateGujarat;

      case "stateHaryana":
        return l10n.stateHaryana;

      case "stateHimachalPradesh":
        return l10n.stateHimachalPradesh;

      case "stateJharkhand":
        return l10n.stateJharkhand;

      case "stateKarnataka":
        return l10n.stateKarnataka;

      case "stateKerala":
        return l10n.stateKerala;

      case "stateMadhyaPradesh":
        return l10n.stateMadhyaPradesh;

      case "stateMaharashtra":
        return l10n.stateMaharashtra;

      case "stateManipur":
        return l10n.stateManipur;

      case "stateMeghalaya":
        return l10n.stateMeghalaya;

      case "stateMizoram":
        return l10n.stateMizoram;

      case "stateNagaland":
        return l10n.stateNagaland;

      case "stateOdisha":
        return l10n.stateOdisha;

      case "statePunjab":
        return l10n.statePunjab;

      case "stateRajasthan":
        return l10n.stateRajasthan;

      case "stateSikkim":
        return l10n.stateSikkim;

      case "stateTamilNadu":
        return l10n.stateTamilNadu;

      case "stateTelangana":
        return l10n.stateTelangana;

      case "stateTripura":
        return l10n.stateTripura;

      case "stateUttarPradesh":
        return l10n.stateUttarPradesh;

      case "stateUttarakhand":
        return l10n.stateUttarakhand;

      case "stateWestBengal":
        return l10n.stateWestBengal;

      case "stateDelhi":
        return l10n.stateDelhi;

      case "stateChandigarh":
        return l10n.stateChandigarh;

      case "stateJammuKashmir":
        return l10n.stateJammuKashmir;

      case "stateLadakh":
        return l10n.stateLadakh;

      case "stateLakshadweep":
        return l10n.stateLakshadweep;

      case "statePuducherry":
        return l10n.statePuducherry;

      case "stateDadraDamanDiu":
        return l10n.stateDadraDamanDiu;
      // =========================
      // Dashboard Modules
      // =========================

      case "kaamKhataTitle":
        return l10n.kaamKhataTitle;

      case "kaamKhataSubtitle":
        return l10n.kaamKhataSubtitle;

      case "kaamDoDhundoTitle":
        return l10n.kaamDoDhundoTitle;

      case "kaamDoDhundoSubtitle":
        return l10n.kaamDoDhundoSubtitle;

      case "haathKaKaamTitle":
        return l10n.haathKaKaamTitle;

      case "haathKaKaamSubtitle":
        return l10n.haathKaKaamSubtitle;

      case "mandiBhavTitle":
        return l10n.mandiBhavTitle;

      case "mandiBhavSubtitle":
        return l10n.mandiBhavSubtitle;

      default:
        // Future district keys (districtPatna, districtGaya, etc.)
        // will also come here until we add them.
        return key;
    }
  }
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

  bool get isRTL => languageCode == 'ur' || languageCode == 'sd';
}