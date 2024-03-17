import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/splash_controller.dart';
import 'package:started_app/app/pages/home_page.dart';
import 'package:started_app/app/pages/login.dart';
import 'package:started_app/app/res/enums/token_value.dart';

import 'package:started_app/app/res/layouts/main/main_layout.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        body: FutureBuilder<TokenValue>(
          future: controller.checkUserToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              switch (snapshot.data) {
                case TokenValue.ok:
                  // Handle token value OK
                  return const HomePage();
                case TokenValue.notFound:
                  // Handle token not found
                  return const LoginPage();
                case TokenValue.error:
                  // Handle token error
                  return const CircularProgressIndicator();
                default:
                  return const SizedBox(); // Handle other cases if necessary
              }
            }
          },
        ),
      ),
    );
  }
}
