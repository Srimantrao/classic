import 'package:classic/controller/user_Interface/menu/home/home_Controller.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final homeUI = Get.put(HomeUIController());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: appBar(),
      child: SingleChildScrollView(
        child: Column(
          children: [sliderImages(), Obx(() => ourCollection(homeUI))],
        ),
      ),
    );
  }
}

//Appbar Start
PreferredSizeWidget appBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(Get.height * 0.11),
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
  return Container(
    height: Get.height * 0.3,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppImage.sliderImage),
        fit: BoxFit.cover,
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
        SizedBox(height: Get.height * 0.02),
        homeScreenHeddingText(AppString.ouerCollection),
        homeScreenSubheddingText(AppString.chekout),
        showIndexofCollection(homeUI),
      ],
    ),
  );
}
//Over Collection End

//Body End

Widget homeScreenIcon(icon) {
  return Image.asset(icon, scale: 3.5);
}

Widget homeScreenHeddingText(text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
      color: AppColor.primary,
      fontWeight: FontWeight.w800,
      fontSize: Textsize.heading,
      fontFamily: 'FuturaCyrillic',
    ),
  );
}

Widget homeScreenSubheddingText(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Get.width * 0.032,
      fontWeight: FontWeight.w500,
      fontFamily: 'FuturaCyrillic',
      color: AppColor.gray5,
    ),
  );
}

Widget showIndexofCollection(homeUI) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
        child: Column(
          children: [
            tabCollectText(homeUI),
            SizedBox(height: 15),

            /// Dynamic section
            showSection(homeUI.index.value),
          ],
        ),
      ),
    ],
  );
}

/// SECTION CONTENTS BASED ON SELECTED TAB
Widget showSection(int index) {
  switch (index) {
    case 0:
      return Column(
        children: [
          Image.asset(AppImage.sliderImage, scale: 10),
          Text("Pandant Section"),
        ],
      );

    case 1:
      return Column(
        children: [
          Image.asset(AppImage.sliderImage, scale: 10),
          Text("Necklace Section"),
        ],
      );

    case 2:
      return Column(
        children: [
          Image.asset(AppImage.sliderImage, scale: 10),
          Text("Bracelet Section"),
        ],
      );

    case 3:
      return Column(
        children: [
          Image.asset(AppImage.sliderImage, scale: 10),
          Text("Earrings Section"),
        ],
      );
    default:
      return SizedBox.shrink();
  }
}

Widget tabCollectText(homeUI) {
 return Row(
   children: [
     tabItem(AppString.pandant, 0, homeUI),
     SizedBox(height: Get.width * 0.07, child: VerticalDivider()),
     tabItem(AppString.necklace, 1, homeUI),
     SizedBox(height: Get.width * 0.07, child: VerticalDivider()),
     tabItem(AppString.bracelet, 2, homeUI),
     SizedBox(height: Get.width * 0.07, child: VerticalDivider()),
     tabItem(AppString.earrings, 3, homeUI),
   ],
 );
}

Widget tabItem(String text, int index, homeUI) {
  return GestureDetector(
    onTap: () {
      homeUI.index.value = index;
    },
    child: Text(
      text,
      style: TextStyle(
        fontSize: Get.width * 0.045,
        fontWeight: FontWeight.w500,
        fontFamily: 'FuturaCyrillic',
        color: homeUI.index.value == index ? AppColor.primary : AppColor.gray5,
      ),
    ),
  );
}
