import 'package:get/get.dart';
import 'package:started_app/app/data/models/sample_model.dart';
import 'package:started_app/app/data/services/api/http_base.dart';

class HomeController extends GetxController {
  RxList sampleList = [].obs;
  Future<Data> getData() async {
    final results = await NetworkManager.instance.httpGet<SampleModel>(
      '',
      SampleModel(),
    );
    sampleList.value = results.data;
    return results;
  }
}
