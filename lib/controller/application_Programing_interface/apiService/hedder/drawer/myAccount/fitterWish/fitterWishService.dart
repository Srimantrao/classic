// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class FitterWishService {
  Future<Response<dynamic>> fitterWish() async {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.filterWish,
    );
    print(AppUrl.filterWish);
    return response;
  }
}
