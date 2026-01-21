import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'app_Color.dart';

Widget customCircular(){
  return SizedBox(
    height: Get.width * 0.06,
    width: Get.width * 0.06,
    child: CircularProgressIndicator(
      color: AppColor.white,
      strokeWidth: 2.5,
    ),
  );
}