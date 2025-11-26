import 'package:classic/view/screen/menu/dashbord/dashbordExtraWidget/dashbordExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget diamondSection({
  String? informationContainerDiamondText,
  String? informationContainerDiamondValue,
  String? informationContainerOrderText,
  String? informationContainerOrderValue,
  String? informationContainerHoldText,
  String? informationContainerHoldValue,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      //Information Container Start
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          constraints: BoxConstraints(minWidth: Get.width),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              informationOfProduct(
                informationContainerDiamondText,
                informationContainerDiamondValue,
                isFirst: true,
              ),
              informationOfProduct(
                informationContainerOrderText,
                informationContainerHoldText,
              ),
              informationOfProduct(
                informationContainerHoldText,
                informationContainerHoldValue,
              ),
            ],
          ),
        ),
      ),

      //Information Container End
      SizedBox(height: Get.height * 0.02),
    ],
  );
}

Widget selectIndexText({
  required bool isrecentViwe,
  required bool isMyCartViwe,
  void Function()? onTapMyCartViwe,
  void Function()? onTapRecentViwe,
}) {
  return selectIndexViwe(
    textRecentViwe: AppString.recentViwe,
    colorRecentViwe: (isrecentViwe)
        ? AppColor.primary
        : AppColor.white,
    textMyCartViwe: AppString.myCart,
    colorMyCartViwe: (isMyCartViwe)
        ? AppColor.primary
        : AppColor.white,
    onTapRecentViwe: onTapRecentViwe,
    onTapMyCartViwe: onTapMyCartViwe,
  );
  //Recent Viwe End
}
