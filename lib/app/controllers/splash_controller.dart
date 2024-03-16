import 'package:started_app/app/res/durations/duration_items.dart';

class SplashController {
  Future<void> fetchData() async {
    await Future.delayed(DurationItems.durationLarge());
  }
}
