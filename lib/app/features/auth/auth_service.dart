import 'package:started_app/app/features/user/user.dart';
import 'package:started_app/core/config/constants/api_urls.dart';
import 'package:started_app/core/models/api_response.dart';
import 'package:started_app/core/models/jwt.dart';
import 'package:started_app/core/services/api/base_network.dart';

class AuthService extends BaseApiService {
  Future<ApiResponse<User?>> register(User user) async {
    return await post<User>(
      ApiUrls.register.rawValue,
      data: user.toJson(),
      fromJsonT: (json) => User.fromJson(json),
    );
  }

  Future<ApiResponse<JwtModel?>> login(String email, String password) async {
    return await post<JwtModel>(
      ApiUrls.login.rawValue,
      data: {"email": email, "password": password},
      fromJsonT: (json) => JwtModel.fromJson(json),
    );
  }

  Future<ApiResponse?> logout(String accessToken) async {
    return await post(
      ApiUrls.logout.rawValue,
      data: {"accessToken": accessToken},
      fromJsonT: (json) {
        return ApiResponse.fromJson(json, (data) => null);
      },
    );
  }
}
