import 'package:started_app/app/features/user/user.dart';
import 'package:started_app/core/config/constants/api_urls.dart';
import 'package:vexana/vexana.dart';

abstract class BaseApiService<T> {
  late final INetworkManager networkManager;

  BaseApiService() {
    final options = BaseOptions(
      baseUrl: ApiUrls.baseUrl.rawValue,
    );
    networkManager = NetworkManager<EmptyModel>(
        options: options, isEnableLogger: true, skippingSSLCertificate: true);
  }

  Future<T?> getData(String endpoint);
  Future<T?> getListData(String endpoint);
  Future<T?> postData(String endpoint, dynamic data);
}

class UserService extends BaseApiService<User> {
  @override
  Future<User?> getData(String endpoint) async {
    final result = await networkManager.send<User, User>(
      endpoint,
      parseModel: User(),
      method: RequestType.GET,
    );
    print(result.data);
    return result.data;
  }

  @override
  Future<User?> getListData(String endpoint) async {
    final result = await networkManager.send<User, User>(
      endpoint,
      parseModel: User(),
      method: RequestType.GET,
    );

    if (result.data != null) {
      return result.data;
    } else {
      // Handle null case according to your application logic
      return null; // Or throw an error, depending on your needs
    }
  }

  @override
  Future<User?> postData(String endpoint, dynamic data) {
    // TODO: Implement postData if needed for your application
    throw UnimplementedError();
  }
}
