enum ApiUrls { baseUrl, users, register, login, logout }

extension ApiUrlsExtension on ApiUrls {
  String get rawValue {
    switch (this) {
      case ApiUrls.baseUrl:
        return 'http://10.0.2.2:8000/api';
      case ApiUrls.users:
        return '/users';
      case ApiUrls.register:
        return '/auth/register';
      case ApiUrls.login:
        return '/auth/login';
      case ApiUrls.logout:
        return '/auth/logout';
    }
  }
}
