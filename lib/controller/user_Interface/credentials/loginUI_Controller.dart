// ignore_for_file: avoid_print, file_names, invalid_use_of_protected_member, unused_import

import 'package:classic/controller/application_Programing_interface/apiController/credentials/loginAPI_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/utils/app_Constants.dart';

class LoginuiController extends GetxController {
  final loginAPI = Get.put(LoginAPIController());

  final usernameController = TextEditingController(text: 'Khageshsoni98@gmail.com');
  final passwordController = TextEditingController(text: 'Ilove@2015');
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
    final String loggedsuccessfully = 'You have logged in successfully!';
    onTap().then((value) {
      final usernameError = usernameHasError.value;
      final passwordError = passwordHasError.value;
      if (!usernameError && !passwordError) {
        loginAPI
            .loginUser(usernameController.text, passwordController.text)
            .then((val) {
              if (loginAPI.loginData.value['message'] == loggedsuccessfully) {
                pref!.setString('username', usernameController.text);
                pref!.setString('password', passwordController.text);
                pref!.setString('token', loginAPI.loginData.value['token']);
                pref!.setString('userId', loginAPI.loginData.value['userDetail']['_id']);

                pref!.setBool('isLogin', true);
                isLogin = pref!.getBool('isLogin')!;

                userName = pref!.getString('username')!;
                password = pref!.getString('password')!;
                token = pref!.getString('token')!;
                userID = pref!.getString('userId')!;

                Get.offAll(() => page);
                print("token :- $token"); 
                print("userID :- $userID");
              }
            });
      } else {
        print('error found');
      }
    });
  }
}
