// ignore_for_file: unnecessary_import

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget button(text, {void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        color: AppColor.primary,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: Textsize.normal,
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
