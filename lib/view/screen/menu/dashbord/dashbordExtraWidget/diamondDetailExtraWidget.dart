// ignore_for_file: file_names, strict_top_level_inference, unnecessary_brace_in_string_interps

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget smallText(text) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: Textsize.small,
      fontFamily: 'FuturaCyrillic',
    ),
  );
}

Widget smallTextsecond(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.minismall,
      fontWeight: FontWeight.w500,
      color: AppColor.gray5,
      fontFamily: 'FuturaCyrillic',
    ),
  );
}

Widget smallAanwasr(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.minismall,
      fontWeight: FontWeight.w500,
      color: AppColor.black,
    ),
  );
}

Widget varticalDivaders() {
  return Text(
    "|",
    style: TextStyle(
      fontSize: Get.width * 0.05,
      fontWeight: FontWeight.w600,
      color: AppColor.gray3,
    ),
  );
}

Widget grayContainer({
  required String leftlable,
  required String leftvalue,
  required String rightlable,
  required String rightvalue,
  required Color color,
}) {
  final width = Get.width * 0.40;
  return Container(
    decoration: BoxDecoration(color: color),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: width, child: paramitaer(leftlable, leftvalue)),
          SizedBox(width: width, child: paramitaer(rightlable, rightvalue)),
        ],
      ),
    ),
  );
}

Widget lableValue(text) {
  return Text(
    '${text} -',
    style: TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.w500,
      fontFamily: 'FuturaCyrillic',
      fontSize: Textsize.samisubHedding,
    ),
  );
}

Widget value(text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.w500,
      fontFamily: 'FuturaCyrillic',
      fontSize: Textsize.samiHedding,
    ),
  );
}

Widget paramitaer(label, values) {
  return Row(
    children: [
      lableValue(label),
      SizedBox(width: Get.width * 0.02),
      SizedBox(width: Get.width * 0.15, child: value(values)),
    ],
  );
}
