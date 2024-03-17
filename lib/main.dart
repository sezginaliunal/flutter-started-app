import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:started_app/app/bindings/network_binding.dart';
import 'package:started_app/app/controllers/translation_controller.dart';
import 'package:started_app/app/res/constants/strings.dart';
import 'app/data/services/dependency_injection.dart';
import 'app/data/services/theme_service.dart';
import 'app/data/services/translations_service.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/res/layouts/main/main_layout.dart';
import 'app/res/theme/base_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependecyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TranslationController translationController = Get.find();
    return ScreenUtilInit(
      builder: (_, __) {
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
          initialBinding: NetworkBinding(),
          getPages: AppPages.pages,
          builder: (_, child) {
            return MainLayout(child: child!);
          },
        );
      },
    );
  }
}
