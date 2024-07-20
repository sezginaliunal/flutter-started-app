import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:started_app/core/config/theme/base_theme.dart';
import 'package:started_app/core/config/constants/hive_boxes.dart';
import 'package:started_app/core/config/constants/hive_keys.dart';

enum AppTheme { Light, Dark }

class ThemeController extends GetxController {
  var currentTheme = AppTheme.Light.obs;
  Box box = Hive.box(HiveBoxConstants.theme.value);

  ThemeController() {
    currentTheme.value = AppTheme
        .values[box.get(HiveKeysConstants.theme.value, defaultValue: 0)];
  }

  void setTheme(AppTheme theme) {
    currentTheme.value = theme;
    box.put(HiveKeysConstants.theme.value, theme.index);
  }

  ThemeData getThemeData() {
    switch (currentTheme.value) {
      case AppTheme.Light:
        return Themes().lightTheme;
      case AppTheme.Dark:
        return Themes().darkTheme;
      default:
        return Themes().lightTheme;
    }
  }

  void switchTheme() {
    currentTheme.value =
        currentTheme.value == AppTheme.Light ? AppTheme.Dark : AppTheme.Light;
    box.put(HiveKeysConstants.theme.value, currentTheme.value.index);
  }

  bool isDarkMode() {
    return currentTheme.value == AppTheme.Dark;
  }
}
