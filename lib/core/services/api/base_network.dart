import 'package:dio/dio.dart';
import 'package:started_app/core/config/constants/api_urls.dart';

abstract class BaseApiService<T> {
  late final Dio dio;

  BaseApiService() {
    final options = BaseOptions(
      baseUrl: ApiUrls.baseUrl.value,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    dio = Dio(options);
  }

  Future<T?> getData(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      if (response.statusCode == 200) {
        return response.data as T?;
      } else {
        print('Failed to get data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  Future<T?> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data as T?;
      } else {
        print('Failed to post data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}
