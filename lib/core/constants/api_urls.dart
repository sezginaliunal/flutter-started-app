enum ApiUrls {
  baseUrl,
}

extension ApiUrlsExtension on ApiUrls {
  String get value {
    switch (this) {
      case ApiUrls.baseUrl:
        return '/baseUrl';
    }
  }
}
