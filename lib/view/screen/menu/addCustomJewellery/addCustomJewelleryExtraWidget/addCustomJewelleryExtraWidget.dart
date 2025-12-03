// ignore_for_file: file_names

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/checkbox.dart';
import 'package:classic/view/utils/widget/dropdownSelected.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget addCustomJewelleryHeddingText(
  text, {
  Color? color,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color ?? AppColor.primary,
      fontWeight: FontWeight.w600,
      fontSize: Get.width * 0.052,
      fontFamily: 'Sans-Bold',
    ),
  );
}

Widget addCustomJewellerySubHeddingText(
  text, {
  Color? color,
  double? fontSize,
}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: fontSize ?? Get.width * 0.035,
      fontWeight: FontWeight.w400,
      fontFamily: 'Sans-Bold',
      color: color ?? AppColor.black,
    ),
  );
}

Widget roundCircleSelector({
  required String imageText,
  required String videoText,
  required String urlText,
  required void Function() imageOnTap,
  required void Function() videoOnTap,
  required void Function() urlOnTap,
  required Color imageColor,
  required Color videoColor,
  required Color urlColor,
  required double imageRadius,
  required double videoRadius,
  required double urlRadius,
}) {
  return Row(
    children: [
      roundCircal(
        text: imageText,
        onTap: imageOnTap,
        color: imageColor,
        radius: imageRadius,
      ),
      SizedBox(width: Get.width * 0.15),
      roundCircal(
        text: videoText,
        onTap: videoOnTap,
        color: videoColor,
        radius: videoRadius,
      ),
      SizedBox(width: Get.width * 0.15),
      roundCircal(
        text: urlText,
        onTap: urlOnTap,
        color: urlColor,
        radius: urlRadius,
      ),
    ],
  );
}

Widget roundCircal({
  required String text,
  required void Function() onTap,
  required Color color,
  required double radius,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 10,
          child: CircleAvatar(backgroundColor: AppColor.white, radius: radius),
        ),
        SizedBox(width: Get.width * 0.02),
        Text(
          text,
          style: TextStyle(
            color: AppColor.black,
            fontSize: Get.width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget chooseFileButton({
  required void Function() onTap,
  required String buttonText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: Get.height * 0.01),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.1,
                  vertical: Get.height * 0.015,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderradius.buttonboder),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: Get.width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget inputString({
  required TextEditingController controller,
  required String text,
  required String hinttext,
  int? maxLength,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
}) {
  return inputTyaping(
    text: text,
    hinttext: hinttext,
    controller: controller,
    color: AppColor.gray5,
    maxLength: maxLength,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
  );
}

Widget selectdropdown(
  String? label, {
  required List<DropdownMenuItem<String>> list,
  required String value,
  required ValueChanged<String?> onChanged,
  required String hinttext,
}) {
  return dropdowns(
    label,
    hinttext: hinttext,
    list: list,
    value: value,
    onChanged: onChanged,
    border: Border.all(color: AppColor.gray5),
    fontWeight: FontWeight.w500,
  );
}

Widget checkBoxWidget({
  required String isCenterStonetext,
  required bool isCenterStonevalue,
  required void Function(bool?) isCenterStoneonChanged,
  required String isSideStonetext,
  required bool isSideStonevalue,
  required void Function(bool?) isSideStoneonChanged,
}) {
  return Column(
    children: [
      tabCheck(
        text: isCenterStonetext,
        value: isCenterStonevalue,
        onChanged: isCenterStoneonChanged,
      ),
      SizedBox(height: Get.height * 0.01),
      tabCheck(
        text: isSideStonetext,
        value: isSideStonevalue,
        onChanged: isSideStoneonChanged,
      ),
    ],
  );
}

Widget tabCheck({
  required String text,
  required bool value,
  void Function(bool?)? onChanged,
}) {
  return Row(
    children: [
      checkBox(value, onChanged),
      SizedBox(width: Get.width * 0.02),
      Text(
        text,
        style: TextStyle(
          fontSize: Get.width * 0.04,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget customCheckbox() {
  return Container(
    height: Get.height * 0.03,
    width: Get.width * 0.07,
    decoration: BoxDecoration(
      color: AppColor.primary,
      border: Border.all(color: AppColor.primary),
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
    ),
    child: Icon(Icons.check, color: AppColor.white, size: 20),
  );
}
