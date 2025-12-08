// ignore_for_file: avoid_unnecessary_containers

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/hadder/comanHadingWidget/comanHadingWidget.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget comanAppBar({
  required dynamic prefix,
  required dynamic suffix,
  required String hedding,
  void Function()? prefixOnTap,
  void Function()? suffixOnTap,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 0.15),
    child: Container(
      decoration: BoxDecoration(color: AppColor.primary),
      child: SafeArea(
        child: horizontalPadding(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: prefixOnTap, child: icon(prefix)),
                appbarheddingText(hedding),
                GestureDetector(onTap: suffixOnTap, child: icon(suffix)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

PreferredSizeWidget allOtherScreen(text) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 0.15),
    child: Container(
      decoration: BoxDecoration(color: AppColor.secondary),
      child: SafeArea(
        child: horizontalPadding(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.turn_left_outlined,
                    color: AppColor.primary,
                    size: 35,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: Textsize.subheding,
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.turn_left_outlined,
                    color: AppColor.secondary,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
