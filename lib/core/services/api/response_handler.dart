import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:started_app/core/models/base_model.dart';
import 'package:started_app/core/services/api/exception.dart';
import 'package:started_app/core/res/enums/api_error.dart';

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
}
