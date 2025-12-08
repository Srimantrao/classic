import 'package:classic/view/screen/menu/home/homeExtraWidget/homeconnectingWideget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget appBar({void Function()? drawerOntap}) {
  final topPadding = Get.mediaQuery.padding.top;
  final double extraRowHeight = 56;
  return PreferredSize(
    preferredSize: Size.fromHeight(
      kToolbarHeight + extraRowHeight + topPadding,
    ),
    child: Container(
      color: AppColor.primary,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                vertical: 7,
                horizontal: Get.width / 80,
              ),
              decoration: BoxDecoration(color: AppColor.primary),
              child: addText(AppString.homeadd),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(color: AppColor.white),
              child: horizontalPadding(
                child: setLogoIcon(drawerOntap: drawerOntap),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
