import 'package:hive_flutter/hive_flutter.dart';
import 'package:started_app/core/config/constants/hive_boxes.dart';
import 'package:started_app/core/controllers/theme_controller.dart';
import 'package:started_app/main.dart';

Future<void> setupLocator() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveBoxConstants.theme.value);

  getIt.registerLazySingleton(() => ThemeNotifier());
}
