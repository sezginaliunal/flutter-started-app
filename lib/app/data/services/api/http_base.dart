import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:started_app/app/data/models/base_model.dart';
import 'package:started_app/app/data/services/api/exception.dart';
import 'package:started_app/app/res/enums/api_error.dart';
import 'package:started_app/app/res/utils/error_snackbar.dart';

class NetworkManager {
  static NetworkManager? _instance;
  String get baseUrl => 'https://reqres.in/';

  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init();

  Future httpGet<T extends BaseModel>(String path, T model) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + path));
      return _handleResponse(response, model);
    } catch (e) {
      throw _handleHttpException(e);
    }
  }

  Future httpPost<T extends BaseModel>(
      String path, dynamic data, T model) async {
    try {
      final response = await http.post(Uri.parse(baseUrl + path), body: data);
      return _handleResponse(response, model);
    } catch (e) {
      throw _handleHttpException(e);
    }
  }

  dynamic _handleResponse<T extends BaseModel>(
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
          ErrorSnackbar.show('Resource not found');
          throw ApiException(ApiError.notFoundError,
              message: 'Resource not found');
        case 401:
          ErrorSnackbar.show('Unauthorized');
          throw ApiException(ApiError.unauthorizedError,
              message: 'Unauthorized');
        case 400:
          ErrorSnackbar.show('Bad Request');
          throw ApiException(ApiError.badRequest, message: 'Bad Request');
        default:
          ErrorSnackbar.show('Unknown error');
          throw ApiException(ApiError.unknownError, message: 'Unknown error');
      }
    } catch (e) {
      print(response.body);
      rethrow;
    }
  }

  ApiException _handleHttpException(dynamic e) {
    if (e is http.ClientException) {
      return ApiException(ApiError.connectionError,
          message: 'Connection error');
    } else {
      return ApiException(ApiError.unknownError, message: 'Unknown error');
    }
  }
}
