import 'package:get/get.dart';
import 'package:started_app/app/features/user/user.dart';
import 'package:started_app/app/features/user/user_service.dart';

class UserController extends GetxController {
  final UserService _userService = UserService();
  var user = Rx<User?>(null);
  var isLoading = false.obs;

  Future<void> fetchUser(String userId) async {
    isLoading.value = true;
    final response = await _userService.fetchUser(userId);
    isLoading.value = false;

    if (response.success == true) {
      user.value = response.data;
    } else {
      Get.snackbar(
        'Error',
        response.message ?? 'An error occurred while fetching user data.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
