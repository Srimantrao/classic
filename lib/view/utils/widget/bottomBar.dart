// ignore_for_file: deprecated_member_use, file_names, unnecessary_import

import 'dart:ui';
import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottombar extends StatelessWidget {
  final bottomController = Get.put(BottombarController());
  Bottombar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content - takes full screen
            Obx(() => bottomController.pages[bottomController.selectindex.value]),
        
            // Floating bottom navigation bar
            Positioned(
              left: 1,
              right: 1,
              bottom: -30,
              child: Column(
                children: [
                  horizontalPadding(
                    child: flotingBar(bottomController),
                  ),
                  SizedBox(height: Get.height * 0.08),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget flotingBar(bottomController) {
  return Container(
    padding: EdgeInsets.only(
      top: 15,
      left: 10,
      right: 10,
      bottom: 5,
    ),
    decoration: boxDecoration(),
    child: iconTabbing(bottomController),
  );
}

Widget iconTabbing(bottomController){
  return horizontalPadding(
    child: Row(
      children: [
        actionIconButton(
          icon: AppIcon.home,
          color: bottomController.selectindex.value == 0,
          onTap: bottomController.indexOne,
        ),
        Spacer(),
        actionIconButton(
          icon: AppIcon.jewelry,
          color: bottomController.selectindex.value == 1,
          onTap: bottomController.indexOne,
        ),
        Spacer(),
        actionIconButton(
          icon: AppIcon.dashboard,
          color: bottomController.selectindex.value == 2,
          onTap: bottomController.indexOne,
        ),
        Spacer(),
        actionIconButton(
          icon: AppIcon.diamond,
          color: bottomController.selectindex.value == 2,
          onTap: bottomController.indexOne,
        ),
        Spacer(),
        actionIconButton(
          icon: AppIcon.custom,
          color: bottomController.selectindex.value == 2,
          onTap: bottomController.indexOne,
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
  return SizedBox(
    height: Get.height * 0.06,
    child: Column(
      children: [
        customIcon(
          icon: icon,
          onTap: onTap,
          color: (color!) ? AppColor.primary : null,
        ),
        (color)
            ? Column(
                children: [
                  SizedBox(height: Get.height * 0.005),
                  dot(),
                ],
              )
            : SizedBox(),
      ],
    ),
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
      scale: 3.1,
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
