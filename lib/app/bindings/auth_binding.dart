import 'package:get/get.dart';
import 'package:started_app/app/controllers/Auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
