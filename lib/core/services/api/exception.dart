import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:started_app/core/res/enums/api_error.dart';

class ApiException implements Exception {
  final ApiError error;
  final String? message;

  ApiException(this.error, {this.message});
}

ApiException handleHttpException(dynamic e) {
  if (e is SocketException) {
    return ApiException(ApiError.connectionError, message: 'Connection error');
  }
  if (e is http.ClientException) {
    return ApiException(ApiError.connectionError, message: 'Connection error');
  } else if (e is ApiException) {
    return e;
  } else {
    return ApiException(ApiError.unknownError, message: 'Unknown error');
  }
}
