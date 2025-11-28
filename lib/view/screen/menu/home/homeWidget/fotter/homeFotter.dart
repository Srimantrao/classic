
// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:classic/view/screen/menu/home/homeExtraWidget/homeconnectingWideget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../../utils/widget/logo.dart';

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
              Text(AppString.followUsOn, style: TextStyle(color: AppColor.gray5)),
              fotterImage(AppImage.instagram),
              fotterImage(AppImage.twitter),
              fotterImage(AppImage.facebook),
              fotterImage(AppImage.pinterest),
              fotterImage(AppImage.youtube),
            ],
          ),
        ],
      ),
    ),
  );
}
