import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:started_app/core/bindings/splash_binding.dart';
import 'package:started_app/core/config/dependecy_injection.dart';
import 'package:started_app/core/constants/app_infos.dart';
import 'package:started_app/core/controllers/theme_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependecyInjection().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
          title: AppInfos.appName,
          debugShowCheckedModeBanner: false,
          theme:
              themeController.getThemeData(themeController.currentTheme.value),
          initialRoute: AppRoutes.SPLASH,
          getPages: AppPages.pages,
          initialBinding: SplashBinding(),
        ));
  }
}
