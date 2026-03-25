// ignore_for_file: file_names
import 'dart:async';
import 'package:classic/view/screen/credentials/login/loginScreen/login.dart';
import 'package:classic/view/utils/app_Constants.dart';
import 'package:classic/view/utils/widget/bottom/bottomShow/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startNavigationTimer();
    });
  }

  void _startNavigationTimer() async {
    if (pref == null) {
      pref = await SharedPreferences.getInstance();
      isLogin = pref?.getBool('isLogin') ?? false;
    }

    Timer(Duration(seconds: 1), () {
      if (isLogin) {
        Get.offAll(() => Bottombar());
      } else {
        Get.offAll(() => Login());
      }
    });
  }
}
