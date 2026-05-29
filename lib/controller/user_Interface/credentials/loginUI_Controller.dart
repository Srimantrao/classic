// ignore_for_file: avoid_print, file_names, invalid_use_of_protected_member, unused_import

import 'package:classic/controller/application_Programing_interface/apiController/credentials/loginAPI_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/cardRecord_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/recentView_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/totalRecored_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/utils/app_Constants.dart';

class LoginuiController extends GetxController {
  final loginAPI = Get.put(LoginAPIController());

  final usernameController = TextEditingController(
    text: 'Khageshsoni98@gmail.com',
  );
  final passwordController = TextEditingController(text: 'Test@123');
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

  Future<void> allDoneGotonextPage(Widget page) async {
    final totalRecored = Get.put(TotalRecordedController());
    final recentView = Get.put(RecentViewController());
    final cardRecord = Get.put(CardRecordController());

    const String loggedsuccessfully = 'You have logged in successfully!';

    await onTap();

    final usernameError = usernameHasError.value;
    final passwordError = passwordHasError.value;

    if (!usernameError && !passwordError) {
      await loginAPI.loginUser(
        usernameController.text,
        passwordController.text,
      );

      if (loginAPI.loginData.value['message'] == loggedsuccessfully) {
        final loginAPIs = loginAPI.loginData.value;
        await pref!.setString('username', usernameController.text);
        await pref!.setString('password', passwordController.text);
        await pref!.setString('token', loginAPIs['token']);
        await pref!.setString('userId', loginAPIs['userDetail']['_id']);

        await pref!.setBool('isLogin', true);
        isLogin = pref!.getBool('isLogin') ?? false;
        userName = pref!.getString('username') ?? '';
        password = pref!.getString('password') ?? '';
        token = pref!.getString('token') ?? '';
        userID = pref!.getString('userId') ?? '';

        /// API Calls
        await totalRecored.totalRecord();
        await recentView.recentViewdata();
        await cardRecord.fetchCardRecords(isFirstLoad: true, type: 'Diamond');

        print("token :- $token");
        print("userID :- $userID");

        Get.offAll(() => page);
      }
    } else {
      print('error found');
    }
  }

  // void allDoneGotonextPage(Widget page) {
  //   final totalRecored = Get.put(TotalRecordedController());
  //   final recentView = Get.put(RecentViewController());
  //   final cardRecord = Get.put(CardRecordController());
  //   final String loggedsuccessfully = 'You have logged in successfully!';
  //   onTap().then((value) {
  //     final usernameError = usernameHasError.value;
  //     final passwordError = passwordHasError.value;
  //     if (!usernameError && !passwordError) {
  //       loginAPI
  //           .loginUser(usernameController.text, passwordController.text)
  //           .then((val) {
  //             if (loginAPI.loginData.value['message'] == loggedsuccessfully) {
  //               pref!.setString('username', usernameController.text);
  //               pref!.setString('password', passwordController.text);
  //               pref!.setString('token', loginAPI.loginData.value['token']);
  //               pref!.setString('userId', loginAPI.loginData.value['userDetail']['_id']);
  //
  //               pref!.setBool('isLogin', true);
  //               isLogin = pref!.getBool('isLogin')!;
  //
  //               userName = pref!.getString('username')!;
  //               password = pref!.getString('password')!;
  //               token = pref!.getString('token')!;
  //               userID = pref!.getString('userId')!;
  //
  //               totalRecored.totalRecord();
  //               recentView.recentViewdata();
  //               cardRecord.fetchCardRecords(isFirstLoad: true, type: 'Diamond');
  //
  //               Get.offAll(() => page);
  //               print("token :- $token");
  //               print("userID :- $userID");
  //             }
  //           });
  //     } else {
  //       print('error found');
  //     }
  //   });
  // }
}
