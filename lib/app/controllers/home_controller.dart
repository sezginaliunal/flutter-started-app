import 'package:get/get.dart';
import 'package:started_app/app/data/models/sample_model.dart';
import 'package:started_app/app/data/services/api/http_base.dart';

class HomeController extends GetxController {
  RxList sampleList = [].obs;
  RxString token = ''.obs;
  void getSampleHttp() async {
    var result = await NetworkManager.instance
        .httpGet<SampleModel>('users', SampleModel());

    sampleList.value = result;
  }

  Future<dynamic> postSampleHttp() async {
    final data = SampleModel(email: "peter@klaven", password: "").toJson();
    try {
      SampleModelResponse result = await NetworkManager.instance
          .httpPost<SampleModelResponse>(
              'api/login', data, SampleModelResponse());
      token.value = result.token ?? '';

      return token.value;
    } catch (e) {
      return SampleModelResponse();
    }
  }
}
