import 'package:http/http.dart' as http;
import 'package:started_app/app/data/models/base_model.dart';
import 'package:started_app/app/data/services/api/exception.dart';
import 'package:started_app/app/data/services/api/response_handler.dart';

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
      final response = await http.get(Uri.parse(baseUrl + path));
      return _responseHandler.handleResponse(response, model);
    } catch (e) {
      throw handleHttpException(e);
    }
  }

  Future httpPost<T extends BaseModel>(
      String path, dynamic data, T model) async {
    try {
      final response = await http.post(Uri.parse(baseUrl + path), body: data);
      return _responseHandler.handleResponse(response, model);
    } catch (e) {
      throw handleHttpException(e);
    }
  }
}
