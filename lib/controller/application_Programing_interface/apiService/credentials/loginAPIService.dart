// ignore_for_file: file_names, implementation_imports, avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/src/response.dart';

class LoginApiService {
  Future<Response<dynamic>> loginService({
    required String email,
    required String password,
  }) async {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.login,
      data: {"email": email, "password": password},
    );
    print(AppUrl.login);
    return response;
  }
}
