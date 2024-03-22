import 'package:get/get.dart';
import 'package:started_app/app/data/models/sample_model.dart';
import 'package:started_app/app/data/services/api/http_base.dart';

class SplashController extends GetxController {
  Future<void> testMethod() async {
    try {
      final results = await NetworkManager.instance.httpGet<SampleModel>(
        'api/users',
        SampleModel(),
      );
      return results;
    } catch (e) {
      throw Exception();
    }
  }
}
