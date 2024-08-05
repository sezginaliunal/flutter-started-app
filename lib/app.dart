import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/core/config/constants/app_infos.dart';
import 'package:started_app/core/config/constants/navigation_route_pages.dart';
import 'package:started_app/core/config/constants/navigation_routes.dart';
import 'package:started_app/core/controllers/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx(() => GetMaterialApp(
          title: AppInfos.appName,
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.INITIAL_ROUTE,
          getPages: AppRouter.getPages,
          theme: themeController.getThemeData(),
        ));
  }
}
