import 'package:started_app/app/data/services/storage/response.dart';

abstract class BaseStorageService {
  Future<CacheResponse<bool>> saveData(String key, dynamic data);

  Future<CacheResponse<dynamic>> getData(String key);

  Future<CacheResponse<bool>> deleteData(String key);
}
