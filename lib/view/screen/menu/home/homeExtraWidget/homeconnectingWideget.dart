import 'package:classic/modal/menu/home/our_collection.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
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

Widget setLogoIcon() {
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
          homeScreenIcon(AppIcon.newcart),
          SizedBox(width: Get.width * 0.03),
          homeScreenIcon(AppIcon.drawer),
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
      fontSize: fontSize ?? Get.width * 0.040,
      fontWeight: FontWeight.w500,
      fontFamily: 'FuturaCyrillic',
      color: color ?? AppColor.gray5,
    ),
  );
}

Widget showIndexofCollection(homeUI) {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.01),
      tabCollectText(homeUI),
      SizedBox(height: Get.height * 0.01),

      /// Dynamic section
      showSection(homeUI.index.value),
    ],
  );
}

/// SECTION CONTENTS BASED ON SELECTED TAB
Widget showSection(int index) {
  final collection = OurCollection();
  switch (index) {
    case 0:
    //Pandant Section
      return collectionList(collection.pandant);

    case 1:
    //Necklace Section
      return collectionList(collection.necklace);

    case 2:
    //Bracelet Section
      return collectionList(collection.bracelet);

    case 3:
    //Earrings Section
      return collectionList(collection.earrings);
    default:
      return SizedBox.shrink();
  }
}

Widget tabCollectText(homeUI) {
  return SizedBox(
    width: Get.width * 0.9,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        tabItem(AppString.pandant, 0, homeUI),
        varticalDivider(),
        tabItem(AppString.necklace, 1, homeUI),
        varticalDivider(),
        tabItem(AppString.bracelet, 2, homeUI),
        varticalDivider(),
        tabItem(AppString.earrings, 3, homeUI),
      ],
    ),
  );
}

Widget varticalDivider() {
  return SizedBox(height: Get.width * 0.08, child: VerticalDivider());
}

Widget tabItem(String text, int index, homeUI) {
  return GestureDetector(
    onTap: () {
      homeUI.index.value = index;
    },
    child: Text(
      text,
      style: TextStyle(
        fontSize: Textsize.normal,
        fontWeight: FontWeight.w500,
        fontFamily: 'FuturaCyrillic',
        color: homeUI.index.value == index ? AppColor.primary : AppColor.gray5,
      ),
    ),
  );
}

//OuerCollection
Widget collectionList(List list) {
  return SizedBox(
    height: Get.height * 0.24,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(Get.width * 0.01),
          child: Column(
            children: [
              Image.asset(list[index]['Image'], height: 100, width: 100),
              Center(
                child: Text(
                  list[index]['name'],
                  style: TextStyle(
                    fontSize: Textsize.small,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
