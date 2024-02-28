import 'package:http/http.dart' as http;
import 'package:cingo/app/data/services/api/api_response.dart';
import 'dart:convert';

import 'package:cingo/app/data/services/api/base_api_service.dart';
import 'package:cingo/app/data/services/api/custom_header.dart';
import 'package:cingo/app/res/constants/app_urls.dart';

class AuthService implements BaseApiService {
  @override
  String get baseApiUrl => AppUrl.baseUrl;

  @override
  Future<ApiResponse<Map<String, dynamic>>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseApiUrl/$endpoint'),
      headers: CustomHeaders.create(),
    );

    return ApiResponse.fromHttpResponse(response);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    final response = await http.post(
      Uri.parse('$baseApiUrl/$endpoint'),
      headers: CustomHeaders.create(),
      body: jsonEncode(body),
    );

    return ApiResponse.fromHttpResponse(response);
  }
}
