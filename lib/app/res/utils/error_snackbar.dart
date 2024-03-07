import 'package:get/get.dart';

class ErrorSnackbar {
  static void showError(String message) {
    Get.snackbar('Error', message);
  }

  static void showSuccess(String message) {
    Get.snackbar('Success', message);
  }
}
