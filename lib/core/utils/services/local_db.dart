import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static late SharedPreferences _preferences;
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  static String getString(String key, {String? defaultValue}) {
    return _preferences.getString(key) ?? defaultValue ?? '';
  }

  static Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  static bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }

  static Future<void> setInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  static int getInt(String key, {int? defaultValue}) {
    return _preferences.getInt(key) ?? defaultValue ?? -1;
  }
}
