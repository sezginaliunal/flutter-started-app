import 'package:http/http.dart' as http;
import 'package:started_app/app/data/services/api/api_response.dart';
import 'dart:convert';

import 'package:started_app/app/data/services/api/base_api_service.dart';
import 'package:started_app/app/data/services/api/custom_header.dart';
import 'package:started_app/app/res/constants/app_urls.dart';
import 'package:started_app/app/res/utils/snackBar_helper.dart';

class AuthService implements BaseApiService {
  @override
  String get baseApiUrl => AppUrl.baseUrl;

  @override
  Future<ApiResponse<Map<String, dynamic>>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseApiUrl/$endpoint'),
      headers: CustomHeaders.create(),
    );
    if (response.statusCode == 201) {
      SnackbarHelper.showSuccessSnackbar('Success', 'Congratulations');
      return ApiResponse(
          success: true, data: jsonDecode(response.body), errorMessage: '');
    } else {
      final data = jsonDecode(response.body);
      SnackbarHelper.showErrorSnackbar('Error', data['error']);
      return ApiResponse(
        success: false,
        errorMessage: 'HTTP Error: ${response.statusCode}',
        data: data,
      );
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> post(
      String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseApiUrl/$endpoint'),
      headers: CustomHeaders.create(),
      body: jsonEncode(body),
    );
    if (response.statusCode == 201) {
      SnackbarHelper.showSuccessSnackbar('Success', 'Congratulations');
      return ApiResponse(
          success: true, data: jsonDecode(response.body), errorMessage: '');
    } else {
      final data = jsonDecode(response.body);
      SnackbarHelper.showErrorSnackbar('Error', data['message']);
      return ApiResponse(
        success: false,
        errorMessage: 'HTTP Error: ${response.statusCode}',
        data: data,
      );
    }
  }
}
