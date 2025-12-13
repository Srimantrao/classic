import 'package:classic/controller/user_Interface/menu/jewelry/filter_Controller.dart';
import 'package:classic/view/utils/app_Color.dart';
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
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      heddingFilter(AppString.metalStamp),
      SizedBox(height: Get.height * 0.01),
      SizedBox(
        height: Get.height * 0.05,
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
  );
}

