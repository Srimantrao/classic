
// ignore_for_file: file_names

import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget inputTyaping({
  required String text,
  String? hinttext,
  required TextEditingController controller,
  bool? obscureText,
  Color? color,
  void Function(String)? onChanged,
  TextInputAction? textInputAction,
  int? maxLength,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  double? height,
  bool? expands,
  TextAlignVertical? textAlignVertical,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: Textsize.normal,
          fontWeight: FontWeight.w600,
        ),
      ),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01)),
      Inputfield(
        hinttext: hinttext,
        controller: controller,
        obscureText: obscureText ?? false,
        color: color,
        onChanged: onChanged,
        textInputAction: textInputAction,
        maxLength: maxLength,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        height: height,
        expands: expands,
        textAlignVertical: textAlignVertical,
      ),
    ],
  );
}