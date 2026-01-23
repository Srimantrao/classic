// ignore_for_file: strict_top_level_inference

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class UpdateCartService {
  Future<Response<dynamic>> updateCartService(
    id, {
    required String qty,
    required String price,
    required String ringSizeId,
  }) {
    final Future<Response<dynamic>> response = ApiService.post(
      url: "${AppUrl.updateCart}/$id",
      data: {"qty": qty, "price": price, "ringSizeId": ringSizeId},
    );
    if (kDebugMode) {
      print(AppUrl.updateCart);
    }
    return response;
  }
}
