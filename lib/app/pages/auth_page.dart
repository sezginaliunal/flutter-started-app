import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/auth_controller.dart';
import 'package:started_app/app/pages/home_page.dart';
import 'package:started_app/app/pages/login.dart';
import 'package:started_app/app/res/layouts/main_layout.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);
@override
Widget build(BuildContext context) {
  return MainLayout(
    child: Scaffold(
      body: FutureBuilder<bool>(
        future: controller.checkUserToken(),
        builder: (context,snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return const HomePage();
          } else if (snapshot.hasData && snapshot.data == false) {
            return const LoginPage();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ),
  );
}
}