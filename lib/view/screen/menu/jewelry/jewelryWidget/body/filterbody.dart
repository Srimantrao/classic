// ignore_for_file: strict_top_level_inference

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../utils/app_String.dart';
import '../../jewelryExtraWidget/filter.dart';

Widget shimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: SingleChildScrollView(
      child: Column(
        children: [
          shimmeContainer(),
          divider(),
          shimmeContainer(),
          divider(),
          shimmeContainer(),
          divider(),
          shimmeContainer(),
          divider(),
        ],
      ),
    ),
  );
}

Widget shortBY({
  void Function()? onTapLowToHigh,
  void Function()? onTapHighToLow,
  bool isSelectedLowToHigh = false,
  bool isSelectedHighToLow = false,
}) {
  return horizontalPadding(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        heddingFilter(AppString.sortBy),
        SizedBox(height: Get.height * 0.009),
        Row(
          children: [
            Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.02)),
            GestureDetector(
              onTap: onTapLowToHigh,
              child: sortContainer(
                'Price(Low To High)',
                isSelected: isSelectedLowToHigh,
              ),
            ),
            Padding(padding: EdgeInsetsGeometry.only(left: Get.height * 0.01)),
            GestureDetector(
              onTap: onTapHighToLow,
              child: sortContainer(
                'Price(High To Low)',
                isSelected: isSelectedHighToLow,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget filterButton({
  void Function()? onTapClear,
  void Function()? onTapSave,
}) {
  return Row(
    children: [
      Expanded(
        child: button(
          bottomBottonFontSize: true,
          textColor: AppColor.primary,
          backgroundColor: AppColor.white,
          borderColor: AppColor.primary,
          AppString.clear,
          onTap: onTapClear,
        ),
      ),
      SizedBox(width: Get.width * 0.05),
      Expanded(
        child: button(
          AppString.save,
          onTap: onTapSave,
          bottomBottonFontSize: true,
        ),
      ),
    ],
  );
}
