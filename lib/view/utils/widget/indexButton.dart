// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget indexButton({
  required String text,
  required Color color,
  required Color textColor,
  required Color borderColor,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.12,
        vertical: Get.height * 0.009,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Get.width * 0.009),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
