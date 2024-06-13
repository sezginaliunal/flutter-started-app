// ignore_for_file: strict_raw_type

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:started_app/app/theme/base_theme.dart';
import 'package:started_app/core/constants/hive_boxes.dart';
import 'package:started_app/core/constants/hive_keys.dart';

enum AppTheme { Light, Dark }

class ThemeController extends GetxController {
  Rx<AppTheme> currentTheme = AppTheme.Light.obs;
  Box box = Hive.box(HiveBoxConstants.settings.value);

  @override
  void onInit() {
    super.onInit();
    currentTheme.value = AppTheme
        .values[box.get(HiveKeysConstants.theme.value, defaultValue: 0)];
  }

  void setTheme(AppTheme theme) {
    currentTheme.value = theme;
    box.put(HiveKeysConstants.theme.value, theme.index);
  }

  ThemeData getThemeData(AppTheme theme) {
    switch (theme) {
      case AppTheme.Light:
        return Themes().lightTheme;
      case AppTheme.Dark:
        return Themes().darkTheme;
    }
  }
}
