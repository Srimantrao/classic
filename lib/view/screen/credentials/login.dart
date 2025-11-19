import 'package:classic/controller/user_Interface/credentials/loginUI_Controller.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/cartcontainer.dart';
import 'package:classic/view/utils/widget/dontHaveAndyouHave.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/heddingText.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/subheding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/widget/inputfield.dart';

class Login extends StatelessWidget {
  final loginUI = Get.put(LoginuiController());
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
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
                  onTap: () {
                    loginUI.onTap().then((value) {
                      if (usernameError == false && passwordError == false) {
                        print('success');
                      }
                    });
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget image() {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.03),
      Image.asset(AppImage.logo, scale: 2.5),
      SizedBox(height: Get.height * 0.080),
    ],
  );
}

Widget singInContainer({
  required TextEditingController usernameController,
  required TextEditingController passwordController,
  void Function()? onTap,
  void Function(String)? onChangedusername,
  void Function(String)? onChangedpassword,
  Color? colorusername,
  Color? colorpassword,
}) {
  return cartConatiner(
    child: Column(
      children: [
        singInInformation(),
        inputFields(
          usernameController: usernameController,
          passwordController: passwordController,
          colorusername: colorusername,
          colorpassword: colorpassword,
          onChangedusername: onChangedusername,
          onChangedpassword: onChangedpassword,
        ),
        passwordingetInput(),
        signinbutton(
          usernameController: usernameController,
          passwordController: passwordController,
          onTap: onTap,
        ),
        donthave(),
      ],
    ),
  );
}

Widget singInInformation() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      hedding(AppString.signIn),
      SizedBox(height: Get.height * 0.01),
      subheding(AppString.loginsubhedding),
      SizedBox(height: Get.height * 0.02),
    ],
  );
}

Widget inputFields({
  required TextEditingController usernameController,
  required TextEditingController passwordController,
  Color? colorusername,
  Color? colorpassword,
  void Function(String)? onChangedusername,
  void Function(String)? onChangedpassword,
}) {
  return Column(
    children: [
      Inputfield(
        hinttext: AppString.username_hint,
        controller: usernameController,
        onChanged: onChangedusername,
        color: colorusername,
      ),
      Inputfield(
        hinttext: AppString.password_hint,
        obscureText: true,
        controller: passwordController,
        onChanged: onChangedpassword,
        color: colorpassword,
      ),
    ],
  );
}

Widget passwordingetInput() {
  return Column(
    children: [
      Row(
        children: [
          Text(
            AppString.forgotpassword,
            style: TextStyle(
              fontSize: Textsize.normal,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
          Spacer(),
          Text(
            AppString.sendOTP,
            style: TextStyle(
              fontSize: Textsize.normal,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
      SizedBox(height: Get.height * 0.10),
    ],
  );
}

Widget signinbutton({
  required TextEditingController usernameController,
  required TextEditingController passwordController,
  void Function()? onTap,
}) {
  return button(onTap: onTap, AppString.signIn);
}

Widget donthave() {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.01),
      have(have: AppString.donthaveanaccount, tab: AppString.signUp),
    ],
  );
}
