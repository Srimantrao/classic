// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_import

import 'package:classic/controller/user_Interface/menu/home/home_Controller.dart';
import 'package:classic/modal/menu/home/our_collection.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/app_video.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../utils/widget/inputfield.dart';
import '../../../utils/widget/logo.dart';
import '../../../utils/widget/video.dart';
import '../../../utils/widget/widgetSize.dart';

class Home extends StatelessWidget {
  final homeUI = Get.put(HomeUIController());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: appBar(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            sliderImages(),
            Obx(() => ourCollection(homeUI)),
            adVideo(),
            adImage(),
            whatClassic(),
            emailContainer(),
            fotter(),
          ],
        ),
      ),
    );
  }
}

//Appbar Start
PreferredSizeWidget appBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 40),
    child: Container(
      color: AppColor.white,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 7,
                horizontal: Get.width / 30,
              ),
              decoration: BoxDecoration(color: AppColor.primary),
              child: addText(AppString.homeadd),
            ),
            Container(
              padding: EdgeInsetsGeometry.symmetric(vertical: 8),
              decoration: BoxDecoration(color: AppColor.white),
              child: horizontalPadding(child: setLogoIcon()),
            ),
          ],
        ),
      ),
    ),
  );
}

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
// Appbar End

//Body start

//Silder Section Start
Widget sliderImages() {
  return AspectRatio(
    aspectRatio: 10 / 9, // Adjust as you want (4/3, 2/1, etc.)
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.sliderImage3),
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

//Fotter Start
Widget fotter() {
  return Container(
    width: Get.width,
    child: horizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [image(height: Get.height * 0.03)],
          ),
          samiHedding(AppString.companyProfile),
          samitextvalue(AppString.shasvatprofile),
          samitextvalue(AppString.companyaddrtes),
          samitextvalue(AppString.comapntPhone),
          samitextvalue(AppString.comapntEmailId),
          SizedBox(height: Get.height * 0.01),
          Divider(color: AppColor.gray5),
          SizedBox(height: Get.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  samiHedding(AppString.ourServices),
                  samitextvalue(AppString.aboutus),
                  samitextvalue(AppString.termsConditions),
                  samitextvalue(AppString.privacyPolicy),
                  samitextvalue(AppString.shippingPolicy),
                  samitextvalue(AppString.returnsPolicy),
                  samitextvalue(AppString.smallLooseDimaonds),
                  samitextvalue(AppString.labGrownDiamonds),
                  samitextvalue(AppString.FAQs),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  samiHedding(AppString.ourServices),
                  samitextvalue(AppString.aboutus),
                  samitextvalue(AppString.termsConditions),
                  samitextvalue(AppString.privacyPolicy),
                  samitextvalue(AppString.shippingPolicy),
                  samitextvalue(AppString.returnsPolicy),
                  samitextvalue(AppString.smallLooseDimaonds),
                  samitextvalue(AppString.labGrownDiamonds),
                  samitextvalue(AppString.FAQs),
                ],
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.01),
          Divider(color: AppColor.gray5),
          SizedBox(height: Get.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Follow Us On: ', style: TextStyle(color: AppColor.gray5)),
              fotterImage(AppImage.instagram),
              fotterImage(AppImage.twitter),
              fotterImage(AppImage.facebook),
              fotterImage(AppImage.pinterest),
              fotterImage(AppImage.youtube),
            ],
          ),
          SizedBox(height: Get.height * 0.13),
        ],
      ),
    ),
  );
}
//Fotter End

//Body End

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
