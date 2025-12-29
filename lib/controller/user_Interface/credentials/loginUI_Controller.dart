// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginuiController extends GetxController {
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
        Get.offAll(() => page);
      } else {
        print('error found');
      }
    });
  }
}
