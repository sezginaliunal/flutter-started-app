import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Center(
        child: Obx(() {
          var settings = controller.mobileSettings.value;
          if (settings == null) {
            return const CircularProgressIndicator();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('App URL: ${settings.AppUrl}'),
              Text('Company: ${settings.Company}'),
              // Add more fields as needed
            ],
          );
        }),
      ),
    );
  }
}
