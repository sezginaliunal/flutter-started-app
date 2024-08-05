import 'package:get/get.dart';
import 'package:started_app/app/features/auth/auth_cache_manager.dart';
import 'package:started_app/app/features/auth/auth_controller.dart';
import 'package:started_app/app/features/user/user.dart';
import 'package:started_app/app/features/user/user_service.dart';
import 'package:started_app/core/config/constants/hive_boxes.dart';

class HomeController extends GetxController {
  final UserService userService = UserService();
  final JwtModelCacheManager jwtModelCacheManager = Get.find();
  final AuthController authController = Get.find();

  Future<User?> fetchUser() async {
    final jwt = jwtModelCacheManager.getItem(HiveBoxConstants.jwt.value);
    final response = await userService.fetchUser(jwt!.userId);

    return response.data;
  }
}
