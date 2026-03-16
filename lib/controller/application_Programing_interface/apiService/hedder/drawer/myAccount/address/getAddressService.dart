// ignore_for_file: avoid_print, strict_top_level_inference

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class GetAddressService {
  Future<Response<dynamic>> getAddress(id) {
    Future<Response<dynamic>> response = ApiService.get(
      "${AppUrl.getAddress}/$id",
    );
    print("${AppUrl.getAddress}/$id");
    return response;
  }
}
