// ignore_for_file: avoid_print, implementation_imports

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/src/response.dart';

class GetAllParameterServices {
  Future<Response<dynamic>> getAllParameter() {
    final Future<Response<dynamic>> responce = ApiService.get(
      AppUrl.getAllParameter,
    );
    print(AppUrl.getAllParameter);
    return responce;
  }
}
