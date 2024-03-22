import 'package:get/get.dart';
import 'package:started_app/app/data/services/api/exception.dart';
import 'package:started_app/app/res/durations/duration_items.dart';

class SplashController extends GetxController {
  Future<void> testMethod() async {
    try {
      await Future.delayed(DurationItems.durationNormal());
    } catch (e) {
      handleHttpException(e);
      rethrow;
    }
  }
}
