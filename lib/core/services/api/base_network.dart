import 'package:started_app/core/config/constants/api_urls.dart';
import 'package:vexana/vexana.dart';

abstract class BaseApiService<T> {
  late final INetworkManager networkManager;

  BaseApiService() {
    final options = BaseOptions(
      baseUrl: ApiUrls.baseUrl.value,
    );
    networkManager = NetworkManager<EmptyModel>(
        options: options, isEnableLogger: true, skippingSSLCertificate: true);
  }

  Future<T?> getData(String endpoint);
  Future<T?> postData(String endpoint, dynamic data);
}
