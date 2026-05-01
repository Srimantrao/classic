// ignore_for_file: avoid_unnecessary_containers, strict_top_level_inference

import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
import 'package:classic/view/screen/hedder/cart/cartScreen/cart.dart';
import 'package:classic/view/screen/menu/home/homeExtraWidget/homeconnectingWideget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/hadder/comanHadingWidget/comanHadingWidget.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import '../../../app_Constants.dart';

PreferredSizeWidget comanAppBar({
  required dynamic prefix,
  required dynamic suffix,
  required String hedding,
  void Function()? prefixOnTap,
  void Function()? suffixOnTap,
}) {
  final bottomController = Get.put(BottombarController());
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 0.15),
    child: Container(
      decoration: BoxDecoration(color: AppColor.primary),
      child: SafeArea(
        child: horizontalPadding(
          child: Stack(
            children: [
              Padding(
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
              (bottomController.selectindex.value == 3)
                  ? SizedBox()
                  : Obx(
                      () => cartBadge(
                        cartItemCount.value,
                        color: AppColor.secondary,
                        top: 3,
                        right: 365,
                        textcolor: AppColor.black,
                      ),
                    ),
            ],
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
  bool? search = false,
  void Function()? onTapLeft,
  void Function()? searchOnTap,
}) {
  final double iconsize = 33;
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 0.15),
    child: Container(
      decoration: BoxDecoration(color: AppColor.secondary),
      child: SafeArea(
        child: Stack(
          children: [
            horizontalPadding(
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
                              decoration: BoxDecoration(
                                color: AppColor.secondary,
                              ),
                              padding: EdgeInsetsGeometry.only(
                                right: (search == true) ? 40 : 10,
                              ),
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
                              decoration: BoxDecoration(
                                color: AppColor.secondary,
                              ),
                              padding: EdgeInsetsGeometry.only(
                                right: (search == true) ? 40 : 10,
                              ),
                              child: Icon(
                                Icons.chevron_left,
                                color: AppColor.primary,
                                size: iconsize,
                              ),
                            ),
                          ),
                    Expanded(
                      child: SizedBox(
                        height: Get.height * 0.025,
                        child: text.length > 15
                            ? Marquee(
                                text: text,
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Textsize.subheding,
                                ),
                                scrollAxis: Axis.horizontal,
                                blankSpace: 40.0,
                                velocity: 30.0,
                                pauseAfterRound: Duration(seconds: 1),
                              )
                            : Text(
                                text,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Textsize.subheding,
                                ),
                              ),
                      ),
                    ),
                    (search == true)
                        ? GestureDetector(
                            onTap: searchOnTap,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColor.secondary,
                              ),
                              child: Image(
                                image: AssetImage(AppIcon.search),
                                height: 23,
                                width: 23,
                              ),
                            ),
                          )
                        : SizedBox(),
                    (filter == true)
                        ? GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.secondary,
                              ),
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
                              decoration: BoxDecoration(
                                color: AppColor.secondary,
                              ),
                              padding: EdgeInsetsGeometry.only(left: 5),
                              child: Image(
                                image: AssetImage(AppIcon.newcart),
                                height: iconsize,
                                width: iconsize,
                              ),
                            ),
                          )
                        : GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.secondary,
                              ),
                              padding: EdgeInsetsGeometry.only(left: 5),
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
            (cart == true)
                ? Obx(
                    () => cartBadge(
                      cartItemCount.value,
                      color: AppColor.primary,
                      top: 3,
                      right: 8,
                      textcolor: AppColor.white,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    ),
  );
}
