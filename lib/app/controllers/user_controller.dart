import 'package:cingo/app/res/constants/app_urls.dart';
import 'package:get/get.dart';
import 'package:cingo/app/data/models/user/user.dart';
import 'package:cingo/app/data/services/api/api_response.dart';
import 'package:cingo/app/data/services/api/exception.dart';
import 'package:cingo/app/data/services/user/user_get.dart';

class UserController extends GetxController {
  final UserGetService _userGetService = UserGetService();

  Future<Data> getUser() async {
    try {
      final ApiResponse<Map<String, dynamic>> apiResponse =
          await _userGetService.get(AppUrl.me);
      if (apiResponse.success) {
        final UserInfo response = UserInfo.fromJson(apiResponse.data!);
        print(response.data?.email);
        return response.data ?? Data();
      } else {
        throw ApiException('Failed to get users: ${apiResponse.errorMessage}');
      }
    } catch (e) {
      throw ApiException('Failed to get users: $e');
    }
  }
}
