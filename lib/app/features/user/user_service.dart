import 'package:started_app/app/features/user/user.dart';
import 'package:started_app/core/config/constants/api_urls.dart';
import 'package:started_app/core/models/api_response.dart';
import 'package:started_app/core/models/jwt.dart';
import 'package:started_app/core/services/api/base_network.dart';

class UserService extends BaseApiService {
  Future<ApiResponse<User?>> fetchUser(String userId) async {
    return await get<User>(
      '${ApiUrls.users.rawValue}/$userId',
      fromJsonT: (json) => User.fromJson(json),
    );
  }

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
}
