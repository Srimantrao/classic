// ignore_for_file: avoid_print, strict_top_level_inference

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class CustomProductDetailService {
  Future<Response<dynamic>> customProductDetail(id) async {
    Future<Response<dynamic>> response = ApiService.get(
      "${AppUrl.detailCustomProduct}/$id",
    );
    print("${AppUrl.detailCustomProduct}/$id");
    return response;
  }
}
