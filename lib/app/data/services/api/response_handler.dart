
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:started_app/app/data/models/base_model.dart';
import 'package:started_app/app/data/services/api/exception.dart';
import 'package:started_app/app/res/enums/api_error.dart';

enum ResponseType {
  error,
  msg,
  message,
}

class ResponseHandler {
dynamic handleResponse<T extends BaseModel>(
  http.Response response,
  T model,
) {
  try {
    switch (response.statusCode) {
      case 200:
      case 201:
        final responseBody = response.body;
        final parsedResponse = json.decode(responseBody);

        if (parsedResponse is List) {
          return parsedResponse.map((item) => model.fromJson(item)).toList();
        } else if (parsedResponse is Map) {
          return model.fromJson(parsedResponse);
        }
        return responseBody;
      case 404:
        throw ApiException(ApiError.notFoundError,
            message: 'Resource not found');
      case 401:
        throw ApiException(ApiError.unauthorizedError,
            message: 'Unauthorized');
      case 400:
        throw ApiException(ApiError.badRequest, message: 'Bad Request');

    }
  } catch (e) {
    rethrow;

  }
}




  static String? getMessage(dynamic jsonData, ResponseType type) {
    switch (type) {
      case ResponseType.error:
        return jsonData['error'] as String?;
      case ResponseType.msg:
        return jsonData['msg'] as String?;
      case ResponseType.message:
        return jsonData['message'] as String?;
      default:
        return null;
    }
  }
}