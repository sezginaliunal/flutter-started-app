import 'package:get/get.dart';
import 'package:started_app/app/models/mobile_settings.dart';
import 'package:started_app/app/services/api/mobile_settings.dart';
import 'package:started_app/app/services/cache/mobile_settings.dart';
import 'package:started_app/core/constants/api_urls.dart';
import 'package:started_app/core/constants/hive_boxes.dart';
import 'package:started_app/core/constants/hive_keys.dart';

class SplashController extends GetxController {
  final MobileSettingsCacheManager _cacheManager =
      MobileSettingsCacheManager(HiveBoxConstants.mobileSettings.value);
  final MobileSettingsApiService _apiService =
      MobileSettingsApiService(ApiUrls.baseUrl.value); // Your base URL

  Rx<MobileSettings?> mobileSettings = Rx<MobileSettings?>(null);

  @override
  void onInit() {
    super.onInit();
    _cacheManager.init().then((_) => fetchMobileSettings());
  }

  Future<void> fetchMobileSettings() async {
    // Önce yerel depoda veri olup olmadığını kontrol edin
    var cachedSettings =
        _cacheManager.getItem(HiveKeysConstants.mobileSettingsKey.value);

    if (cachedSettings != null) {
      // Yerel veri mevcut, bu veriyi kullanın ve API isteği atlamayın
      mobileSettings.value = cachedSettings;
    } else {
      // Yerel veri yok, API isteği yapın
      var response = await _apiService.getData(ApiUrls.mobileSettings.value);

      if (response?.data != null) {
        mobileSettings.value = response?.data;
        await _cacheManager.putItem(response!.data!.AppUrl!, response.data!);
      }
    }
  }
}
