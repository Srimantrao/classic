//Silder Section Start
// ignore_for_file: file_names, avoid_unnecessary_containers, strict_top_level_inference

import 'package:classic/view/screen/menu/home/homeExtraWidget/homeconnectingWideget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_video.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:classic/view/utils/widget/video/video.dart';
import 'package:classic/view/utils/widget/widgetSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget sliderImages(image) {
  return AspectRatio(
    aspectRatio: 10 / 9, // Adjust as you want (4/3, 2/1, etc.)
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
//Slider Section End

//Over Collection Start
Widget ourCollection(homeUI) {
  return SizedBox(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.01),
        homeScreenHeddingText(AppString.ouerCollection),
        homeScreenSubheddingText(AppString.chekout),
        showIndexofCollection(homeUI),
      ],
    ),
  );
}
//Over Collection End

//Video Containner Start
Widget adVideo() {
  return SizedBox(
    height: Get.height * 0.4,
    width: Get.width,
    child: Stack(
      children: [
        Positioned.fill(child: Video(videoUrl: AppVideo.addVideo)),

        /// Overlay text
        Positioned(
          left: Get.width * 0.05,
          right: Get.width * 0.025,
          top: Get.height * 0.04,
          bottom: Get.height * 0.003,
          child: Column(
            children: [
              videotext(
                text: AppString.ringsThatPerfectly.toUpperCase(),
                fontSize: Get.width * 0.06,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: Get.height * 0.01),
              videotext(
                text: AppString.chooseFromOurSignature,
                fontSize: Get.width * 0.03,
              ),
              SizedBox(height: Get.height * 0.03),
              schedulebutton(AppString.scheduleaCAll),
            ],
          ),
        ),
      ],
    ),
  );
}
//Video Container End

//Image Conatiner Start
Widget adImage() {
  return Container(
    height: Get.height * 0.4,
    width: Get.width,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppImage.adImage),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.04),
        videotext(
          text: AppString.customizeYourOwnJewelry,
          fontSize: Get.width * 0.06,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: Get.height * 0.01),
        videotext(text: AppString.doYouHaveAnyIdea, fontSize: Get.width * 0.03),
        SizedBox(height: Get.height * 0.01),
        videotext(text: AppString.letUsKnowWhat, fontSize: Get.width * 0.03),
        SizedBox(height: Get.height * 0.03),
        schedulebutton(AppString.customProduct),
      ],
    ),
  );
}
//Image Conatiner End

//What is Classic Start
Widget whatClassic() {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.02),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.09),
        child: SizedBox(
          width: Get.width / 1.1,
          child: homeScreenHeddingText(AppString.aPeekIntowhatClassic),
        ),
      ),
      homeScreenSubheddingText(AppString.classicGrownJewelry),
      SizedBox(height: Get.height * 0.03),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconSize(AppImage.icon1, '100% Original'.toUpperCase()),
          iconSize(AppImage.icon2, 'Quality Assuerd'.toUpperCase()),
          iconSize(AppImage.icon3, '100% Certified'.toUpperCase()),
        ],
      ),
    ],
  );
}
//What is Classic End

//EmailContainer Start
Widget emailContainer() {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.03),
      Container(
        width: Get.width,
        decoration: BoxDecoration(color: AppColor.primary),
        child: horizontalPadding(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.05),
              SizedBox(
                width: Get.width / 1.3,
                child: homeScreenHeddingText(
                  textAlign: TextAlign.center,
                  AppString.joinOur,
                  color: AppColor.white,
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              SizedBox(
                width: Get.width / 1.1,
                child: homeScreenSubheddingText(
                  AppString.become,
                  color: AppColor.white,
                  fontSize: Get.width * 0.03,
                ),
              ),
              SizedBox(height: Get.height * 0.04),
              Inputfield(
                height: Widgetsize.getContainerHeight(),
                color: AppColor.gray5,
                hinttext: AppString.emailId_hint,
                fillColor: AppColor.primary,
                hintstyleColor: AppColor.white,
                hintstylefontFamily: 'FuturaCyrillic',
                textfontFamily: 'FuturaCyrillic',
                suffixIcon: Icon(
                  Icons.send_time_extension_outlined,
                  color: AppColor.gray5,
                ),
              ),
              SizedBox(height: Get.height * 0.05),
            ],
          ),
        ),
      ),
      SizedBox(height: Get.height * 0.03),
    ],
  );
}
//EmailConyainer End