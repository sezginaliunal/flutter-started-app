import 'package:started_app/app/data/models/auth/login_request.dart';
import 'package:started_app/app/data/models/auth/login_response.dart';
import 'package:started_app/app/data/models/auth/register_request.dart';
import 'package:started_app/app/data/models/auth/register_response.dart';
import 'package:started_app/app/data/services/api/api_response.dart';
import 'package:started_app/app/data/services/api/exception.dart';
import 'package:started_app/app/data/services/auth_service.dart';
import 'package:started_app/app/data/services/storage/get_storage.dart';
import 'package:started_app/app/res/constants/strings.dart';

class AuthController {
  final AuthService _authService = AuthService();
  final GetStorageService _getStorageService = GetStorageService();
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final ApiResponse<Map<String, dynamic>> apiResponse =
          await _authService.post('register', request.toJson());

      if (apiResponse.success) {
        final RegisterResponse response =
            RegisterResponse.fromJson(apiResponse.data);
        print(response.toJson());
        return response;
      } else {
        throw ApiException('Failed to register: ${apiResponse.errorMessage}');
      }
    } catch (e) {
      throw ApiException('Failed to register: $e');
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final ApiResponse<Map<String, dynamic>> apiResponse =
          await _authService.post('login', request.toJson());

      if (apiResponse.success) {
        final LoginResponse response = LoginResponse.fromJson(apiResponse.data);
        print(response.toJson());
        _getStorageService.saveData(AppStrings.token, response.token);
        return response;
      } else {
        throw ApiException('Failed to login: ${apiResponse.errorMessage}');
      }
    } catch (e) {
      throw ApiException('Failed to login: $e');
    }
  }
}
