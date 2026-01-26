// ignore_for_file: avoid_print, file_names

import 'package:classic/controller/application_Programing_interface/apiService/credentials/loginAPIService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginAPIController extends GetxController {
  final loginService = LoginApiService();
  var isLoading = false.obs;
  var loginData = {}.obs;

  Future<void> loginUser(String email, String password) async {
    isLoading.value = true;
    try {
      final response = await loginService.loginService(
        email: email,
        password: password,
      );
      successMesssess(
        response: response,
        data: loginData,
        callAPI: 'Login',
        messages: true,
        showSnackbarSuccess: true,
        showSnackbar: true,
      );
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'Login', showSnackbarErorr: true);
    } finally {
      isLoading.value = false;
    }
  }
}
