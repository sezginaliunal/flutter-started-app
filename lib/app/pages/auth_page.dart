import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/auth_controller.dart';
import 'package:started_app/app/pages/home_page.dart';
import 'package:started_app/app/pages/login.dart';
import 'package:started_app/app/res/layouts/future_builder.dart';

import 'package:started_app/app/res/layouts/main_layout.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLogginIn = controller.isLogginIn;
    return MainLayout(
      child: Scaffold(
        body: FutureBuilderLayout(
          future: controller.checkUserToken(),
          hasSnapshot: isLogginIn ? const HomePage() : const LoginPage(),
          waiting: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
