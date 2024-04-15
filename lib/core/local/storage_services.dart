import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageKeys {
  StorageKeys();

  // Declare all storage keys here & create corresponding setters & getters
  static const String token = "TOKEN";
  static const String activeLocale = "ACTIVE_LOCAL";
  static const String userId = "USER_ID";
  static const String countryId = "COUNTRY_ID";
  static const String cityId = "CITY_ID";
}

class StorageService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;

  static Future<StorageService> init() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return StorageService(prefs);
    } catch (e) {
      // Handle initialization error
      debugPrint('Error initializing SharedPreferences: $e');
      rethrow;
    }
  }

  void setValue({required String key, required dynamic value}) {
    if (value is int) {
      _prefs.setInt(key, value);
    } else if (value is String) {
      _prefs.setString(key, value);
    } else if (value is bool) {
      _prefs.setBool(key, value);
    } else {
      throw "undefined type";
    }
  }

  void removeKey(String key) => _prefs.remove(key);

  dynamic getValue({required String key}) {
    dynamic storedValue = _prefs.get(key);

    return storedValue;
  }

  void clear() {
    _prefs.clear();
  }

  Locale get locale {
    try {
      if (_prefs.get(StorageKeys.activeLocale) != null &&
          _prefs.get(StorageKeys.activeLocale) == "ar") {
        return const Locale('ar', 'EG');
      } else {
        return const Locale('en', 'US');
      }
    } catch (e) {
      debugPrint("locale Error $e");
      return const Locale('en', 'US');
    }
  }

  void clearAllAppData() {
    _prefs.clear();
    // Additional logic to clear any other app-specific data if needed
  }
}
