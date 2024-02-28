import 'dart:convert';

import 'package:cingo/app/res/utils/snackbar_helper.dart';
import 'package:cingo/app/routes/app_routes.dart';
import 'package:get/get.dart';

enum HttpStatus {
  ok,
  created,
  badRequest,
  unauthorized,
  internalServerError,
  rateLimit,
}

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? errorMessage;
  final HttpStatus httpStatus;

  ApiResponse({
    required this.success,
    this.data,
    this.errorMessage,
    required this.httpStatus,
  });

  factory ApiResponse.fromHttpResponse(var response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse(
        success: true,
        data: jsonDecode(response.body),
        errorMessage: '',
        httpStatus: HttpStatus.ok,
      );
    } else if (response.statusCode == 400) {
      final data = jsonDecode(response.body);
      SnackbarHelper.showErrorSnackbar('Error', data['message']);
      return ApiResponse(
        success: false,
        errorMessage: 'HTTP Error: ${response.statusCode}',
        data: data,
        httpStatus: HttpStatus.ok,
      );
    } else if (response.statusCode == 429) {
      final data = jsonDecode(response.body);
      SnackbarHelper.showErrorSnackbar('Error', data['message']);
      return ApiResponse(
        success: false,
        errorMessage: 'HTTP Error: ${response.statusCode}',
        data: data,
        httpStatus: HttpStatus.rateLimit,
      );
    } else if (response.statusCode == 401) {
      final data = jsonDecode(response.body);
      SnackbarHelper.showErrorSnackbar('Error', data['message']);
      Get.offAllNamed(AppRoutes.LOGIN);
      return ApiResponse(
        success: false,
        errorMessage: 'Unauthorized Access',
        data: null,
        httpStatus: HttpStatus.unauthorized,
      );
    } else {
      return ApiResponse(
        success: false,
        errorMessage: 'HTTP Error: ${response.statusCode}',
        data: null,
        httpStatus: HttpStatus.internalServerError,
      );
    }
  }
}
