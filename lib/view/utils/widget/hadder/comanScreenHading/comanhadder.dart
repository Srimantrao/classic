// ignore_for_file: avoid_unnecessary_containers, strict_top_level_inference

import 'package:classic/view/screen/hedder/cart/cartScreen/cart.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_icon.dart';
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
                GestureDetector(
                  onTap: () {
                    if (prefixOnTap != null) {
                      prefixOnTap();
                    }
                  },
                  child: Container(
                    padding: EdgeInsetsGeometry.only(right: 35),
                    decoration: BoxDecoration(color: AppColor.primary),
                    child: icon(prefix),
                  ),
                ),
                appbarheddingText(hedding),
                GestureDetector(
                  onTap: () {
                    if (suffixOnTap != null) {
                      suffixOnTap();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.primary),
                    padding: EdgeInsetsGeometry.only(left: 35),
                    child: icon(suffix),
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

PreferredSizeWidget allOtherScreen(
  text, {
  bool? cart = false,
  bool? filter = false,
  void Function()? onTapLeft,
}) {
  final double iconsize = 33;
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 0.15),
    child: Container(
      decoration: BoxDecoration(color: AppColor.secondary),
      child: SafeArea(
        child: horizontalPadding(
          padding: Get.width * 0.03,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (filter == true)
                    ? GestureDetector(
                        onTap: () {
                          onTapLeft != null ? onTapLeft() : Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(color: AppColor.secondary),
                          padding: EdgeInsetsGeometry.only(right: 35),
                          child: Icon(
                            Icons.chevron_left,
                            color: AppColor.secondary,
                            size: iconsize,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          onTapLeft != null ? onTapLeft() : Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(color: AppColor.secondary),
                          padding: EdgeInsetsGeometry.only(right: 35),
                          child: Icon(
                            Icons.chevron_left,
                            color: AppColor.primary,
                            size: iconsize,
                          ),
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
                (filter == true)
                    ? GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          decoration: BoxDecoration(color: AppColor.secondary),
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(
                            Icons.cancel_outlined,
                            color: AppColor.primary,
                            size: iconsize,
                          ),
                        ),
                      )
                    : (cart == true)
                    ? GestureDetector(
                        onTap: () => Get.to(() => Cart()),
                        child: Container(
                          decoration: BoxDecoration(color: AppColor.secondary),
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Image(
                            image: AssetImage(AppIcon.newcart),
                            height: iconsize,
                            width: iconsize,
                          ),
                        ),
                      )
                    : GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(color: AppColor.secondary),
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(
                            Icons.chevron_left,
                            color: AppColor.secondary,
                            size: iconsize,
                          ),
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
