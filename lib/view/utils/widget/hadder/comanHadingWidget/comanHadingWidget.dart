// ignore_for_file: file_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget appbarheddingText(text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
      color: AppColor.white,
      fontWeight: FontWeight.w800,
      fontSize: Textsize.small,
    ),
  );
}

Widget icon(String icon) {
  double size = Get.width * 0.045;
  return Image.asset(icon, color: AppColor.white, width: size, height: size);
}
