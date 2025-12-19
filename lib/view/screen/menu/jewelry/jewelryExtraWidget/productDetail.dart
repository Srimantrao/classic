// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../utils/app_Borderradius.dart';
import '../../../../utils/app_TextSize.dart';

Widget productDetailsubHedding(text){
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.samisubHedding,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget showItemImage(image) {
  return Container(
    padding: EdgeInsets.all(40),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.gray3),
      image: DecorationImage(image: AssetImage(image)),
    ),
  );
}

Widget caratButton(
  carat, {
  void Function()? onTap,
  bool isSelectcarat = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: Get.width * 0.009),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: (isSelectcarat)
            // ignore: deprecated_member_use
            ? AppColor.secondary.withOpacity(0.3)
            : AppColor.white,
        border: Border.all(color: AppColor.gray5),
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
      ),
      child: Center(
        child: Text(
          carat,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Textsize.small,
          ),
        ),
      ),
    ),
  );
}

Widget metaltypeselect(Color? backgroundColor, {
  bool isSelectmetaltype = false,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        border: Border.all(
          color: (isSelectmetaltype) ? AppColor.primary : AppColor.white,
        ),
      ),
      child: CircleAvatar(radius: 12, backgroundColor: backgroundColor),
    ),
  );
}

