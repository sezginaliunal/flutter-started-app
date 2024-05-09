import 'package:get_storage/get_storage.dart';
import 'package:started_app/core/services/storage/base_storage.dart';
import 'package:started_app/core/services/storage/response.dart';

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
      return CacheResponse(data, true, message: data.toString());
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

  Future<CacheResponse<bool>> deleteAllData() async {
    try {
      await _storage.erase();
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

  //Save List Data
  Future<CacheResponse<bool>> saveListData(
      String key, List<dynamic> dataList) async {
    try {
      await _storage.write(key, dataList);
      return CacheResponse(true, true);
    } catch (e) {
      return CacheResponse(false, false, message: e.toString());
    }
  }

  //Load List Data
  Future<CacheResponse<List<dynamic>>> getListData(String key) async {
    try {
      final dataList = _storage.read<List<dynamic>>(key);
      return CacheResponse(
        dataList!,
        true,
      );
    } catch (e) {
      return CacheResponse([], false, message: e.toString());
    }
  }
}
