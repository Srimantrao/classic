import 'package:classic/view/utils/app_URL.dart';
import 'package:dio/dio.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrl.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    return await dio.post(url, data: data);
  }

  static Future<Response> get(String url) async {
    return await dio.get(url);
  }
}
