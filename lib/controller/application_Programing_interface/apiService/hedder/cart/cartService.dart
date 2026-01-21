// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class CartService {
  Future<Response<dynamic>> filterCartService() async {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.filterCart,
    );
    print(AppUrl.filterCart);
    return response;
  }
}
