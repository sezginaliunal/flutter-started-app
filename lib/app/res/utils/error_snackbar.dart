import 'package:get/get.dart';

class ErrorSnackbar {
  static void show(String message) {
    Get.snackbar('Error', message);
  }
}
