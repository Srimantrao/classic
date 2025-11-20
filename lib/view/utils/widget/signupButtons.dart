
// ignore_for_file: file_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget signupButton({
  void Function()? onTapBack,
  void Function()? onTapNext,
  required String text,
  String? text2,
}){
  return Column(
    children: [
      SizedBox(height: Get.height * 0.02),
      Row(
        children: [
          Flexible(
            flex: 6,
            child: button(
              onTap: onTapBack,
              text2 ?? AppString.back,
              backgroundColor: AppColor.white,
              borderColor: AppColor.primary,
              textColor: AppColor.primary,
            ),
          ),
          Spacer(),
          Flexible(
            flex: 6,
            child: button(
              onTap: onTapNext,
              text,
            ),
          ),
        ],
      ),
      SizedBox(height: Get.height * 0.02),
    ],
  );
}