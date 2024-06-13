import 'package:get/get.dart';
import 'package:started_app/app/models/mobile_settings.dart';
import 'package:started_app/app/services/api/mobile_settings.dart';
import 'package:started_app/app/services/cache/mobile_settings.dart';
import 'package:started_app/core/constants/api_urls.dart';

class SplashController extends GetxController {
  final MobileSettingsApiService _apiService;
  final MobileSettingsCacheManager _cacheManager;
  RxList<MobileSettings> settingsList = RxList<MobileSettings>();

  SplashController(this._apiService, this._cacheManager);

  @override
  void onInit() {
    super.onInit();
    _cacheManager.init().then(
          (value) => fetchData(),
        );
  }

  void fetchData() async {
    print("object");
    // Attempt to fetch data from cache
    List<MobileSettings>? cachedSettings = await _cacheManager.getValues();

    if (cachedSettings != null && cachedSettings.isNotEmpty) {
      // Use cached data
      print('Using cached data: $cachedSettings');
      settingsList.assignAll(cachedSettings);
    } else {
      // Fetch data from API
      final response = await _apiService.getData(ApiUrls.mobileSettings.value);
      if (response != null && response.data != null) {
        // Save data to cache
        await _cacheManager.addItems([response.data!]);
        settingsList.assignAll([response.data!]);

        print('Data fetched from API and cached: ${response.data}');
      } else {
        print('Failed to fetch data from API');
      }
    }
  }

  // Yalnızca ilk MobileSettings verisini döndüren metod
  MobileSettings? getFirstSettingsValue() {
    if (settingsList.isNotEmpty) {
      return settingsList.first;
    }
    return null; // Eğer settingsList boş ise null döner
  }
}
