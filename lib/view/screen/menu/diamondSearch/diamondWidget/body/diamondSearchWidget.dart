// ignore_for_file: file_names

//Index Button
import 'package:classic/controller/user_Interface/menu/diamondSearch/diamondSearch_Controller.dart';
import 'package:classic/view/screen/menu/diamondSearch/diamondSearchExtraWidget/diamondExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/indexButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget indexButtons({
  required bool isWhiteDimaond,
  required bool isColoredDimaond,
  void Function()? onTapDiamond,
  void Function()? onTapJewellwery,
}) {
  return horizontalPadding(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        indexButton(
          onTap: onTapDiamond,
          text: AppString.whiteDiamond,
          color: (isWhiteDimaond) ? AppColor.primary : AppColor.white,
          textColor: (isWhiteDimaond) ? AppColor.white : AppColor.black,
          borderColor: (isWhiteDimaond) ? AppColor.primary : AppColor.gray3,
        ),
        indexButton(
          onTap: onTapJewellwery,
          text: AppString.coloredDiamond,
          color: (isColoredDimaond) ? AppColor.primary : AppColor.white,
          textColor: (isColoredDimaond) ? AppColor.white : AppColor.black,
          borderColor: (isColoredDimaond) ? AppColor.primary : AppColor.gray3,
        ),
      ],
    ),
  );
}

//Shape
Widget shapeViwe(diamondSearch,text) {
  return SizedBox(
    height: Get.height / 4,
    child: horizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.height * 0.02),
          shapeHedding(text),
          SizedBox(height: Get.height * 0.01),
          shape(diamondSearch),
        ],
      ),
    ),
  );
}

Widget searchColor({
  required DiamondSearchUIController diamondSearch,
  required String text,
  required Widget  contain,
  double? height
}) {
  return SizedBox(
    height: height ?? Get.height / 4.7,
    child: horizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.height * 0.02),
          shapeHedding(text),
          SizedBox(height: Get.height * 0.01),
          contain,
        ],
      ),
    ),
  );
}


