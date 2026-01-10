// ignore_for_file: file_names, strict_top_level_inference, deprecated_member_use, duplicate_ignore

import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../utils/app_Borderradius.dart';
import '../../../../utils/app_TextSize.dart';

Widget productDetailsubHedding(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.samisubHedding,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget productDetailsubHedding2(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.samisubHedding,
      fontWeight: FontWeight.w500,
      color: AppColor.editColor,
    ),
  );
}

Widget productDetailtext(text) {
  return Text(text, style: TextStyle(fontWeight: FontWeight.w500));
}

Widget showItemImage(image) {
  return Container(
    padding: EdgeInsets.all(40),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.gray3),
      image: DecorationImage(image: NetworkImage(image)),
    ),
  );
}

Widget sahapeContainer({
  void Function()? onTap,
  required String shape,
  bool isSelected = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.015),
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.009),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.secondary.withOpacity(0.5)
            : Colors.transparent,
        border: Border.all(
          color: isSelected
              ? AppColor.primary.withOpacity(0.5)
              : AppColor.gray5,
        ),
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
      ),
      child: Center(
        child: Text(shape, style: TextStyle(color: Colors.black)),
      ),
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

Widget metaltypeselect(
  Color? backgroundColor, {
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

Widget editValue(text) {
  return GestureDetector(
    child: Container(
      color: AppColor.white,
      padding: EdgeInsetsGeometry.symmetric(horizontal: Get.width * 0.05),
      child: Text(
        text,
        style: TextStyle(color: AppColor.primary, fontSize: Get.width * 0.04),
      ),
    ),
  );
}

Widget changvalue(text, {void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: Get.width * 0.02),
      color: AppColor.primary,
      child: Text(
        text,
        style: TextStyle(color: AppColor.white, fontSize: Get.width * 0.05),
      ),
    ),
  );
}

Widget toggleIcon(text) {
  return Text(
    text,
    style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.w500),
  );
}

Widget metalHedding(text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(fontSize: Get.width * 0.033, fontWeight: FontWeight.w500),
  );
}

Widget metalDetailPadding({String? title, String? value}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.height * 0.005),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [productDetailsubHedding2(title), productDetailtext(value)],
    ),
  );
}

Widget like({
  required String image,
  required String name,
  required String price,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: EdgeInsets.all(Get.width * 0.18),
        margin: EdgeInsets.only(left: Get.width * 0.03,right: Get.width * 0.02),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.secondary),
          borderRadius: BorderRadius.circular(borderradius.buttonboder),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
      SizedBox(height: Get.height * 0.005),
      SizedBox(
        width: Get.width * 0.35,
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        width: Get.width * 0.35,
        child: Text(
          price,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
