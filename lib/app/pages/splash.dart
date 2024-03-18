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
              // Eğer gelecek veri bekleniyorsa, bir yükleme gösterebiliriz.
              return const CircularProgressIndicator();
            } else {
              // Veri geldiğinde işleyelim
              if (snapshot.hasError) {
                // Eğer hata varsa, hata mesajını gösterelim
                return Text('Error: ${snapshot.error}');
              } else {
                // Eğer veri geldiyse, kontrol edip uygun sayfayı gösterelim
                final bool isLoggedIn = snapshot.data ?? false;
                if (isLoggedIn) {
                  // Eğer kullanıcı giriş yapmışsa
                  return const HomePage();
                } else {
                  // Eğer kullanıcı giriş yapmamışsa
                  return const LoginPage();
                }
              }
            }
          },
        ),
      ),
    );
  }
}
