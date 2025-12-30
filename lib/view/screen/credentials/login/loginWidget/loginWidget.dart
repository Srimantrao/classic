
// ignore_for_file: file_names

import 'package:classic/view/screen/credentials/signUp/signUpScreen/signUp.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/cartcontainer.dart';
import 'package:classic/view/utils/widget/dontHaveAndyouHave.dart';
import 'package:classic/view/utils/widget/heddingText.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:classic/view/utils/widget/subheding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget singInContainer({
  required TextEditingController usernameController,
  required TextEditingController passwordController,
  void Function()? onTap,
  void Function(String)? onChangedusername,
  void Function(String)? onChangedpassword,
  Color? colorusername,
  Color? colorpassword,
  Widget? loadingWait
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
          loadingWait: loadingWait,
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
  Widget? loadingWait
}) {
  return button(
    loadingWait: loadingWait,
    onTap: onTap,
    AppString.signIn,bottomBottonFontSize: true,
  );
}

Widget donthave() {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.01),
      have(
        have: AppString.donthaveanaccount,
        tab: AppString.signUp,
        onTap: () => Get.to(() => Signup()),
      ),
    ],
  );
}
