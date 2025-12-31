// ignore_for_file: avoid_print, file_names

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class Categoryservice {
  Future<Response<dynamic>> categorySerivce() {
    final Future<Response<dynamic>> response = ApiService.get(AppUrl.category);
    print(AppUrl.category);
    return response;
  }
}
