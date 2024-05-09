import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/core/controllers/translation_controller.dart';
import 'package:started_app/core/res/constants/strings.dart';
import 'core/services/theme_service.dart';
import 'core/services/translations_service.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/res/theme/base_theme.dart';
import 'init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TranslationController translationController = Get.find();
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService.instance.themeMode,
      translations: Translation(),
      locale: Locale(translationController.selectedLanguage),
      fallbackLocale: const Locale('en'),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
    );
  }
}
