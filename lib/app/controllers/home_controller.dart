import 'package:get/get.dart';
import 'package:started_app/app/data/models/sample_model.dart';
import 'package:started_app/app/data/services/api/exception.dart';
import 'package:started_app/app/data/services/api/http_base.dart';

class HomeController extends GetxController {
  RxList<Data> sampleList = <Data>[].obs;

  Future<List<Data>?> getData() async {
    try {
      final SampleModel results =
          await NetworkManager.instance.httpGet<SampleModel>(
        'api/users',
        SampleModel(),
      );
      sampleList.value = results.data!;
      return results.data;
    } on ApiException catch (e) {
      assert(e.message is ApiException);

      throw handleHttpException(e);
    }
  }
}
