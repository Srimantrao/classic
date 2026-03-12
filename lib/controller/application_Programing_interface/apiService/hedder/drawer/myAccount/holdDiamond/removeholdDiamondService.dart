// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class RemoveHDiamondService {
  Future<Response<dynamic>> removeHDiamond(String id) async {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.removeholdDiamond,
    );
    print(AppUrl.removeholdDiamond);
    return response;
  }
}
