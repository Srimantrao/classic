// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class HoldDiamondService {
  Future<Response<dynamic>> holdDimaond() async {
    final Future<Response<dynamic>> response = ApiService.get(
      AppUrl.getHoldDiamond,
    );
    print(AppUrl.getHoldDiamond);
    return response;
  }
}
