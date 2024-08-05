import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:started_app/app/features/auth/auth_cache_manager.dart';
import 'package:started_app/core/config/constants/hive_boxes.dart';

class JwtHelper {
  final JwtModelCacheManager jwtModelCacheManager = Get.find();

  void jwtHandler(RequestOptions options) {
    final jwt = jwtModelCacheManager.getItem(HiveBoxConstants.jwt.value);
    // İstek öncesi işlem yapılabilir
    options.headers['Authorization'] = 'Bearer ${jwt?.accessToken}';
    options.headers['userId'] = jwt?.userId;
  }
}
