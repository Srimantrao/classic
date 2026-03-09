// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class CreateWishlistService {
  Future<Response<dynamic>> addWishList({
    String? qty,
    String? price,
    String? ringSize,
    String? engravingText,
    String? sizeRemark,
    String? productId,
    String? DiamondId,
  }) {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.createWishlist,
      data: {
        "qty": qty,
        "price": price,
        "ringSize": ringSize,
        "engravingText": engravingText,
        "sizeRemark": sizeRemark,
        "productId": productId,
        "diamondId": DiamondId,
      },
    );
    print(AppUrl.createWishlist);
    return response;
  }
}
