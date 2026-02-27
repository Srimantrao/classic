// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:flutter/material.dart';

BoxDecoration listDecoration() {
  return BoxDecoration(
    color: AppColor.white,
    borderRadius: BorderRadius.circular(borderradius.buttonboder),
    boxShadow: kElevationToShadow[2],
  );
}

Widget removeAccountButton() {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
      border: Border.all(color: AppColor.black),
    ),
    child: Text('Remove Address'),
  );
}

Widget addressListText(text) {
  return Text(text);
}

Widget chageBillingAddressText(text) {
  return Text(
    text,
    style: TextStyle(decoration: TextDecoration.underline),
  );
}

Widget typeInputEdit({
  required TextEditingController controller,
  required String text,
  required String hinttext,
}) {
  return inputTyaping(
    text: text,
    controller: controller,
    color: AppColor.gray,
    hinttext:hinttext,
  );
}

