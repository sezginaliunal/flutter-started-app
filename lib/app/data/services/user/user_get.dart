import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:started_app/app/data/services/api/api_response.dart';
import 'package:started_app/app/data/services/api/base_api_service.dart';
import 'package:started_app/app/data/services/api/custom_header.dart';
import 'package:started_app/app/data/services/storage/get_storage.dart';
import 'package:started_app/app/res/constants/app_urls.dart';
import 'package:started_app/app/res/constants/strings.dart';
import 'package:started_app/app/res/utils/snackBar_helper.dart';

class UserGetService implements BaseApiService {
  @override
  String get baseApiUrl => AppUrl.baseUrl;
  var storageService = GetStorageService();

  @override
  Future<ApiResponse<Map<String, dynamic>>> get(String endpoint) async {
    var userToken = await storageService.getData(AppStrings.token);
    if (userToken.success) {
      final response = await http.get(
        Uri.parse('$baseApiUrl/$endpoint'),
        headers:
            CustomHeaders.create(authorization: 'Bearer ${userToken.data}'),
      );
      print(response.headers);
      if (response.statusCode == 200) {
        SnackbarHelper.showSuccessSnackbar('Success', 'Congratulations');
        return ApiResponse(
            success: true, data: jsonDecode(response.body), errorMessage: '');
      } else {
        final data = jsonDecode(response.body);
        print(data);
        SnackbarHelper.showErrorSnackbar('Error', data['message']);
        return ApiResponse(
          success: false,
          errorMessage: 'HTTP Error: ${response.statusCode}',
          data: data,
        );
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> post(
      String endpoint, Map<String, dynamic> body) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
