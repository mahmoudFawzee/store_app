import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static Future<SharedPreferences> _getPrefsInstance() async =>
      await SharedPreferences.getInstance();
  static Future<bool> setValue({
    required String key,
    required dynamic value,
  }) async {
    final bool result = await _setValue(
      key: key,
      value: value,
    );
    return result;
  }

  static Future<bool> removeValue(String key) async {
    final prefs = await _getPrefsInstance();
    return await prefs.remove(key);
  }

 static Future<bool?> getBool(String key) async {
    final prefs = await _getPrefsInstance();
    return prefs.getBool(key);
  }

 static Future<String?> getString(String key) async {
    final prefs = await _getPrefsInstance();
    return prefs.getString(key);
  }

  static Future<bool> _setValue({
    required String key,
    required dynamic value,
  }) async {
    try {
      final prefs = await _getPrefsInstance();
      final Type type = value.runtimeType;
      log('data type in prefs is : $type');
      switch (type) {
        case int:
          prefs.setInt(key, value);
          break;
        case String:
          prefs.setString(key, value);
          break;
        case bool:
          prefs.setBool(key, value);
          break;
        case double:
          prefs.setDouble(key, value);
          break;
        case List:
          prefs.setStringList(key, value);
          break;
        default:
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}
