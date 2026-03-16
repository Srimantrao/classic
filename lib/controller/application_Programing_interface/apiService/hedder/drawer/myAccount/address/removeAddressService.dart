// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class RemoveAddresService {
  Future<Response<dynamic>> removeAdress(id) async {
    Future<Response<dynamic>> response = ApiService.get(
      "${AppUrl.removeAddress}/$id",
    );
    print("${AppUrl.removeAddress}/$id");
    return response;
  }
}
