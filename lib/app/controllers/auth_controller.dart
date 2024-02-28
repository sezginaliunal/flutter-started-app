import 'package:cingo/app/data/models/auth/login_request.dart';
import 'package:cingo/app/data/models/auth/login_response.dart';
import 'package:cingo/app/data/models/auth/register_request.dart';
import 'package:cingo/app/data/models/auth/register_response.dart';
import 'package:cingo/app/data/services/api/api_response.dart';
import 'package:cingo/app/data/services/api/exception.dart';
import 'package:cingo/app/data/services/auth_service.dart';
import 'package:cingo/app/data/services/storage/get_storage.dart';
import 'package:cingo/app/res/constants/strings.dart';
import 'package:cingo/app/res/durations/duration_items.dart';
import 'package:cingo/app/res/utils/snackbar_helper.dart';
import 'package:cingo/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class AuthController extends GetxController {
  final MainController mainController = MainController();
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  final AuthService _authService = AuthService();
  final GetStorageService _getStorageService = GetStorageService();
  //Getters
  String get emailValue => email.value.text.trim();
  String get passwordValue => password.value.text.trim();
  String get nameValue => name.value.text.trim();
  String get lastNameValue => lastName.value.text.trim();

  //Register
  Future<RegisterResponse> register() async {
    mainController.changeLoading();
    RegisterRequest request = RegisterRequest(
        email: emailValue,
        password: passwordValue,
        lastname: lastNameValue,
        name: nameValue);
    try {
      final ApiResponse<Map<String, dynamic>> apiResponse =
          await _authService.post('register', request.toJson());

      if (apiResponse.success) {
        final RegisterResponse response =
            RegisterResponse.fromJson(apiResponse.data!);
        mainController.changeLoading();
        SnackbarHelper.showSuccessSnackbar('Success', 'Success');
        return response;
      } else {
        mainController.changeLoading();
        throw ApiException('Failed to register: ${apiResponse.errorMessage}');
      }
    } catch (e) {
      throw ApiException('Failed to register: $e');
    }
  }

  //Login
  Future<LoginResponse> login() async {
    mainController.changeLoading();
    LoginRequest request =
        LoginRequest(email: emailValue, password: passwordValue);
    try {
      final ApiResponse<Map<String, dynamic>> apiResponse =
          await _authService.post('login', request.toJson());

      if (apiResponse.success) {
        final LoginResponse response =
            LoginResponse.fromJson(apiResponse.data!);
        print(response.toJson());
        await _getStorageService.saveData(AppStrings.token, response.token);
        mainController.changeLoading();
        Get.offAllNamed(AppRoutes.HOME);
        return response;
      } else {
        mainController.changeLoading();

        throw ApiException('Failed to login: ${apiResponse.errorMessage}');
      }
    } catch (e) {
      throw ApiException('Failed to login: $e');
    }
  }

  //Logout
  Future<void> logOut() async {
    await _getStorageService.deleteData(AppStrings.token);
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
