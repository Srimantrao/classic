// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class GetMetalService {
  Future<Response<dynamic>> getMetal() {
    Future<Response<dynamic>> response = ApiService.get(
      AppUrl.getMetalName,
    );
    print(AppUrl.getMetalName);
    return response;
  }
}
