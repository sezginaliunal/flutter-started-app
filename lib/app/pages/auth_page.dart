import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/auth_controller.dart';
import 'package:started_app/app/pages/home_page.dart';
import 'package:started_app/app/pages/login.dart';
import 'package:started_app/app/pages/splash.dart';
import 'package:started_app/app/res/layouts/main/main_layout.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Scaffold(
      body: FutureBuilder<bool>(
        future: controller.checkUserToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashPage();
          } else {
            if (snapshot.hasError) {
              return Text('Hata: ${snapshot.error}');
            } else {
              if (snapshot.data == true) {
                return const HomePage();
              } else {
                return const LoginPage();
              }
            }
          }
        },
      ),
    ));
  }
}
