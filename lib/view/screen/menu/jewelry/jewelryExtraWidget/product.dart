// ignore_for_file: deprecated_member_use, strict_top_level_inference, duplicate_ignore

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget caratContainer({required String text, required Color color}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: Get.width * 0.02,
      vertical: Get.height * 0.001,
    ),
    decoration: BoxDecoration(border: Border.all(color: color)),
    child: Text(text, style: TextStyle(fontSize: Textsize.minismall)),
  );
}

Widget price(text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.0035),
    child: Text(
      '\$$text',
      style: TextStyle(
        fontSize: Textsize.samiHedding,
        fontWeight: FontWeight.w600,
        color: AppColor.primary,
      ),
    ),
  );
}

Widget information(text) {
  return Text(
    '$text : ',
    style: TextStyle(
      fontSize: Textsize.samisubHedding,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget productName(text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.0035),
    child: Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: Textsize.small, fontWeight: FontWeight.w500),
    ),
  );
}

Widget showContainer({
  required String name,
  required Color bgColor,
  Color? selectColor,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: Get.width * 0.01),
      child: Container(
        margin: EdgeInsets.only(right: Get.width * 0.02),
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.025,
          vertical: Get.width * 0.015,
        ),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: selectColor?.withOpacity(0.3),
          borderRadius: BorderRadius.circular(borderradius.buttonboder),
          border: Border.all(color: bgColor),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: Get.width * 0.03,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
