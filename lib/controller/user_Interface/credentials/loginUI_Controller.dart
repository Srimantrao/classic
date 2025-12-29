// ignore_for_file: avoid_print, file_names, invalid_use_of_protected_member

import 'package:classic/controller/application_Programing_interface/apiController/credentials/loginAPI_Controller.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginuiController extends GetxController {
  final loginAPI = Get.put(LoginAPIController());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var usernameHasError = false.obs;
  var passwordHasError = false.obs;

  void onChanged1() {
    if (usernameController.text.isNotEmpty) {
      usernameHasError.value = false;
    }
  }

  void onChanged2() {
    if (passwordController.text.isNotEmpty) {
      passwordHasError.value = false;
    }
  }

  Future<void> onTap() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      if (usernameController.text.isEmpty) {
        usernameHasError.value = true;
      } else {
        usernameHasError.value = false;
      }
      if (passwordController.text.isEmpty) {
        passwordHasError.value = true;
      } else {
        passwordHasError.value = false;
      }
    } else {
      usernameHasError.value = false;
      passwordHasError.value = false;
    }
  }

  void allDoneGotonextPage(Widget page) {
    onTap().then((value) {
      final usernameError = usernameHasError.value;
      final passwordError = passwordHasError.value;
      if (!usernameError && !passwordError) {
        loginAPI
            .loginUser(usernameController.text, passwordController.text)
            .then((val) {
              if (loginAPI.loginData.value['success'] == true) {
                Get.offAll(() => page);
              }
            });
      } else {
        print('error found');
      }
    });
  }
}
