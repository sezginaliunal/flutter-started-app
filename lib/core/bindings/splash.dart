import 'package:get/get.dart';
import 'package:started_app/app/features/auth/auth_controller.dart';
import 'package:started_app/app/features/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
