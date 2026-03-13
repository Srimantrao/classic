// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class CustomProductService {
  Future<Response<dynamic>> customProduct() async {
    final Future<Response<dynamic>> response = ApiService.get(
      AppUrl.customProduct,
    );
    print(AppUrl.customProduct);
    return response;
  }
}
