import 'package:get/get.dart';

import 'package:started_app/app/data/services/storage/get_storage.dart';
import 'package:started_app/app/data/services/storage/response.dart';
import 'package:started_app/app/res/durations/duration_items.dart';
import 'package:started_app/app/res/enums/preferences_keys.dart';

class SplashController extends GetxController {
  final GetStorageService getStorageService = GetStorageService();

  Future<bool> checkUserToken() async {
    await Future.delayed(DurationItems.durationNormal());
    CacheResponse<dynamic> isUserToken =
        await getStorageService.getData(PreferencesKeys.IS_LOGIN.toKeyName());

    if (isUserToken.success &&
        isUserToken.data != null &&
        isUserToken.data != false) {
      return true;
    }
    return false;
  }

  @override
  void onInit() {
    checkUserToken();
    super.onInit();
  }
}
