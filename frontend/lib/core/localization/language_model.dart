import 'package:flutter/material.dart';

@immutable
class LanguageModel {
  final String code;
  final String localeCode;
  final String nativeName;
  final String englishName;
  final String hinglishName;

  /// Greeting shown on the language selection screen
  final String greeting;

  /// Romanized greeting shown below the native greeting
  final String hinglishGreeting;

  /// Speech-to-Text / Text-to-Speech locale
  final String speechLocale;

  /// Text direction (LTR / RTL)
  final TextDirection textDirection;

  /// Default language of the app
  final bool isDefault;

  /// Recommended language
  final bool isRecommended;

  const LanguageModel({
    required this.code,
    required this.localeCode,
    required this.nativeName,
    required this.englishName,
    required this.hinglishName,
    required this.greeting,
    required this.hinglishGreeting,
    required this.speechLocale,
    this.textDirection = TextDirection.ltr,
    this.isDefault = false,
    this.isRecommended = false,
  });

  /// Flutter Locale
  Locale get locale => Locale(code);

  /// RTL Languages
  bool get isRTL => textDirection == TextDirection.rtl;

  LanguageModel copyWith({
    String? code,
    String? localeCode,
    String? nativeName,
    String? englishName,
    String? hinglishName,
    String? greeting,
    String? hinglishGreeting,
    String? speechLocale,
    TextDirection? textDirection,
    bool? isDefault,
    bool? isRecommended,
  }) {
    return LanguageModel(
      code: code ?? this.code,
      localeCode: localeCode ?? this.localeCode,
      nativeName: nativeName ?? this.nativeName,
      englishName: englishName ?? this.englishName,
      hinglishName: hinglishName ?? this.hinglishName,
      greeting: greeting ?? this.greeting,
      hinglishGreeting: hinglishGreeting ?? this.hinglishGreeting,
      speechLocale: speechLocale ?? this.speechLocale,
      textDirection: textDirection ?? this.textDirection,
      isDefault: isDefault ?? this.isDefault,
      isRecommended: isRecommended ?? this.isRecommended,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageModel &&
          runtimeType == other.runtimeType &&
          code == other.code;

  @override
  int get hashCode => code.hashCode;

  @override
  String toString() {
    return 'LanguageModel('
        'code: $code, '
        'englishName: $englishName, '
        'nativeName: $nativeName'
        ')';
  }
}