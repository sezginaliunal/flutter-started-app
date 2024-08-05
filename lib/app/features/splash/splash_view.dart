import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:started_app/app/features/splash/splash_controller.dart';
import 'package:started_app/core/config/constants/navigation_routes.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: controller.checkJwt(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Bir hata oluştu.'));
          } else if (snapshot.hasData && snapshot.data == true) {
            Future.microtask(() => Get.offAllNamed(RoutesName.HOME));
            return const SizedBox.shrink();
          } else {
            Future.microtask(() => Get.offAllNamed(RoutesName.LOGIN));
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
