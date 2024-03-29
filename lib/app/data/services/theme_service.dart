import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/res/enums/preferences_keys.dart';

class ThemeService {
  final _getStorage = GetStorage();
  final _storageKey = PreferencesKeys.THEME_MODE.toKeyName();
  static ThemeService instance = ThemeService._();
  // ignore: empty_constructor_bodies
  ThemeService._() {}
  set themeMode(ThemeMode themeMode) {
    if (themeMode == ThemeMode.system) {
      _getStorage.remove(_storageKey);
    } else {
      _getStorage.write(_storageKey, themeMode == ThemeMode.dark);
    }
    Get.changeThemeMode(themeMode);
  }

  ThemeMode get themeMode {
    switch (_getStorage.read(_storageKey)) {
      case true:
        return ThemeMode.dark;
      case false:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
