import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/features/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Container(
          // Add your widgets here
          ),
    );
  }
}
