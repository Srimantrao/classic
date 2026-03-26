// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

BoxDecoration listDecoration() {
  return BoxDecoration(
    color: AppColor.white,
    borderRadius: BorderRadius.circular(borderradius.buttonboder),
    boxShadow: kElevationToShadow[2],
  );
}

Widget removeAccountButton(void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        border: Border.all(color: AppColor.cancel),
      ),
      child: Text(
        AppString.removeAddress,
        style: TextStyle(color: AppColor.cancel),
      ),
    ),
  );
}

Widget addressListText(text) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: Textsize.samisubHedding,
    ),
  );
}

Widget chageBillingAddressText(String text) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: Textsize.samisubHedding,
          fontWeight: FontWeight.w600,
          color: AppColor.primary,
        ),
      ),
      SizedBox(height: Get.height * 0.001),
      Container(height: 1.5, width: text.length * 7.2, color: AppColor.primary),
    ],
  );
}

Widget typeInputEdit({
  required TextEditingController controller,
  required String text,
  required String hinttext,
  int? maxLength,
  TextInputType? keyboardType,
}) {
  return inputTyaping(
    text: text,
    controller: controller,
    color: AppColor.gray,
    hinttext: hinttext,
    maxLength: maxLength,
    keyboardType: keyboardType,
  );
}
