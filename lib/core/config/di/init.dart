import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:started_app/app/features/auth/auth_cache_manager.dart';
import 'package:started_app/core/config/constants/hive_boxes.dart';
import 'package:started_app/core/controllers/theme_controller.dart';

Future<void> setupLocator() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveBoxConstants.theme.value);

  final JwtModelCacheManager jwtModelCacheManager =
      JwtModelCacheManager(HiveBoxConstants.jwt.value);
  await jwtModelCacheManager.init();

  // Get.put kullanarak sınıfı hemen yükleyin
  Get.put<JwtModelCacheManager>(jwtModelCacheManager);
  Get.put<ThemeController>(ThemeController());
}
