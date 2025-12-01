// ignore_for_file: file_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget addCustomJewelleryHeddingText(
  text, {
  Color? color,
  TextAlign? textAlign,
}) {
  return Text(
    textAlign: textAlign,
    text,
    style: TextStyle(
      color: color ?? AppColor.primary,
      fontWeight: FontWeight.w600,
      fontSize: Get.width * 0.052,
      fontFamily: 'Sans-Bold',
    ),
  );
}

Widget addCustomJewellerySubHeddingText(
  text, {
  Color? color,
  double? fontSize,
}) {
  return Text(
    textAlign: TextAlign.start,
    text,
    style: TextStyle(
      fontSize: fontSize ?? Get.width * 0.035,
      fontWeight: FontWeight.w400,
      fontFamily: 'Sans-Bold',
      color: color ?? AppColor.black,
    ),
  );
}

Widget roundCircleSelector({
  required String imageText,
  required String videoText,
  required String urlText,
  required void Function() imageOnTap,
  required void Function() videoOnTap,
  required void Function() urlOnTap,
  required Color imageColor,
  required Color videoColor,
  required Color urlColor,
}) {
  return Row(
    children: [
      roundCircal(text: imageText, onTap: imageOnTap, color: imageColor),
      SizedBox(width: Get.width * 0.05),
      roundCircal(text: videoText, onTap: videoOnTap, color: videoColor),
      SizedBox(width: Get.width * 0.05),
      roundCircal(text: urlText, onTap: urlOnTap, color: urlColor),
    ],
  );
}

Widget roundCircal({
  required String text,
  required void Function() onTap,
  required Color color,
}) {
  return Row(
    children: [
      GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: color,
          radius: 10,
          child: CircleAvatar(backgroundColor: AppColor.white, radius: 7),
        ),
      ),
      Text(
        text,
        style: TextStyle(
          color: AppColor.black,
          fontSize: Get.width * 0.04,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
