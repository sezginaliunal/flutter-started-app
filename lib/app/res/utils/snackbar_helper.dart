import 'package:get/get.dart';
import 'package:started_app/app/res/colors/app_colors.dart';

class SnackbarHelper {
  static void showErrorSnackbar(String title, String message) {
    Get.snackbar(title, message,
        colorText: Get.textTheme.bodyMedium?.color,
        backgroundColor: AppColor.redColor);
  }

  static void showSuccessSnackbar(String title, String message) {
    Get.snackbar(title, message,
        colorText: Get.textTheme.titleMedium?.color,
        backgroundColor: AppColor.primaryColor);
  }
}
