// ignore_for_file: file_names

import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget have({
  required String have,
  required String tab,
  void Function()? onTap,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            have,
            style: TextStyle(
              fontSize: Textsize.normal,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: Get.width * 0.01),
          GestureDetector(
            onTap: onTap,
            child: Text(
              tab,
              style: TextStyle(
                fontSize: Textsize.normal,
                fontWeight: FontWeight.w200,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: Get.height * 0.01),
    ],
  );
}
