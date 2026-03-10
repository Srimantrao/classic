// ignore_for_file: avoid_print, strict_top_level_inference

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class DeletWishService {
  Future<Response<dynamic>> deleWishList(id) {
    final Future<Response<dynamic>> response = ApiService.get(
      "${AppUrl.wishListDelet}/$id",
    );
    print(AppUrl.wishListDelet);
    return response;
  }
}
