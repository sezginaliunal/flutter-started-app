import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/splash_controller.dart';
import 'package:started_app/app/pages/auth_page.dart';
import 'package:started_app/app/res/layouts/future_builder.dart';

import 'package:started_app/app/res/layouts/main_layout.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        body: FutureBuilderLayout(
          future: controller.testMethod(),
          hasSnapshot: const AuthPage(),
          waiting: const Center(
            child: Text('Splash'),
          ),
        ),
      ),
    );
  }
}
