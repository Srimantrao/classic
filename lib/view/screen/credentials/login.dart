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
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      child: horizontalPadding(
        child: SingleChildScrollView(
          child: Column(children: [image(), singInContainer()]),
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

Widget singInContainer() {
  return cartConatiner(
    child: Column(
      children: [
        singInInformation(),
        inputFields(),
        passwordingetInput(),
        signinbutton(),
        donthave(),
      ],
    ),
  );
}

//IF You Have A Classic Grown Diamonds Customer Account, Please Sing In
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

Widget inputFields() {
  return Column(
    children: [
      Inputfield(hinttext: AppString.username_hint),
      Inputfield(hinttext: AppString.password_hint),
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
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
          Spacer(),
          Text(
            AppString.sendOTP,
            style: TextStyle(
              fontSize: Textsize.normal,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
      SizedBox(height: Get.height * 0.10),
    ],
  );
}

Widget signinbutton() {
  return button(AppString.signIn);
}

Widget donthave() {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.01),
      have(have: AppString.donthaveanaccount, tab: AppString.signUp),
    ],
  );
}
