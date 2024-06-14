import 'package:vexana/vexana.dart';

abstract class BaseApiService<T> {
  late final INetworkManager networkManager;

  BaseApiService() {
    final options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    );
    networkManager =
        NetworkManager<EmptyModel>(options: options, isEnableLogger: true);
  }

  Future<T?> getData(String endpoint);
  Future<T?> postData(String endpoint, dynamic data);
}
