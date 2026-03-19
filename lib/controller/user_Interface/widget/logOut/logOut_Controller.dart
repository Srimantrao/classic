// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, unused_import

import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/menu/home/home_Controller.dart';
import 'package:classic/view/screen/credentials/login/loginScreen/login.dart';
import 'package:classic/view/screen/menu/home/homeScreen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import '../../../../view/utils/app_Constants.dart';

class LogoutController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> logout() async {
    print("Before clear userID: ${pref!.getString('userId')}");
    // Restart.restartApp();
    await pref!.clear();
    await pref!.setBool('isLogin', false);

    userID = '';
    userName = '';
    password = '';
    token = '';
    firstName = '';
    lastName = '';
    email = '';
    countryDrop = '';
    mobileNo = '';
    iAM = '';
    howDidHear = '';
    company = '';
    companyUser = '';
    state = '';
    zipCode = '';
    address = '';
    city = '';
    ReadandAgree = '';
    Stock = '';
    TokanRecaptcha = '';
    isLogin = false;

    Get.delete<HomeUIController>();
    Get.delete<HomeAPICall>();
    Get.delete<CartAPICall>();
    Get.delete<DashBordAPICall>();
    Get.delete<JewelleryAPICall>();

    Home.apiCalled = false;

    print("After clear userID: ${pref!.getString('userId')}");

    Get.dialog(SizedBox(), barrierDismissible: false);

    Future.delayed(const Duration(seconds: 2), () async {
      await Restart.restartApp();
    });
  }
}
