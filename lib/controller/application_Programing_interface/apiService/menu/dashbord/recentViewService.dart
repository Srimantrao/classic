// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class RecentViewService {
  Future<Response<dynamic>> recentView() {
    Future<Response<dynamic>> response = ApiService.get(AppUrl.recentView);
    print(AppUrl.recentView);
    return response;
  }
}
