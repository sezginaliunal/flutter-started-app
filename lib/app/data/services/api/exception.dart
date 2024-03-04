import 'package:started_app/app/res/enums/api_error.dart';

class ApiException implements Exception {
  final ApiError error;
  final String message;

  ApiException(this.error, {this.message = ''});

  @override
  String toString() {
    return 'ApiException: $error - $message';
  }
}
