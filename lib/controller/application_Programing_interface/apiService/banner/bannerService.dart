// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class BannerService {
  Future<Response<dynamic>> bannerServive(){
    final Future<Response<dynamic>> response = ApiService.get(
      AppUrl.benner,
    );
    print(AppUrl.benner);
    return response;
  }
}