import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_app/app/features/auth/auth_cache_manager.dart';
import 'package:started_app/app/features/auth/auth_service.dart';
import 'package:started_app/app/features/user/user.dart';
import 'package:started_app/core/config/constants/hive_boxes.dart';
import 'package:started_app/core/config/constants/navigation_routes.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  final JwtModelCacheManager jwtModelCacheManager = Get.find();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  Future<void> register() async {
    if (registerKey.currentState!.validate()) {
      final user = User(
        name: name.text,
        surname: surname.text,
        email: email.text,
        password: password.text,
        pushNotificationId: "asdsadsa",
      );
      isLoading.value = true;
      final response = await _authService.register(user);
      isLoading.value = false;

      if (response.success == true) {
        await Future.microtask(() => Get.offAllNamed(RoutesName.LOGIN));
      } else {
        print(response.message);
      }
    }
  }

  Future<void> login() async {
    if (loginKey.currentState!.validate()) {
      isLoading.value = true;
      final response = await _authService.login(email.text, password.text);
      isLoading.value = false;

      if (response.success == true) {
        final jwt = response.data;
        await jwtModelCacheManager.putItem(HiveBoxConstants.jwt.value, jwt!);
        await Future.microtask(() => Get.offAllNamed(RoutesName.HOME));
      } else {
        print(response.message);
      }
    }
  }

  Future<void> logout() async {
    isLoading.value = true;
    final jwt = jwtModelCacheManager.getItem('jwt');
    final response = await _authService.logout(jwt!.accessToken);
    isLoading.value = false;
    if (response?.success == true) {
      await Future.microtask(() => Get.offAllNamed(RoutesName.LOGIN));
    }
  }
}
