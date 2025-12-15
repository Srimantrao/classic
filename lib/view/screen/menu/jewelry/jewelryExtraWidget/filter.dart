// ignore_for_file: strict_top_level_inference

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../utils/app_Borderradius.dart';
import '../../../../utils/app_Color.dart';
import '../../diamondSearch/diamondSearchExtraWidget/diamondExtraWidget.dart';

Widget heddingFilter(text) {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.02),
      shapeHedding(text),
    ],
  );
}

Widget selectmetalType({
  required String value,
  required Color bodercolor,
  void Function()? onTap,
  bool? isselect = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.05,
        vertical: Get.height * 0.006,
      ),
      decoration: BoxDecoration(
        color: (isselect == true) ? AppColor.primary : AppColor.white,
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        border: Border.all(color: bodercolor),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: (isselect == true) ? AppColor.white : AppColor.black,
        ),
      ),
    ),
  );
}

Widget stampMetal({required String text, required bool isSelected}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: Get.width * 0.02,
      vertical: Get.height * 0.006,
    ),
    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
    decoration: BoxDecoration(
      color: isSelected ? AppColor.primary : AppColor.white,
      border: Border.all(color: isSelected ? AppColor.primary : AppColor.gray5),
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppColor.white : AppColor.black,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    ),
  );
}

Widget shapeContainer({required String text, required bool isSelected}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
      color: isSelected ? AppColor.primary : AppColor.white,
      border: Border.all(color: AppColor.gray5),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppColor.white : AppColor.black,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    ),
  );
}

Widget stoneTypeSelected({required String text, required bool isSelected}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
      border: Border.all(color: AppColor.gray),
      color: isSelected ? AppColor.primary : AppColor.white,
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(color: isSelected ? AppColor.white : AppColor.black),
      ),
    ),
  );
}

Widget sortContainer(text, {required bool isSelected}) {
  return Container(
    padding: EdgeInsetsGeometry.symmetric(
      horizontal: Get.width * 0.03,
      vertical: Get.height * 0.005,
    ),
    decoration: BoxDecoration(
      color: isSelected ? AppColor.primary : AppColor.white,
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
      border: Border.all(color: AppColor.gray5),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: isSelected ? AppColor.white : AppColor.black,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      ),
    ),
  );
}
