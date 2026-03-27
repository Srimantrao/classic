// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_Constants.dart';
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
  void Function()? wishlistOntap,
}) {
  return Row(
    children: [
      Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.03)),
      Row(children: [Image.asset(AppImage.logo, scale: 2.5)]),
      Spacer(),
      Row(
        children: [
          homeScreenIcon(AppIcon.search),
          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.001)),
          GestureDetector(
            onTap: wishlistOntap,
            child: homeScreenIcon(AppIcon.wishlist),
          ),
          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.001)),
          GestureDetector(
            onTap: newcartOntap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                homeScreenIcon(AppIcon.newcart),
                Obx(() => cartBadge(cartItemCount.value,top: -5,right: 0)),
              ],
            ),
          ),
          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.001)),
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
          fontWeight: FontWeight.w600,
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
        style: TextStyle(
          color: AppColor.primary,
          fontSize: Textsize.samisubHedding,
          fontWeight: FontWeight.w500,
        ),
      ),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.02)),
    ],
  );
}

Widget fotterImage(image) {
  return Row(
    children: [
      Image(image: AssetImage(image), width: 26, height: 26),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.02)),
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
  return Container(
    color: AppColor.white,
    padding: EdgeInsetsGeometry.symmetric(
      horizontal: Get.height * 0.006,
      vertical: Get.width * 0.03,
    ),
    child: Image.asset(icon, scale: 3),
  );
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

Widget ouerCollectionTitle(isSelected, data, index) {
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
              color: isSelected ? AppColor.primary : AppColor.gray5,
            ),
          ),
          if (index != data.length - 1) ...[
            SizedBox(width: Get.width * 0.02),
            Text('|', style: TextStyle(color: AppColor.gray5)),
          ],
        ],
      ),
    ),
  );
}

Widget overCollectionItems(item, {required void Function() onTap}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
    child: GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item['image'] ?? '',
              width: Get.width * 0.32,
              height: Get.height * 0.15,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  AppImage.logo,
                  width: Get.width * 0.32,
                  height: Get.height * 0.15,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.width * 0.01)),
          Text(
            textAlign: TextAlign.center,
            item['title'].replaceFirst(' ', '\n'),
            softWrap: true,
            maxLines: 2,
            style: TextStyle(
              fontFamily: 'Sans-Bold',
              fontSize: Get.width * 0.030,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget cartBadge(
  String cartItem, {
  Color? color,
  Color? textcolor,
  double? right,
  double? top,
}) {
  if (cartItem.isEmpty || cartItem == '0') {
    return const SizedBox.shrink();
  }
  return Positioned(
    right: right ?? -2,
    top: top ?? -2,
    child: Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: color ?? AppColor.primary,
        shape: BoxShape.circle,
      ),
      constraints: BoxConstraints(minWidth: 16, minHeight: 16),
      child: Center(
        child: Text(
          cartItem,
          style: TextStyle(
            color: textcolor ?? Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
