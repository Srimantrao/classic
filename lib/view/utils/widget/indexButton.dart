// ignore_for_file: file_names

import 'package:classic/view/utils/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget indexButton({
  required String text,
  required Color color,
  required Color textColor,
  required Color borderColor,
  void Function()? onTap,
}) {
  return button(
    text,
    fontSize: Get.width * 0.035,
    onTap: onTap,
    borderColor: borderColor,
    backgroundColor: color,
    textColor: textColor,
    isLowercase: true,
  );
}
