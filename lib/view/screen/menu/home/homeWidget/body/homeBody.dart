//Silder Section Start
// ignore_for_file: file_names, avoid_unnecessary_containers, strict_top_level_inference, avoid_print, deprecated_member_use

import 'package:classic/view/screen/menu/home/homeExtraWidget/homeconnectingWideget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_video.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:classic/view/utils/widget/video/video.dart';
import 'package:classic/view/utils/widget/widgetSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../../controller/user_Interface/menu/home/home_Controller.dart';
import '../../../../../utils/app_Borderradius.dart';
import '../../../jewelry/jewelryScreen/product.dart';

// Widget sliderImages(image) {
//   return AspectRatio(
//     aspectRatio: 10 / 9,
//     child: Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
//       ),
//     ),
//   );
// }

Widget sliderImages(String? image) {
  return AspectRatio(
    aspectRatio: 10 / 9,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
      child: Image.network(
        image ?? '',
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(AppImage.spalsh_background, fit: BoxFit.cover);
        },
      ),
    ),
  );
}
//Slider Section End

//Over Collection Start
Widget ourCollection(
  List collections,
  int selectedIndex,
  List data,
  HomeUIController homeUI, {
  required void Function(int) onCategoryTap,
  required void Function(Map) onCollectionTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01)),

      /// HEADING
      homeScreenHeddingText(AppString.ouerCollection),
      homeScreenSubheddingText(
        AppString.chekout,
        fontSize: Textsize.samiHedding,
      ),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01)),

      /// CATEGORY TABS
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(data.length, (index) {
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                onCategoryTap(index);
              },
              child: ouerCollectionTitle(isSelected, data, index),
            );
          }),
        ),
      ),

      SizedBox(height: Get.height * 0.02),

      /// SELECTED CATEGORY COLLECTION
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(collections.length, (index) {
            final Map item = collections[index];
            return overCollectionItems(
              item,
              onTap: () {
                onCollectionTap(item);
              },
            );
          }),
        ),
      ),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01)),
    ],
  );
}
//Over Collection End

//Video Containner Start
Widget adVideo() {
  return SizedBox(
    height: Get.height * 0.5,
    width: Get.width,
    child: Stack(
      children: [
        Positioned.fill(child: Video(videoUrl: AppVideo.addVideo)),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
  return SizedBox(
    height: Get.height * 0.5,
    width: Get.width,
    child: Stack(
      children: [
        /// Background Image
        Positioned.fill(
          child: Image.asset(AppImage.adImage, fit: BoxFit.cover),
        ),

        /// Optional Dark Overlay
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.3))),

        /// Center Content
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              videotext(
                text: AppString.customizeYourOwnJewelry,
                fontSize: Get.width * 0.06,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: Get.height * 0.01),
              videotext(
                text: AppString.doYouHaveAnyIdea,
                fontSize: Get.width * 0.03,
              ),
              SizedBox(height: Get.height * 0.01),
              videotext(
                text: AppString.letUsKnowWhat,
                fontSize: Get.width * 0.03,
              ),
              SizedBox(height: Get.height * 0.03),
              schedulebutton(AppString.customProduct),
            ],
          ),
        ),
      ],
    ),
  );
}
//Image Conatiner End

//Collection Start
Widget collectonList(homeAPI, homeUI) {
  return Obx(() {
    final response = homeAPI.homeCollectionAPI.homeCollectionData;
    final data = response['data'];
    if (data == null || data.isEmpty) {
      return const SizedBox.shrink();
    }
    final selectedIndex = homeUI.index.value;
    if (selectedIndex < 0 || selectedIndex >= data.length) {
      return const SizedBox.shrink();
    }
    final selectedCategory = data[selectedIndex];
    final collections = selectedCategory['collection'];
    if (collections == null || collections.isEmpty) {
      return const SizedBox.shrink();
    }
    return ourCollection(
      collections,
      selectedIndex,
      data,
      homeUI,
      onCategoryTap: (index) {
        homeUI.index.value = index;
      },
      onCollectionTap: (item) {
        print('🚀 Collection Item Tapped:');
        print('Item data: $item');
        print('subCategoryId: ${item['subCategoryId']}');
        print('subCategoryName: ${item['subCategoryName']}');
        print('_id: ${item['_id']}');
        print('title: ${item['title']}');

        // Make sure to check if subCategoryId exists
        if (item['subCategoryId'] != null) {
          Get.to(
            () => Product(
              categoryId: item['_id'].toString(),
              categoryName: item['subCategoryName']?.toString() ?? '',
              subCategoryId: item['subCategoryId'].toString(),
            ),
          );
        } else {
          // Fallback if subCategoryId is missing
          Get.to(
            () => Product(
              categoryId: item['_id'].toString(),
              categoryName:
                  item['subCategoryName']?.toString() ??
                  item['title'].toString(),
            ),
          );
        }
      },
    );
  });
}
//Collection End

//What is Classic Start
Widget whatClassic() {
  return Column(
    children: [
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.02)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.09),
        child: SizedBox(
          width: Get.width / 1.1,
          child: homeScreenHeddingText(AppString.aPeekIntowhatClassic),
        ),
      ),
      homeScreenSubheddingText(
        AppString.classicGrownJewelry,
        fontSize: Textsize.samiHedding,
      ),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.03)),
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
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.05),
              ),
              SizedBox(
                width: Get.width / 1.3,
                child: homeScreenHeddingText(
                  textAlign: TextAlign.center,
                  AppString.joinOur,
                  color: AppColor.white,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01),
              ),
              SizedBox(
                width: Get.width / 1.1,
                child: homeScreenSubheddingText(
                  AppString.become,
                  color: AppColor.white,
                  fontSize: Textsize.samiHedding,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.04),
              ),
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
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.05),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: Get.height * 0.03),
    ],
  );
}

//EmailConyainer End
