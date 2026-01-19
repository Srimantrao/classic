// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_TextSize.dart';

Widget addText(text) {
  return Center(
    child: Text(
      text,
      style: TextStyle(
        fontSize: Get.width * 0.028,
        color: AppColor.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget setLogoIcon({
  void Function()? drawerOntap,
  void Function()? newcartOntap,
}) {
  return Row(
    children: [
      Row(children: [Image.asset(AppImage.logo, scale: 3)]),
      Spacer(),
      Row(
        children: [
          homeScreenIcon(AppIcon.search),
          SizedBox(width: Get.width * 0.03),
          homeScreenIcon(AppIcon.wishlist),
          SizedBox(width: Get.width * 0.03),
          GestureDetector(
            onTap: newcartOntap,
            child: homeScreenIcon(AppIcon.newcart),
          ),
          SizedBox(width: Get.width * 0.03),
          GestureDetector(
            onTap: drawerOntap,
            child: homeScreenIcon(AppIcon.drawer),
          ),
        ],
      ),
    ],
  );
}

Widget iconSize(icon, text) {
  return SizedBox(
    width: Get.width * 0.3,
    child: Column(
      children: [
        Image(
          image: AssetImage(icon),
          fit: BoxFit.cover,
          width: 80,
          height: 80,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

Widget samiHedding(text) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(
          color: AppColor.primary,
          fontSize: Textsize.samiHedding,
          fontFamily: 'FuturaCyrillic',
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: Get.height * 0.02),
    ],
  );
}

Widget samitextvalue(text) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(color: AppColor.primary, fontSize: Textsize.small),
      ),
      SizedBox(height: Get.height * 0.02),
    ],
  );
}

Widget fotterImage(image) {
  return Row(
    children: [
      Image(image: AssetImage(image), width: 26, height: 26),
      SizedBox(width: Get.width * 0.02),
    ],
  );
}

Widget videotext({
  required String text,
  required double fontSize,
  FontWeight? fontWeight,
}) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: 'FuturaCyrillic',
    ),
  );
}

Widget schedulebutton(text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    decoration: BoxDecoration(border: Border.all(color: AppColor.white)),
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.w600,
        fontSize: Textsize.normal,
      ),
    ),
  );
}

Widget homeScreenIcon(icon) {
  return Image.asset(icon, scale: 3.5);
}

Widget homeScreenHeddingText(text, {Color? color, TextAlign? textAlign}) {
  return Text(
    textAlign: textAlign,
    text.toUpperCase(),
    style: TextStyle(
      color: color ?? AppColor.primary,
      fontWeight: FontWeight.w800,
      fontSize: Textsize.heading,
      fontFamily: 'FuturaCyrillic',
    ),
  );
}

Widget homeScreenSubheddingText(text, {Color? color, double? fontSize}) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: TextStyle(
      fontSize: fontSize ?? Get.width * 0.035,
      fontWeight: FontWeight.w500,
      fontFamily: 'FuturaCyrillic',
      color: color ?? AppColor.gray5,
    ),
  );
}

Widget ouerCollectionTitle(isSelected, data, index){
  return Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data[index]['categoryName'],
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: Textsize.normal,
              fontFamily: 'FuturaCyrillic',
              color: isSelected
                  ? AppColor.primary
                  : AppColor.gray5,
            ),
          ),
          if (index != data.length - 1) ...[
            SizedBox(width: Get.width * 0.02),
            Text('|',style: TextStyle(color: AppColor.gray5)),
          ],
        ],
      ),
    ),
  );
}

Widget overCollectionItems(item,{required void Function() onTap}){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
    child: GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item['image'],
              width: Get.width * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: Get.width * 0.01),
          Text(
            textAlign: TextAlign.center,
            item['title'].replaceFirst(' ', '\n'),
            softWrap: true,
            maxLines: 2,
            style: TextStyle(fontSize: Get.width * 0.030),
          ),
        ],
      ),
    ),
  );
}
