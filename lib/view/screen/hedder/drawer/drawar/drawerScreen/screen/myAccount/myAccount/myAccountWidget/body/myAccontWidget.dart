// ignore_for_file: file_names

import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/myAccount/myAccountExtraWidget/myAccountExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget editNameEmail({
  required String name,
  required String email,
  void Function()? onTap,
}) {
  final double iconsize = 30;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(color: AppColor.white),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.02),
          horizontalPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: Textsize.subheding,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: Textsize.small,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  AppIcon.edit,
                  color: AppColor.primary,
                  width: iconsize,
                  height: iconsize,
                ),
              ],
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          Divider(color: AppColor.secondary),
          SizedBox(height: Get.height * 0.02),
        ],
      ),
    ),
  );
}

Widget showActivity({
  void Function()? orderhistory,
  void Function()? wishlist,
  void Function()? holdDiamond,
  void Function()? customProduct,
  void Function()? address,
  void Function()? changePassword,
  void Function()? helpCenter,
  void Function()? privacyPolicy,
  void Function()? termsAndConditions,
  void Function()? logout,
}) {
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          refrens(
            text: AppString.orderHistory,
            icon: AppIcon.documant,
            onTap: orderhistory,
          ),
          refrens(
            text: AppString.wishlist,
            icon: AppIcon.wishlist,
            onTap: wishlist,
          ),
          refrens(
            text: AppString.holdDiamond,
            icon: AppIcon.hold,
            onTap: holdDiamond,
          ),
          refrens(
            text: AppString.customProduct,
            icon: AppIcon.hold,
            onTap: customProduct,
          ),
          refrens(
            text: AppString.address,
            icon: AppIcon.findstore,
            onTap: address,
          ),
          refrens(
            text: AppString.changePassword,
            icon: AppIcon.passwordKey,
            onTap: changePassword,
          ),
          refrens(
            text: AppString.helpCenter,
            icon: AppIcon.helpCenter,
            onTap: helpCenter,
          ),
          refrens(
            text: AppString.privacyPolicy,
            icon: AppIcon.insurance,
            onTap: privacyPolicy,
          ),
          refrens(
            text: AppString.termsAndConditions,
            icon: AppIcon.documant,
            onTap: termsAndConditions,
          ),
          refrens(text: AppString.logout, icon: AppIcon.logout, onTap: logout),
        ],
      ),
    ),
  );
}
