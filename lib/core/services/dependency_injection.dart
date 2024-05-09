import 'package:started_app/core/controllers/network_controller.dart';
import 'package:started_app/core/controllers/translation_controller.dart';
import 'package:started_app/core/services/api/http_base.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependencyInjection {
  static Future<void> init() async {
    Get.put<NetworkController>(NetworkController(), permanent: true);

    await GetStorage.init();
    NetworkManager.instance;
    Get.put<TranslationController>(TranslationController());
  }
}
