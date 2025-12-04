// ignore_for_file: file_names

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/widgetSize.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

Widget dropdowns(
  text, {
  String? hinttext,
  required String value,
  required List<DropdownMenuItem<String>> list,
  void Function(String?)? onChanged,
  BoxBorder? border,
  FontWeight? fontWeight,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      (text == '')
          ? SizedBox()
          : Text(
              text,
              style: TextStyle(
                fontSize: Textsize.normal,
                fontWeight: FontWeight.w500,
              ),
            ),
      SizedBox(height: Get.height * 0.01),
      Container(
        padding: EdgeInsets.only(right: 10),
        width: Get.width,
        height: Widgetsize.getContainerHeight(),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(borderradius.buttonboder),
          color: AppColor.white,
        ),
        child: Center(
          child: DropdownButton2<String>(
            dropdownStyleData: DropdownStyleData(maxHeight: Get.height * 0.4),
            iconStyleData: IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down, size: 18),
            ),
            value: value.isEmpty ? null : value,
            underline: SizedBox(),
            isExpanded: true,
            hint: Text(
              hinttext ?? AppString.select,
              style: TextStyle(
                fontWeight: fontWeight ?? FontWeight.w400,
                fontSize: Get.width * 0.04,
              ),
            ),
            style: TextStyle(
              fontWeight: fontWeight ?? FontWeight.w300,
              fontSize: Get.width * 0.04,
            ),
            items: list,
            onChanged: onChanged,
          ),
        ),
      ),
      SizedBox(height: Get.height * 0.02),
    ],
  );
}
