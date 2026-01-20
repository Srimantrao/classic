// ignore_for_file: avoid_print

import 'package:classic/controller/user_Interface/credentials/loginUI_Controller.dart';
import 'package:classic/view/screen/credentials/login/loginWidget/loginWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/widget/bottom/bottomShow/bottomBar.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_cricularProgrssIndicator.dart';

class Login extends StatelessWidget {
  final loginUI = Get.put(LoginuiController());
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      image: AppImage.spalsh_background,
      child: horizontalPadding(
        child: SingleChildScrollView(
          child: Column(
            children: [
              image(),
              Obx(() {
                final usernameError = loginUI.usernameHasError.value;
                final passwordError = loginUI.passwordHasError.value;
                return singInContainer(
                  usernameController: loginUI.usernameController,
                  passwordController: loginUI.passwordController,
                  colorusername: usernameError ? AppColor.red : AppColor.white,
                  colorpassword: passwordError ? AppColor.red : AppColor.white,
                  onChangedusername: (value) => loginUI.onChanged1(),
                  onChangedpassword: (value) => loginUI.onChanged2(),
                  loadingWait: loginUI.loginAPI.isLoading.value
                      ? customCircular()
                      : null,
                  onTap: () => loginUI.allDoneGotonextPage(Bottombar()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
