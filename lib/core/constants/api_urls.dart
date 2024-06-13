enum ApiUrls { baseUrl, mobileSettings }

extension ApiUrlsExtension on ApiUrls {
  String get value {
    switch (this) {
      case ApiUrls.baseUrl:
        return 'http://app.mygymcrm.com/mygym/';
      case ApiUrls.mobileSettings:
        return 'mobile_settings.json';
    }
  }
}
