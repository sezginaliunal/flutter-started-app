import 'dart:async';
import 'package:get/get.dart';
import 'package:started_app/app/data/services/storage/get_storage.dart';
import 'package:started_app/app/res/durations/duration_items.dart';
import 'package:started_app/app/res/enums/preferences_keys.dart';
import 'package:started_app/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final GetStorageService getStorageService = GetStorageService();
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    checkUserToken();
  }

  void checkUserToken() async {
    var isUserToken =
        await getStorageService.getData(PreferencesKeys.TOKEN.toKeyName());
    await Future.delayed(DurationItems.durationNormal());
    if (isUserToken.success) {
      if (isUserToken.data != null) {
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        Get.offAllNamed(AppRoutes.HOME);
      }
    } else {
      Get.offAllNamed(AppRoutes.HOME);
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
