import 'package:hive_flutter/hive_flutter.dart';
import 'package:started_app/core/config/constants/hive_type_ids.dart';
import 'package:started_app/core/models/jwt.dart';
import 'package:started_app/core/services/database/local/base_cache.dart';

class JwtModelCacheManager extends ICacheManager<JwtModel> {
  JwtModelCacheManager(String key) : super(key);

  @override
  Future<void> addItems(List<JwtModel> items) async {
    await box?.addAll(items);
  }

  @override
  Future<void> putItems(List<JwtModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  JwtModel? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putItem(String key, JwtModel item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  Future<List<JwtModel>?> getValues() async {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveTypeIds.jwtModelTypeId)) {
      Hive.registerAdapter(JwtModelAdapter());
    }
  }
}
