import 'package:http/http.dart' as http;
import 'package:started_app/app/data/services/api/api_response.dart';
import 'dart:convert';

import 'package:started_app/app/data/services/api/base_api_service.dart';
import 'package:started_app/app/data/services/api/custom_header.dart';
import 'package:started_app/app/res/constants/app_urls.dart';

class QuotesService implements BaseApiService {
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