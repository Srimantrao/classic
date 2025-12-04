// ignore_for_file: unnecessary_import

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget button(
  String text, {
  void Function()? onTap,
  Color? borderColor,
  Color? backgroundColor,
  Color? textColor,
  bool isLowercase = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        color: backgroundColor ?? AppColor.primary,
      ),
      child: Center(
        child: Text(
          isLowercase ? capitalizeFirst(text) : text.toUpperCase(),
          style: TextStyle(
            fontSize: Textsize.normal,
            color: textColor ?? AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

String capitalizeFirst(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}
