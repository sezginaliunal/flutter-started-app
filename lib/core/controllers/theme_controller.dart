import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:started_app/core/config/theme/base_theme.dart';
import 'package:started_app/core/config/constants/hive_boxes.dart';
import 'package:started_app/core/config/constants/hive_keys.dart';

enum AppTheme { Light, Dark }

class ThemeNotifier extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.Light;
  Box box = Hive.box(HiveBoxConstants.theme.value);

  ThemeNotifier() {
    _currentTheme = AppTheme
        .values[box.get(HiveKeysConstants.theme.value, defaultValue: 0)];
  }

  AppTheme get currentTheme => _currentTheme;

  void setTheme(AppTheme theme) {
    _currentTheme = theme;
    box.put(HiveKeysConstants.theme.value, theme.index);
    notifyListeners();
  }

  ThemeData getThemeData() {
    switch (_currentTheme) {
      case AppTheme.Light:
        return Themes().lightTheme;
      case AppTheme.Dark:
        return Themes().darkTheme;
    }
  }

  void switchTheme() {
    _currentTheme =
        _currentTheme == AppTheme.Light ? AppTheme.Dark : AppTheme.Light;
    box.put(HiveKeysConstants.theme.value, _currentTheme.index);
    notifyListeners();
  }

  bool isDarkMode() {
    if (currentTheme != AppTheme.Dark) {
      return false;
    }
    return true;
  }
}
