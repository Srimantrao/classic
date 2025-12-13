import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../utils/app_Borderradius.dart';
import '../../../../utils/app_Color.dart';
import '../../diamondSearch/diamondSearchExtraWidget/diamondExtraWidget.dart';

Widget heddingFilter(text) {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.02),
      shapeHedding(text),
    ],
  );
}

Widget selectmetalType({
  required String value,
  required Color bodercolor,
  void Function()? onTap,
  bool? isselect = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (isselect == true) ? AppColor.primary : AppColor.white,
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        border: Border.all(color: bodercolor),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: (isselect == true) ? AppColor.white : AppColor.black,
        ),
      ),
    ),
  );
}

Widget stampMetal({required String text, required bool isSelected}) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
    decoration: BoxDecoration(
      color: isSelected ? AppColor.primary : AppColor.white,
      border: Border.all(color: isSelected ? AppColor.primary : AppColor.gray5),
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: isSelected ? AppColor.white : AppColor.black,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      ),
    ),
  );
}
