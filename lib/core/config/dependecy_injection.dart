import 'package:hive_flutter/hive_flutter.dart';
import 'package:started_app/core/constants/hive_boxes.dart';

class DependecyInjection {
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveBoxConstants.settings.value);
  }
}
