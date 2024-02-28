// controllers/main_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  //Global Keys
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  //Change Loading
  RxBool loading = false.obs;
  void changeLoading() {
    loading.value = !loading.value;
  }
}
