import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/controllers/splash_controller.dart';
import 'package:started_app/app/pages/home_page.dart';
import 'package:started_app/app/pages/login.dart';
import 'package:started_app/app/res/layouts/main/main_layout.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Scaffold(
      body: FutureBuilder<bool>(
        future: controller.checkUserToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('Splash'),
            );
          } else {
            if (snapshot.hasError) {
              return Text('Hata: ${snapshot.error}');
            } else {
              if (snapshot.data == true) {
                return const HomePage(); // Eğer kullanıcı oturum açmışsa ana ekranı göster
              } else {
                return const LoginPage(); // Eğer kullanıcı oturum açmamışsa giriş ekranını göster
              }
            }
          }
        },
      ),
    ));
  }
}
