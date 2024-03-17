import 'package:get/get.dart';
import 'package:started_app/app/data/models/sample_model.dart';
import 'package:started_app/app/data/services/api/exception.dart';
import 'package:started_app/app/data/services/api/http_base.dart';
import 'package:started_app/app/data/services/storage/get_storage.dart';
import 'package:started_app/app/data/services/storage/response.dart';
import 'package:started_app/app/res/enums/api_error.dart';
import 'package:started_app/app/res/enums/preferences_keys.dart';
import 'package:started_app/app/res/enums/token_value.dart';
import 'package:started_app/app/res/utils/error_snackbar.dart';

class SplashController extends GetxController {
  final GetStorageService getStorageService = GetStorageService();
  final Rx<TokenValue> _tokenValue = TokenValue.waiting.obs;
  TokenValue get tokenValue => _tokenValue.value;
  Future<TokenValue> checkUserToken() async {
    _tokenValue.value = TokenValue.waiting;
    try {
      await fetchData();
      CacheResponse<dynamic> isUserToken =
          await getStorageService.getData(PreferencesKeys.IS_LOGIN.toKeyName());

      if (isUserToken.success &&
          isUserToken.data != null &&
          isUserToken.data != false) {
        return _tokenValue.value = TokenValue.ok;
      }
      return _tokenValue.value = TokenValue.notFound;
    } catch (e) {
      return _tokenValue.value = TokenValue.error;
    }
  }

  Future<void> fetchData() async {
    try {
      final results = await NetworkManager.instance.httpGet<SampleModel>(
        'api/users',
        SampleModel(),
      );

      return results;
    } on ApiException catch (e) {
      _tokenValue.value = TokenValue.error;
      ErrorSnackbar.showError(e.error.toString());

      throw ApiException(ApiError.unknownError);
    }
  }
}
