// ignore_for_file: file_names

import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/findStore/findStoreExtraWidget/findStoreExtraStore.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget sarchHeadder({
  required TextEditingController searchController,
  required void Function() onTap,
}) {
  return horizontalPadding(
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: searchBar(
            searchController,
            hinttext: AppString.enterCityPinCode,
          ),
        ),
        SizedBox(width: Get.width * 0.02),
        Expanded(
          child: Column(
            children: [
              button(AppString.check, onTap: onTap, isLowercase: true),
              SizedBox(height: Get.height * 0.02),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget findStoreList({required List list}) {
  return Expanded(
    child: horizontalPadding(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          final item = list[index];
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsetsGeometry.symmetric(vertical: Get.height * 0.01),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(borderradius.buttonboder),
              border: Border.all(color: AppColor.gray5),
            ),
            child: Column(
              children: [
                Image.asset(AppImage.logo),
                SizedBox(height: Get.height * 0.02),
                address(
                  aria: item['aria'],
                  city: item['city'],
                  distance: item['distance'],
                ),
                SizedBox(height: Get.height * 0.02),
                findStoreListText(item['fullAddress']),
                SizedBox(height: Get.height * 0.02),
                button(AppString.getDirections, isLowercase: true),
              ],
            ),
          );
        },
      ),
    ),
  );
}
