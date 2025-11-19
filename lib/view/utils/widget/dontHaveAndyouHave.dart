
// ignore_for_file: file_names

import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


Widget have({required String have, required String tab}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        have,
        style: TextStyle(fontSize: Textsize.normal),
      ),
      SizedBox(width : Get.width * 0.01),
      Text(
        tab,
        style: TextStyle(
          fontSize: Textsize.normal,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
        ),
      ),
    ],
  );
}