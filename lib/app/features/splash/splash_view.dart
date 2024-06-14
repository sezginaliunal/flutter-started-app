import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/features/splash/splash_controller.dart';
import 'package:started_app/core/controllers/theme_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          Switch(
              value: context.isDarkMode,
              onChanged: (val) {
                themeController.setTheme(
                    context.isDarkMode ? AppTheme.Light : AppTheme.Dark);
              })
        ],
      ),
    );
  }
}
