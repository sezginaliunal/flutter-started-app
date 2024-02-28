import 'dart:async';
import 'package:get/get.dart';
import 'package:cingo/app/data/services/storage/get_storage.dart';
import 'package:cingo/app/res/constants/strings.dart';
import 'package:cingo/app/res/durations/duration_items.dart';
import 'package:cingo/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final GetStorageService getStorageService = GetStorageService();
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    checkUserToken();
  }

  void checkUserToken() async {
    var isUserToken = await getStorageService.getData(AppStrings.token);
    await Future.delayed(DurationItems.durationNormal());
    if (isUserToken.success) {
      print('Token :${isUserToken.data}');
      if (isUserToken.data != null) {
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        Get.offAllNamed(AppRoutes.LOGIN);
      }
    } else {
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
