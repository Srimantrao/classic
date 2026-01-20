// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class CreateCartService {
  Future<Response<dynamic>> createCart({
    String? qty,
    required String price,
    String? ringSize,
    String? engravingText,
    String? sizeRemark,
    required String productId,
    String? DiamondId,
  }) {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.createCart,
      data: {
        "qty": qty,
        "price": price,
        "ringSize": ringSize,
        "engravingText": engravingText,
        "sizeRemark": sizeRemark,
        "productId": productId,
        "DiamondId": DiamondId,
      },
    );
    print(AppUrl.createCart);
    return response;
  }
}
