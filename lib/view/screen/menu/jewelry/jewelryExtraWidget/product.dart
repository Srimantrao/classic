// ignore_for_file: deprecated_member_use, strict_top_level_inference

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

Widget caratInformation() {
  return Row(
    children: [
      caratContainer(text: '10k', color: AppColor.roseGold),
      SizedBox(width: Get.width * 0.01),
      caratContainer(text: '10k', color: AppColor.gray),
      SizedBox(width: Get.width * 0.01),
      caratContainer(text: '10k', color: AppColor.complete),
      SizedBox(width: Get.width * 0.01),
      caratContainer(text: '14k', color: AppColor.roseGold),
      SizedBox(width: Get.width * 0.01),
      caratContainer(text: '14k', color: AppColor.gray),
      SizedBox(width: Get.width * 0.01),
      caratContainer(text: '14k', color: AppColor.complete),
      SizedBox(width: Get.width * 0.01),
      caratContainer(text: '18k', color: AppColor.roseGold),
      SizedBox(width: Get.width * 0.01),
      caratContainer(text: '18k', color: AppColor.gray),
      SizedBox(width: Get.width * 0.01),
      caratContainer(text: '18k', color: AppColor.complete),
    ],
  );
}

Widget productImage(image) {
  final double imageSize = 120;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image(image: AssetImage(image), width: imageSize, height: imageSize),
    ],
  );
}

Widget caratHowMany(text) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: Get.width * 0.02,
      vertical: Get.height * 0.001,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.gray),
      color: AppColor.secondary.withOpacity(0.5),
    ),
    child: Text(text, style: TextStyle(fontSize: Textsize.minismall)),
  );
}

Widget price(text) {
  return Text(
    '₹ $text',
    style: TextStyle(
      fontSize: Textsize.small,
      fontWeight: FontWeight.w700,
      color: AppColor.primary,
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
  return Text(
    text,
    style: TextStyle(fontSize: Textsize.small, fontWeight: FontWeight.w500),
  );
}
