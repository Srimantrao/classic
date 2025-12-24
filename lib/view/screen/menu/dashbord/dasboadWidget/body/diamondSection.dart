// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/screen/menu/dashbord/dashbordExtraWidget/dashbordExtraWidget.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
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
                informationContainerOrderValue,
              ),
              (informationContainerHoldText == '' &&
                      informationContainerHoldValue == '')
                  ? SizedBox()
                  : informationOfProduct(
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

//Recent Viwe & My Cart Button Start
Widget selectIndexText({
  required bool isrecentViwe,
  required bool isMyCartViwe,
  void Function()? onTapMyCartViwe,
  void Function()? onTapRecentViwe,
}) {
  return selectIndexViwe(
    textRecentViwe: AppString.recentViwe,
    colorRecentViwe: (isrecentViwe) ? AppColor.primary : AppColor.white,
    textMyCartViwe: AppString.myCart,
    colorMyCartViwe: (isMyCartViwe) ? AppColor.primary : AppColor.white,
    onTapRecentViwe: onTapRecentViwe,
    onTapMyCartViwe: onTapMyCartViwe,
  );
  //Recent Viwe & My Cart Button End
}

//Jewellwery List
Widget jewelryListViwe({required List jewelryList}) {
  return Expanded(
    child: ListView.builder(
      itemCount: jewelryList.length,
      itemBuilder: (BuildContext context, int index) {
        return horizontalPadding(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.009),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.gray5),
              borderRadius: BorderRadius.circular(borderradius.buttonboder),
            ),
            child: Padding(
              padding: EdgeInsets.all(Get.width * 0.03),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImage.pandant1, scale: 25),
                  SizedBox(width: Get.width * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jewelryList[index]['product'],
                          style: TextStyle(
                            fontSize: Textsize.small,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          jewelryList[index]['price'],
                          style: TextStyle(
                            fontSize: Get.width * 0.05,
                            color: AppColor.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        valueShow('SKU: ', jewelryList[index]['SKU']),
                        valueShow('Metal: ', jewelryList[index]['Metal']),
                        valueShow(
                          'Weight(Apx): ',
                          jewelryList[index]['Weight(Apx)'],
                        ),
                        valueShow(
                          'Engriving: ',
                          jewelryList[index]['Engriving'],
                        ),
                        valueShow('Shape: ', jewelryList[index]['Shape']),
                        valueShow('Color: ', jewelryList[index]['Color']),
                        valueShow('Clarity: ', jewelryList[index]['Clarity']),
                        valueShow(
                          'Total Weight: ',
                          jewelryList[index]['TotalWeight'],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget valueShow(head, value) {
  return Row(children: [subHedding(head), subValue(value)]);
}

Widget subHedding(text) {
  return Row(
    children: [
      Text(
        text,
        style: TextStyle(fontSize: Textsize.small, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget subValue(text) {
  return Row(
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: Textsize.small,
          fontWeight: FontWeight.w500,
          color: AppColor.primary,
        ),
      ),
    ],
  );
}
