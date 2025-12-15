// ignore_for_file: file_names, deprecated_member_use, strict_top_level_inference

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_TextSize.dart';

Widget informationOfProduct(text, value, {bool isFirst = false}) {
  return Container(
    margin: EdgeInsets.only(
      right: Get.width * 0.010,
      left: isFirst ? Get.width * 0.038 : Get.width * 0.010,
    ),
    padding: EdgeInsets.all(Get.width * 0.013),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
      border: Border.all(color: AppColor.secondary),
      color: AppColor.secondary.withOpacity(0.5),
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
