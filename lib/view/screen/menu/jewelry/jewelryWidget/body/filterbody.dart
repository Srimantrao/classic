// ignore_for_file: strict_top_level_inference

import 'package:classic/controller/user_Interface/menu/jewelry/filter_Controller.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_String.dart';
import '../../jewelryExtraWidget/filter.dart';

Widget metaltype({
  required bool whiteselect,
  required bool roseGoldselect,
  required bool yellowGoldselect,
  required bool roseWhiteGoldselect,
  required bool yellowWhiteGoldselect,
  required bool whiteRoseGoldselect,
  required void Function() whiteGoldOneTap,
  required void Function() roseGoldOneTap,
  required void Function() yellowGoldOneTap,
  required void Function() roseWhiteGoldOneTap,
  required void Function() yellowWhiteGoldOneTap,
  required void Function() whiteRoseGoldOneTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      heddingFilter(AppString.metalType),
      SizedBox(height: Get.height * 0.01),
      Row(
        children: [
          selectmetalType(
            isselect: whiteselect,
            onTap: whiteGoldOneTap,
            value: AppString.whithegold,
            bodercolor: AppColor.silveGold,
          ),
          SizedBox(width: Get.width * 0.03),
          selectmetalType(
            isselect: roseGoldselect,
            onTap: roseGoldOneTap,
            value: AppString.rosegold,
            bodercolor: AppColor.roseGold,
          ),
          SizedBox(width: Get.width * 0.03),
          selectmetalType(
            isselect: yellowGoldselect,
            onTap: yellowGoldOneTap,
            value: AppString.yellowgold,
            bodercolor: AppColor.complete,
          ),
        ],
      ),
      SizedBox(height: Get.height * 0.01),
      Row(
        children: [
          selectmetalType(
            isselect: roseWhiteGoldselect,
            onTap: roseWhiteGoldOneTap,
            value: AppString.roseWhitegold,
            bodercolor: AppColor.complete,
          ),
          SizedBox(width: Get.width * 0.03),
          selectmetalType(
            isselect: yellowWhiteGoldselect,
            onTap: yellowWhiteGoldOneTap,
            value: AppString.yellowwhite,
            bodercolor: AppColor.complete,
          ),
        ],
      ),
      SizedBox(height: Get.height * 0.01),
      selectmetalType(
        isselect: whiteRoseGoldselect,
        onTap: whiteRoseGoldOneTap,
        value: AppString.whiteRosegold,
        bodercolor: AppColor.complete,
      ),
    ],
  );
}

Widget metalstame(product) {
  final filter = Get.put(FilterUIController());
  return horizontalPadding(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heddingFilter(AppString.metalStamp),
        SizedBox(height: Get.height * 0.01),
        SizedBox(
          height: Get.height * 0.049,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: product.metalstame.length,
            itemBuilder: (context, index) {
              return Obx(() {
                final isSelected = filter.selectedIndex.value == index;
                return GestureDetector(
                  onTap: () => filter.selectStamp(index),
                  child: stampMetal(
                    text: product.metalstame[index],
                    isSelected: isSelected,
                  ),
                );
              });
            },
          ),
        ),
      ],
    ),
  );
}

Widget shapeSelected(dimaondlist) {
  return GetBuilder<FilterUIController>(
    builder: (FilterUIController controller) {
      return horizontalPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            heddingFilter(AppString.shape),
            SizedBox(height: Get.height * 0.009),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dimaondlist.shapes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: Get.width * 0.02,
                childAspectRatio: 2.0,
                mainAxisSpacing: Get.width * 0.02,
              ),
              itemBuilder: (BuildContext context, int index) {
                final isSelected = controller.selectedShape.value == index;
                return GestureDetector(
                  onTap: () => controller.selectShape(index),
                  child: shapeContainer(
                    text: dimaondlist.shapes[index],
                    isSelected: isSelected,
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

//Stone Type
Widget stoneType(filterCategory) {
  return GetBuilder<FilterUIController>(
    builder: (FilterUIController controller) {
      return horizontalPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            heddingFilter(AppString.stone),
            SizedBox(height: Get.height * 0.009),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: Get.width * 0.02,
                childAspectRatio: 2.0,
                mainAxisSpacing: Get.width * 0.02,
              ),
              itemCount: filterCategory.stoneTypeList.length,
              itemBuilder: (context, index) {
                final isSelected = controller.selectedStoneType.value == index;
                return GestureDetector(
                  onTap: () => controller.selectStoneType(index),
                  child: stoneTypeSelected(
                    text: filterCategory.stoneTypeList[index],
                    isSelected: isSelected,
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget shortBY({
  void Function()? onTapLowToHigh,
  void Function()? onTapHighToLow,
  bool isSelectedLowToHigh = false,
  bool isSelectedHighToLow = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      horizontalPadding(child: heddingFilter(AppString.sortBy)),
      SizedBox(height: Get.height * 0.009),
      Row(
        children: [
          SizedBox(width: Get.width * 0.03),
          GestureDetector(
            onTap: onTapLowToHigh,
            child: sortContainer(
              'Price(Low To High)',
              isSelected: isSelectedLowToHigh,
            ),
          ),
          SizedBox(width: Get.width * 0.02),
          GestureDetector(
            onTap: onTapHighToLow,
            child: sortContainer(
              'Price(High To Low)',
              isSelected: isSelectedHighToLow,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget filterButton({void Function()? onTapClear, void Function()? onTapSave}) {
  return Row(
    children: [
      Expanded(
        child: button(
          textColor: AppColor.primary,
          backgroundColor: AppColor.white,
          borderColor: AppColor.primary,
          AppString.clear,
          onTap: () {},
        ),
      ),
      SizedBox(width: Get.width * 0.05),
      Expanded(child: button(AppString.save, onTap: () {})),
    ],
  );
}
