// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

BoxDecoration orderHistoyDecoration() {
  return BoxDecoration(
    color: AppColor.white,
    boxShadow: kElevationToShadow[1],
    borderRadius: BorderRadius.circular(borderradius.buttonboder),
  );
}

Widget orderHistoryhedding(text) {
  return Text(
    text,
    style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.w500),
  );
}

Widget orderHistoryvalue(text, {Color? color, fontWeight}) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: Get.width * 0.033,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color,
        ),
      ),
      Divider(color: AppColor.secondary),
    ],
  );
}
