// ignore_for_file: avoid_print, implementation_imports

import 'package:classic/view/utils/app_URL.dart';
import 'package:dio/src/response.dart';
import '../../../../../../view/utils/widget/apiService.dart';

class BraceletPrice {
  Future<Response<dynamic>> productDetailService({
    required String productId,
    required String sizeId,
  }) {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.braceletPrice,
      data: {'productId': productId, 'sizeId': sizeId},
    );
    print(AppUrl.braceletPrice);
    return response;
  }
}

class RindsPrice {
  Future<Response<dynamic>> ringsDetailService({
    required String productId,
    required String sizeId,
  }) {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.ringsizePrice,
      data: {'productId': productId, 'sizeId': sizeId},
    );
    print(AppUrl.ringsizePrice);
    return response;
  }
}
