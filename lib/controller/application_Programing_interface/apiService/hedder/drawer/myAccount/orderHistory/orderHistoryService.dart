// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class OrderHistoryService {
  Future<Response<dynamic>> profileService() async {
    final Future<Response<dynamic>> response = ApiService.get(AppUrl.orderHistory);
    print(AppUrl.orderHistory);
    return response;
  }
}