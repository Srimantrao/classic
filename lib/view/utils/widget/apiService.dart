// ignore_for_file: file_names

import 'package:classic/view/utils/app_URL.dart';
import 'package:dio/dio.dart';

import '../app_Constants.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrl.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(url, data: data);
  }

  static Future<Response> get(String url) async {
    return await dio.get(url,options: Options(headers: {
      'Authorization': 'Bearer $tokan',
    }));
  }
}
