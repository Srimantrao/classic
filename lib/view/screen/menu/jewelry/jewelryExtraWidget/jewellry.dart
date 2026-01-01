import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_URL.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget product({
  required String text,
  required String? image,
  void Function()? onTap,
})
{
  final bool hasImage = image != null && image.isNotEmpty;

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
          hasImage
              ? Image.network(AppUrl.imagebaseUrl + image, fit: BoxFit.cover)
              : SizedBox(),
          SizedBox(height: Get.height * 0.01),
          Text(
            text,
            style: TextStyle(
              fontSize: Textsize.normal,
              fontWeight: FontWeight.w500,
              fontFamily: 'FuturaCyrillic',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
