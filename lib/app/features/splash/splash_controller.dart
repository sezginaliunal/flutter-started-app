import 'package:get/get.dart';
import 'package:started_app/app/features/auth/auth_cache_manager.dart';
import 'package:started_app/core/config/constants/hive_boxes.dart';

class SplashController extends GetxController {
  final JwtModelCacheManager jwtModelCacheManager = Get.find();

  Future<bool> checkJwt() async {
    final jwt = jwtModelCacheManager.getItem(HiveBoxConstants.jwt.value);
    if (jwt != null) {
      return true;
    } else {
      return false;
    }
  }
}
