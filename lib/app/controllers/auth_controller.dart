
// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:started_app/app/data/services/storage/get_storage.dart';
import 'package:started_app/app/data/services/storage/response.dart';
import 'package:started_app/app/res/enums/preferences_keys.dart';

class AuthController extends GetxController {
  final GetStorageService getStorageService = GetStorageService();
  Future<bool> checkUserToken() async {
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
