import 'package:get/get.dart';
import 'package:started_app/app/data/services/auth/base_auth_services.dart';
import 'package:started_app/app/data/services/storage/get_storage.dart';
import 'package:started_app/app/res/enums/preferences_keys.dart';
import 'package:started_app/app/routes/app_routes.dart';

class AuthService implements BaseAuthService{
  final GetStorageService _getStorageService = GetStorageService();
  @override
  Future<bool> logOut() async{
  await _getStorageService.deleteData(PreferencesKeys.IS_LOGIN.toKeyName());
  Get.offAllNamed(AppRoutes.LOGIN);
  return true;
  }

  @override
  Future<bool> login()async {
   await _getStorageService.saveData(PreferencesKeys.IS_LOGIN.toKeyName(),true);
  return true;
  }
}