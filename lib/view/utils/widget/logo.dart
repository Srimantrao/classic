import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_Image.dart';

Widget image({double? height}) {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.03),
      Image.asset(AppImage.logo, scale: 2.5),
      SizedBox(height: height ?? Get.height * 0.080),
    ],
  );
}