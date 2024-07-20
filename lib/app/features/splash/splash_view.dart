import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/features/splash/splash_controller.dart';
import 'package:started_app/core/controllers/theme_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Obx(() => Center(
            child: IconButton(
                color: themeController.isDarkMode() ? Colors.red : Colors.blue,
                onPressed: () => themeController.switchTheme(),
                icon: Icon(themeController.currentTheme.value == AppTheme.Dark
                    ? Icons.dark_mode
                    : Icons.light_mode)),
          )),
    );
  }
}
