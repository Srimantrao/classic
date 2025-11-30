import 'package:classic/view/screen/menu/home/homeExtraWidget/homeconnectingWideget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget appBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + Get.height * 0.06),
    child: Container(
      color: AppColor.primary,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 7,
                horizontal: Get.width / 30,
              ),
              decoration: BoxDecoration(color: AppColor.primary),
              child: addText(AppString.homeadd),
            ),
            Container(
              padding: EdgeInsetsGeometry.symmetric(vertical: 8),
              decoration: BoxDecoration(color: AppColor.white),
              child: horizontalPadding(child: setLogoIcon()),
            ),
          ],
        ),
      ),
    ),
  );
}
