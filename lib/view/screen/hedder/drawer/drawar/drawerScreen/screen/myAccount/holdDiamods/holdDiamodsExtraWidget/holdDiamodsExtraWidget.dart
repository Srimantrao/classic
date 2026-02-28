// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore, strict_top_level_inference

import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget chakhedding(text) {
  return Text(
    text,
    style: TextStyle(
      color: AppColor.black,
      fontSize: Get.width * 0.035,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget chakValue(text) {
  return Text(
    text,
    style: TextStyle(
      color: AppColor.primary,
      fontSize: Get.width * 0.035,
      fontWeight: FontWeight.w600,
    ),
  );
}
