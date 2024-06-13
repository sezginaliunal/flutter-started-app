import 'package:hive_flutter/hive_flutter.dart';
import 'package:started_app/app/models/mobile_settings.dart';
import 'package:started_app/core/constants/hive_keys.dart';
import 'package:started_app/core/constants/hive_type_ids.dart';
import 'package:started_app/core/services/database/local/base_cache.dart';

class MobileSettingsCacheManager extends ICacheManager<MobileSettings> {
  MobileSettingsCacheManager(String key) : super(key);

  @override
  Future<void> addItems(List<MobileSettings> items) async {
    for (var item in items) {
      await box?.put(HiveKeysConstants.mobileSettingsKey, item);
    }
  }

  @override
  Future<void> putItems(List<MobileSettings> items) async {
    for (var item in items) {
      await box?.put(HiveKeysConstants.mobileSettingsKey, item);
    }
  }

  @override
  MobileSettings? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putItem(String key, MobileSettings item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  Future<List<MobileSettings>?> getValues() async {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveTypeIds.mobileSettingsTypeId)) {
      Hive.registerAdapter(MobileSettingsAdapter());
    }
  }
}
