// ignore_for_file: file_names

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget refrens({
  required String text,
  required String icon,
  void Function()? onTap,
}) {
  final double iconsize = 25;
  return GestureDetector(
    onTap: onTap,
    child: horizontalPadding(
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.01),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(Get.width * 0.02),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(borderradius.buttonboder),
                ),
                child: Image(
                  image: AssetImage(icon),
                  height: iconsize,
                  width: iconsize,
                  color: AppColor.white,
                ),
              ),
              SizedBox(width: Get.width * 0.03),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Get.width * 0.040,
                ),
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.01),
        ],
      ),
    ),
  );
}
