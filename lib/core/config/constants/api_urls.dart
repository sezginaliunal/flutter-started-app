enum ApiUrls { baseUrl, users }

extension ApiUrlsExtension on ApiUrls {
  String get rawValue {
    switch (this) {
      case ApiUrls.baseUrl:
        return 'https://reqres.in/api';
      case ApiUrls.users:
        return '/users';
    }
  }
}
