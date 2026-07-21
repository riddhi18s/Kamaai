import 'package:hive/hive.dart';

class StorageService {
  static final Box _box = Hive.box("settings");

  static Future<void> saveLanguage(String code) async {
    await _box.put("language", code);
  }

  static String? getLanguage() {
    return _box.get("language");
  }

  static Future<void> setLanguageSelected(bool value) async {
    await _box.put("language_selected", value);
  }

  static bool isLanguageSelected() {
    return _box.get(
          "language_selected",
          defaultValue: false,
        ) ??
        false;
  }

  static Future<void> clear() async {
    await _box.clear();
  }
}