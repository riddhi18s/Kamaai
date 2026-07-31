import 'package:hive/hive.dart';

class StorageService {
  static const _boxName = "settings";

  static const _languageKey = "language";
  static const _languageSelectedKey = "language_selected";

  static Box get _box => Hive.box(_boxName);

  // -------------------------
  // Language
  // -------------------------

  static Future<void> saveLanguage(String code) async {
    await _box.put(_languageKey, code);
  }

  static String? getLanguage() {
    return _box.get(_languageKey) as String?;
  }

  // -------------------------
  // Language Selection Status
  // -------------------------

  static Future<void> setLanguageSelected(bool value) async {
    await _box.put(_languageSelectedKey, value);
  }

  static bool isLanguageSelected() {
    return _box.get(
          _languageSelectedKey,
          defaultValue: false,
        ) as bool;
  }

  // -------------------------
  // Clear Storage
  // -------------------------

  static Future<void> clear() async {
    await _box.clear();
  }
}