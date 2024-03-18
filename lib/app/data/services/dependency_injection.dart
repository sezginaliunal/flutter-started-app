import 'package:started_app/app/controllers/splash_controller.dart';
import 'package:started_app/app/controllers/translation_controller.dart';
import 'package:started_app/app/data/services/api/http_base.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependecyInjection {
  static Future<void> init() async {
    await GetStorage.init();
    NetworkManager.instance;
    Get.put<TranslationController>(TranslationController());
    Get.put<SplashController>(SplashController());
  }
}
