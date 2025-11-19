// ignore_for_file: non_constant_identifier_names

import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget Inputfield({String? hinttext, TextEditingController? controller}) {
  return Column(
    children: [
      SizedBox(
        height: Get.height * 0.05,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsetsGeometry.symmetric(vertical: Get.width * 0.03, horizontal: Get.width * 0.02),
            hintText: hinttext,
            hintStyle: TextStyle(fontSize: Textsize.normal),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
      SizedBox(height: Get.height * 0.02),
    ],
  );
}
