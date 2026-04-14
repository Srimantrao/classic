// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class SendMessageServices {
  Future<Response<dynamic>> sendMessage({
    required String fullName,
    required String email,
    required String mobile,
    required String message,
    required String countrycode,
    String? token,
  }) {
    final body = {
      'fullName': fullName,
      'email': email,
      'mobile': mobile,
      'message': message,
      'countrycode': countrycode,
      if (token != null) 'token': token,
    };
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.sendMessage,
      data: body,
    );
    print(AppUrl.filterWish);
    return response;
  }
}
