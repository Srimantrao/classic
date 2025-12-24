// ignore_for_file: file_names

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget imageDrawer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [image(height: Get.height * 0.02)],
  );
}

Widget allDrawersBody({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(borderradius.boder),
        topLeft: Radius.circular(borderradius.boder),
      ),
    ),
    child: SafeArea(child: child),
  );
}

Widget iconDrawer({
  required String text,
  required String icon,
  bool? dot = false,
  void Function()? onTap
}) {
  final double size = 16;
  return GestureDetector(
    onTap: onTap,
    child: horizontalPadding(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(
                        borderradius.buttonboder,
                      ),
                    ),
                    child: Image(
                      image: AssetImage(icon),
                      color: AppColor.white,
                      width: size,
                      height: size,
                    ),
                  ),
                  SizedBox(width: Get.width * 0.05),
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: Textsize.normal,
                    ),
                  ),
                ],
              ),
              (dot == true)
                  ? CircleAvatar(radius: 2, backgroundColor: AppColor.primary)
                  : SizedBox(),
            ],
          ),
          Divider(color: AppColor.gray),
        ],
      ),
    ),
  );
}
