import 'package:get/get.dart';
import 'package:started_app/app/data/models/sample_model.dart';
import 'package:started_app/app/data/services/api/http_base.dart';

class HomeController extends GetxController {
  RxList<Data> sampleList = <Data>[].obs;

  Future<void> getData() async {
    final results = await NetworkManager.instance.httpGet<SampleModel>(
      'api/users',
      SampleModel(),
    );
    if (results != null) {
      final dataList = results.data;
      sampleList.value = dataList;
    }
  }
}
