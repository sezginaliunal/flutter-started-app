import 'package:vexana/vexana.dart';

abstract class BaseApiService<T> {
  late final INetworkManager networkManager;

  BaseApiService(String baseUrl) {
    final options = BaseOptions(
      baseUrl: baseUrl,
    );
    networkManager = NetworkManager<EmptyModel>(
      options: options,
    );
  }

  Future<IResponseModel<T?, INetworkModel?>?> getData(String endpoint);
  Future<IResponseModel<T?, INetworkModel?>?> postData(
      String endpoint, dynamic data);
}
