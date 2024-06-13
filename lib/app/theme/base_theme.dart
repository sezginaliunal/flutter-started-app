import 'package:flutter/material.dart';
import 'package:started_app/app/theme/dark_theme/appbar_theme.dart';
import 'package:started_app/app/theme/dark_theme/card_theme.dart';
import 'package:started_app/app/theme/dark_theme/floating_theme.dart';
import 'package:started_app/app/theme/light_theme/appbar_theme.dart';
import 'package:started_app/app/theme/light_theme/card_theme.dart';
import 'package:started_app/app/theme/light_theme/floating_theme.dart';

class Themes {
  final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: appBarLightTheme,
    floatingActionButtonTheme: floatingActionButtonLightTheme,
    cardTheme: cardLightTheme,
  );

  final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: appBarDarkTheme,
    floatingActionButtonTheme: floatingActionButtonDarkTheme,
    cardTheme: cardDarkTheme,
  );
}
