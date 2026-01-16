// ignore_for_file: avoid_print

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
    );
    print(AppUrl.braceletPrice);
    return response;
  }
}
