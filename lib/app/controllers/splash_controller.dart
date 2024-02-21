import 'package:get/get.dart';
import 'package:started_app/app/res/durations/duration_items.dart';
import 'package:started_app/app/routes/app_routes.dart';

class SplashController extends GetxController {
  goToPage() async {
    await Future.delayed(DurationItems.durationNormal());
    Get.offAllNamed(AppRoutes.HOME);
  }

  @override
  void onInit() {
    super.onInit();
    goToPage();
  }
}
