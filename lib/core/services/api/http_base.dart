import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:started_app/core/models/base_model.dart';
import 'package:started_app/core/services/api/exception.dart';
import 'package:started_app/core/services/api/response_handler.dart';

class NetworkManager {
  static NetworkManager? _instance;
  final ResponseHandler _responseHandler = ResponseHandler();
  String get baseUrl => 'https://reqres.in/';

  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init();

  Future httpGet<T extends BaseModel>(String path, T model) async {
    try {
      final uriPath = baseUrl + path;
      final response = await http.get(Uri.parse(uriPath));
      if (kDebugMode) {
        print(uriPath);
      }
      return _responseHandler.handleResponse(response, model);
    } catch (e) {
      throw handleHttpException(e);
    }
  }

  Future httpPost<T extends BaseModel>(
      String path, dynamic data, T model) async {
    try {
      final uriPath = baseUrl + path;

      final response = await http.post(Uri.parse(uriPath), body: data);
      return _responseHandler.handleResponse(response, model);
    } catch (e) {
      throw handleHttpException(e);
    }
  }
}
