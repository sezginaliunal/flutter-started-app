import 'package:started_app/app/controllers/splash_controller.dart';

import '../../controllers/navigation_controller.dart';
import '../../controllers/main_controller.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependecyInjection {
  static Future<void> init() async {
    await GetStorage.init();

    Get.put<SplashController>(SplashController());
    Get.put<NavigationController>(NavigationController());
    Get.put<MainController>(MainController());
    // Get.put<HomeController>(HomeController());
  }
}
