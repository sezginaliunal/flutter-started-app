import 'package:started_app/app/models/mobile_settings.dart';
import 'package:started_app/core/services/api/base_network.dart';
import 'package:vexana/vexana.dart';

class MobileSettingsApiService extends BaseApiService<MobileSettings> {
  MobileSettingsApiService(String baseUrl) : super(baseUrl);

  @override
  Future<IResponseModel<MobileSettings?, INetworkModel?>?> getData(
      String endpoint) async {
    final response = await networkManager.send<MobileSettings, MobileSettings>(
        endpoint,
        parseModel: MobileSettings(),
        isErrorDialog: true,
        method: RequestType.GET);
    return response;
  }

  @override
  Future<IResponseModel<MobileSettings?, INetworkModel?>?> postData(
      String endpoint, data) {
    // TODO: implement postData
    throw UnimplementedError();
  }
}
