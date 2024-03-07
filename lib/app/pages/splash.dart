import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/splash_controller.dart';
import 'package:started_app/app/res/layouts/main/main_layout.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    ));
  }
}
