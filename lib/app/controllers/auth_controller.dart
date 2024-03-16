import 'package:get/get.dart';
import 'package:started_app/app/controllers/splash_controller.dart';
import 'package:started_app/app/data/services/storage/get_storage.dart';
import 'package:started_app/app/data/services/storage/response.dart';
import 'package:started_app/app/res/enums/preferences_keys.dart';

class AuthController extends GetxController {
  final GetStorageService getStorageService = GetStorageService();
  final SplashController _splashController = SplashController();

  Future<bool> checkUserToken() async {
    await _splashController.fetchData();
    CacheResponse<dynamic> isUserToken =
        await getStorageService.getData(PreferencesKeys.IS_LOGIN.toKeyName());

    if (isUserToken.success &&
        isUserToken.data != null &&
        isUserToken.data != false) {
      return true;
    }
    return false;
  }
}
