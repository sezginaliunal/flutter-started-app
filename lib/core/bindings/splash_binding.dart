import 'package:get/get.dart';
import 'package:started_app/app/controllers/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    print("object");
  }
}
