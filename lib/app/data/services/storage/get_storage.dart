import 'package:get_storage/get_storage.dart';
import 'package:started_app/app/data/services/storage/base_storage.dart';
import 'package:started_app/app/data/services/storage/response.dart';

class GetStorageService extends BaseStorageService {
  final GetStorage _storage = GetStorage();

  @override
  Future<CacheResponse<bool>> saveData(String key, dynamic data) async {
    try {
      await _storage.write(key, data);
      return CacheResponse(true, true);
    } catch (e) {
      return CacheResponse(false, false, message: e.toString());
    }
  }

  @override
  Future<CacheResponse<dynamic>> getData(String key) async {
    try {
      final data = _storage.read(key);
      return CacheResponse(data, true, message: data);
    } catch (e) {
      return CacheResponse(null, false, message: e.toString());
    }
  }

  @override
  Future<CacheResponse<bool>> deleteData(String key) async {
    try {
      await _storage.remove(key);
      return CacheResponse(true, true);
    } catch (e) {
      return CacheResponse(false, false, message: e.toString());
    }
  }

  Future<CacheResponse<bool>> containsKey(String key) async {
    try {
      final bool contains = _storage.hasData(key);
      return CacheResponse(contains, true);
    } catch (e) {
      return CacheResponse(false, false, message: e.toString());
    }
  }
}
