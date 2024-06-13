import 'package:get/get.dart';
import 'package:started_app/app/controllers/splash_controller.dart';
import 'package:started_app/app/services/api/mobile_settings.dart';
import 'package:started_app/app/services/cache/mobile_settings.dart';
import 'package:started_app/core/constants/api_urls.dart';
import 'package:started_app/core/constants/hive_boxes.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(
        MobileSettingsApiService(ApiUrls.baseUrl.value),
        MobileSettingsCacheManager(HiveBoxConstants.mobileSettings.value)));
  }
}
