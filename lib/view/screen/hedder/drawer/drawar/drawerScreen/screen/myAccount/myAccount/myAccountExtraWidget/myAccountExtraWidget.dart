// ignore_for_file: file_names

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget refrens({
  required String text,
  required String icon,
  void Function()? onTap,
}) {
  final double iconsize = 25;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(color: AppColor.white),
      child: horizontalPadding(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.01),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(Get.width * 0.02),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(
                      borderradius.buttonboder,
                    ),
                  ),
                  child: Image(
                    image: AssetImage(icon),
                    height: iconsize,
                    width: iconsize,
                    color: AppColor.white,
                  ),
                ),
                SizedBox(width: Get.width * 0.03),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Get.width * 0.040,
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.01),
          ],
        ),
      ),
    ),
  );
}

Widget chnagePasswordTitle() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Text(AppString.changePassword),
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.cancel_outlined),
          ),
        ],
      ),
      SizedBox(height: Get.height * 0.01),
      Divider(color: AppColor.secondary, thickness: 2),
      SizedBox(height: Get.height * 0.01),
    ],
  );
}

Widget changePasswordInput({
  required TextEditingController oldPasswordController,
  required TextEditingController newPasswordController,
  required TextEditingController confirmPasswordController,
}) {
  return Column(
    children: [
      Inputfield(
        color: AppColor.gray,
        controller: oldPasswordController,
        obscureText: true,
        hinttext: AppString.oldpassword,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        adjustHeight: true,
      ),
      Inputfield(
        color: AppColor.gray,
        controller: newPasswordController,
        obscureText: true,
        hinttext: AppString.newpassword,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        adjustHeight: true,
      ),
      Inputfield(
        color: AppColor.gray,
        controller: confirmPasswordController,
        obscureText: true,
        hinttext: AppString.confirmpassword,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        adjustHeight: true,
      ),
    ],
  );
}

Widget changePasswordButton({
  void Function()? canalOnTap,
  void Function()? submitOnTap,
}) {
  return Row(
    children: [
      Expanded(
        child: button(
          AppString.cancel,
          backgroundColor: AppColor.secondary,
          isLowercase: true,
          textColor: AppColor.black,
          borderColor: AppColor.secondary,
          onTap: canalOnTap,
        ),
      ),
      SizedBox(width: Get.width * 0.03),
      Expanded(child: button(AppString.submit, onTap: submitOnTap)),
    ],
  );
}
