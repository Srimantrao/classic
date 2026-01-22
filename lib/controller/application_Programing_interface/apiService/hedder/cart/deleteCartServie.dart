// ignore_for_file: strict_top_level_inference

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DeleteCartService {
  Future<Response<dynamic>> deleteCartService(id) {
    final Future<Response<dynamic>> response = ApiService.get(
      "${AppUrl.deleteCart}/$id",
    );
    if (kDebugMode) {
      print(AppUrl.deleteCart);
    }
    return response;
  }
}
