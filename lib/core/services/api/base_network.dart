// ignore_for_file: void_checks

import 'package:dio/dio.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:started_app/core/config/constants/api_urls.dart';
import 'package:started_app/core/config/constants/navigation_routes.dart';
import 'package:started_app/core/helpers/check_internet.dart';
import 'package:started_app/core/helpers/jwt_helper.dart';
import 'package:started_app/core/models/api_response.dart';

abstract class BaseApiService {
  late final Dio dio;

  BaseApiService() {
    dio = Dio(BaseOptions(
      baseUrl: ApiUrls.baseUrl.rawValue,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  Future<void> _onError(DioException e, ErrorInterceptorHandler handler) async {
    if (e.response != null) {
      final statusCode = e.response?.statusCode;

      if (statusCode == 401) {
        await Future.microtask(() => Get.offAllNamed(RoutesName.LOGIN));
        return handler.reject(e);
      }

      final errorResponse = e.response?.data as Map<String, dynamic>;
      final errorMessage = errorResponse['message'] ?? 'An error occurred';

      final apiErrorResponse = ApiResponse(
        success: false,
        message: errorMessage,
        statusCode: statusCode,
      );

      return handler.resolve(
        Response(
          requestOptions: e.requestOptions,
          data: apiErrorResponse.toJson((data) => data as dynamic),
          statusCode: statusCode,
        ),
      );
    }
    return handler.next(e);
  }

  void _onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  Future<void> _onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await CheckInternetHelper.checkInternet();
    JwtHelper().jwtHandler(options);
    return handler.next(options);
  }

  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    required T Function(Map<String, dynamic>) fromJsonT,
  }) async {
    try {
      final response =
          await dio.get(endpoint, queryParameters: queryParameters);
      return _handleResponse<T>(response, fromJsonT);
    } on DioException catch (e) {
      return ApiResponse<T>(
        success: false,
        message: e.message,
        statusCode: e.response?.statusCode,
      );
    }
  }

  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    required T Function(Map<String, dynamic>) fromJsonT,
  }) async {
    try {
      final response = await dio.post(endpoint, data: data);

      return _handleResponse<T>(response, fromJsonT);
    } on DioException catch (e) {
      return ApiResponse<T>(
        success: false,
        message: e.message,
        statusCode: e.response?.statusCode,
      );
    }
  }

  ApiResponse<T> _handleResponse<T>(
    Response response,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final jsonData = response.data as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return ApiResponse<T>.fromJson(
        jsonData,
        (json) => fromJsonT(json as Map<String, dynamic>),
      );
    } else {
      return ApiResponse<T>.fromJson(
        jsonData,
        (json) => fromJsonT(json as Map<String, dynamic>),
      );
    }
  }
}
