// ignore_for_file: file_names, implementation_imports

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/src/response.dart';

class LoginApiService {
  Future<Response> loginService({
    required String email,
    required String password,
  }) async {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.login,
      data: {"email": email, "password": password},
    );
    return response;
  }
}
