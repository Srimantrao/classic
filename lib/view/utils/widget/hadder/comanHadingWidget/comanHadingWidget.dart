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
      fontSize: Textsize.samiHedding,
      fontFamily: 'FuturaCyrillic'
    ),
  );
}

Widget icon(dynamic icon) {
  double size = Get.width * 0.050;
  if (icon is IconData) {
    return Icon(icon, color: AppColor.white, size: size);
  }
  if (icon is String) {
    return Image.asset(
      icon,
      color: AppColor.white,
      width: size,
      height: size,
    );
  }
  // Fallback: if a widget is passed in directly
  if (icon is Widget) {
    return icon;
  }

  // Default empty container to avoid runtime crashes
  return SizedBox(width: size, height: size);
}
