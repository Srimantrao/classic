// ignore_for_file: file_names

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_TextSize.dart';

Widget indexButton({
  required String text,
  required Color color,
  required Color textColor,
  required Color borderColor,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.12,
        vertical: Get.height * 0.009,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Get.width * 0.009),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Widget informationOfProduct(text, value, {bool isFirst = false}) {
  return Container(
    margin: EdgeInsets.only(
      right: Get.width * 0.010,
      left: isFirst ? Get.width * 0.038 : Get.width * 0.010,
    ),
    padding: EdgeInsets.all(Get.width * 0.013),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
      border: Border.all(color: AppColor.gray5),
      color: AppColor.secondary,
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: AppColor.primary,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Image(
              image: AssetImage(AppIcon.diamond),
              color: AppColor.white,
            ),
          ),
        ),
        SizedBox(width: Get.width * 0.03),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(text),
            Text(
              value,
              style: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.w500,
                fontSize: Textsize.samiHedding,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget intexText(String text, {void Function()? onTap, Color? color}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final bottomPadding = constraints.maxWidth * 0.02;
      final underlinePosition = constraints.maxWidth * 0.017;
      final underlineHeight = constraints.maxWidth * 0.002;
      return GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: bottomPadding.clamp(6.0, 16.0)),
              child: Text(
                text,
                style: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: underlinePosition.clamp(5.0, 10.0),
              child: Container(
                height: underlineHeight.clamp(0.8, 1.0),
                color: color,
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget selectIndexViwe({
  required String textRecentViwe,
  required Color colorRecentViwe,
  void Function()? onTapRecentViwe,
  required String textMyCartViwe,
  required Color colorMyCartViwe,
  void Function()? onTapMyCartViwe,
}) {
  return horizontalPadding(
    child: Row(
      children: [
        intexText(
          onTap: onTapRecentViwe,
          color: colorRecentViwe,
          textRecentViwe,
        ),
        SizedBox(width: Get.width * 0.02),
        intexText(
          onTap: onTapMyCartViwe,
          color: colorMyCartViwe,
          textMyCartViwe,
        ),
      ],
    ),
  );
}
