import 'package:http/http.dart' as http;
import 'package:started_app/app/data/services/api/api_response.dart';
import 'package:started_app/app/data/services/api/base_api_service.dart';
import 'package:started_app/app/data/services/api/custom_header.dart';
import 'package:started_app/app/data/services/storage/get_storage.dart';
import 'package:started_app/app/res/constants/app_urls.dart';
import 'package:started_app/app/res/constants/strings.dart';

class UserService implements BaseApiService {
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
      return ApiResponse.fromHttpResponse(response);
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
