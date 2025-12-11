import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget product({
  required String text,
  required String image,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(color: AppColor.gray3),
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            width: Get.width * 0.3,
            height: Get.width * 0.3,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'FuturaCyrillic',
            ),
          ),
        ],
      ),
    ),
  );
}