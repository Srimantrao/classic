// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class DiamondHoldService {
  Future<Response<dynamic>> holdDiamond({required String ids}) {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.holdDiamond,
      data: {'diamondIds': ids},
    );
    print(AppUrl.holdDiamond);
    return response;
  }
}
