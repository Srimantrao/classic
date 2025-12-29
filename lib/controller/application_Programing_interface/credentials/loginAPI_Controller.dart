// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginAPIController extends GetxController {
  var isLoading = false.obs;
  var loginData = {}.obs;

  Future<void> loginUser(String email, String password) async {
    isLoading.value = true;

    try {
      final response = await ApiService.post(
        AppUrl.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      // Only success responses reach here
      loginData.value = response.data;

    } on DioException catch (e) {

      String errorMessage = "Something went wrong";

      if (e.response != null) {
        print("❌ Status: ${e.response!.statusCode}");
        print("❌ Data: ${e.response!.data}");

        if (e.response!.data is Map) {
          errorMessage = e.response!.data["message"] ?? errorMessage;
        } else if (e.response!.data is String) {
          errorMessage = e.response!.data;
        }
      }

      Get.snackbar("Login Failed", errorMessage);

    } finally {
      isLoading.value = false;
    }
  }
}