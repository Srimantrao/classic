// ignore_for_file: file_names, deprecated_member_use

import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget flotingBar(BottombarController bottomController) {
  return Container(
    padding: EdgeInsets.only(
      top: Get.height * 0.010,
      left: Get.width * 0.04,
      right: Get.width * 0.04,
      bottom: Get.height * 0.01,
    ),
    decoration: boxDecoration(),
    child: iconTabbing(bottomController),
  );
}

Widget iconTabbing(BottombarController bottomController) {
  return horizontalPadding(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        actionIconButton(
          icon: AppIcon.home,
          color: bottomController.selectindex.value == 0,
          onTap: () => bottomController.changePage(0),
        ),
        actionIconButton(
          icon: AppIcon.jewelry,
          color: bottomController.selectindex.value == 1,
          onTap: () => bottomController.changePage(1),
        ),
        actionIconButton(
          icon: AppIcon.dashboard,
          color: bottomController.selectindex.value == 2,
          onTap: () => bottomController.changePage(2),
        ),
        actionIconButton(
          icon: AppIcon.diamond,
          color: bottomController.selectindex.value == 3,
          onTap: () => bottomController.changePage(3),
        ),
        actionIconButton(
          icon: AppIcon.custom,
          color: bottomController.selectindex.value == 4,
          onTap: () => bottomController.changePage(4),
        ),
      ],
    ),
  );
}

BoxDecoration boxDecoration() {
  return BoxDecoration(
    color: AppColor.secondary.withOpacity(0.8),
    borderRadius: BorderRadius.circular(borderradius.boder),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: borderradius.boder,
        offset: Offset(0, 6),
      ),
    ],
  );
}

Widget actionIconButton({
  required String icon,
  bool? color = false,
  void Function()? onTap,
}) {
  return Column(
    children: [
      customIcon(
        icon: icon,
        onTap: onTap,
        color: (color!) ? AppColor.primary : null,
      ),
      (color)
          ? Column(
        children: [
          SizedBox(height: Get.height * 0.002),
          dot(),
        ],
      )
          : SizedBox(),
    ],
  );
}

Widget customIcon({
  required String icon,
  Color? color,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(
      icon,
      scale: 3.2,
      color: color,
    ),
  );
}

Widget dot() {
  return CircleAvatar(
    backgroundColor: AppColor.primary,
    radius: 2,
  );
}
