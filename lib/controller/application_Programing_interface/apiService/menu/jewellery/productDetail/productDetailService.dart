// ignore_for_file: strict_top_level_inference, avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class ProductDetailService {
  Future<Response<dynamic>> productDetailService(slug) {
    final Future<Response<dynamic>> response = ApiService.get(
      "${AppUrl.productDetail}/$slug",
    );
    print("${AppUrl.productDetail}/$slug");
    return response;
  }
}
