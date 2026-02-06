// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

//Recent Viwe List Start
Widget valueList({
  required List valueList,
  bool isWishlist = false,
  bool isCart = false,
  bool camara = false,
  bool video = false,
}) {
  return Expanded(
    child: ListView.builder(
      itemCount: valueList.length,
      itemBuilder: (BuildContext context, int index) {
        return horizontalPadding(
          child: GestureDetector(
            onTap: () {
              // Get.to(
              //   () => Diamonddetail(
              //     shape: valueList[index]['shape'],
              //     careat: valueList[index]['careat'],
              //     lab: valueList[index]['lab'],
              //     colorcode: valueList[index]['colorcode'],
              //     clarity: valueList[index]['clarity'],
              //     cartifactNo: valueList[index]['cartifactNo'],
              //   ),
              // );
            },
            child: Container(
              margin: EdgeInsetsGeometry.symmetric(
                vertical: Get.height * 0.009,
              ),
              decoration: BoxDecoration(
                boxShadow: kElevationToShadow[2],
                color: AppColor.white,
                borderRadius: BorderRadius.circular(borderradius.boder),
              ),
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.03),
                child: Column(
                  children: [
                    listHeddind(
                      shape: valueList[index]['shape'],
                      careat: valueList[index]['careat'],
                      lab: valueList[index]['lab'],
                      colorcode: valueList[index]['colorcode'],
                      clarity: valueList[index]['clarity'],
                      cartifactNo: valueList[index]['cartifactNo'],
                      cartifactIcon: '',
                    ),
                    Divider(color: AppColor.gray3),
                    Row(
                      children: [
                        fristrow(
                          cps: valueList[index]['cps'],
                          meas: valueList[index]['meas'],
                          refNo: valueList[index]['refNo'],
                        ),
                        secondrow(
                          T: valueList[index]['T'],
                          D: valueList[index]['D'],
                          loc: valueList[index]['loc'],
                        ),
                        SizedBox(width: Get.width * 0.01),
                        SizedBox(
                          height: Get.height * 0.06,
                          child: VerticalDivider(
                            color: AppColor.gray3,
                            thickness: Get.width * 0.002,
                            width: Get.width * 0.01,
                          ),
                        ),
                        SizedBox(width: Get.width * 0.01),
                        thardrow(
                          ct: valueList[index]['ct'],
                          total: valueList[index]['total'],
                        ),
                      ],
                    ),
                    Divider(color: AppColor.gray3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ?(isWishlist == true)
                            ? GestureDetector(
                                child: listImage(AppIcon.wishlist),
                              )
                            : null,
                        ?(isCart == true)
                            ? GestureDetector(child: listImage(AppIcon.newcart))
                            : null,
                        ?(camara == true)
                            ? GestureDetector(
                                child: Image.asset(
                                  AppIcon.camera,
                                  scale: 28,
                                  color: AppColor.primary,
                                ),
                              )
                            : null,
                        ?(video == true)
                            ? GestureDetector(child: listImage(AppIcon.video))
                            : null,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
//Recent Viwe List End

Widget listHeddind({
  required String shape,
  required String careat,
  required String lab,
  required String colorcode,
  required String clarity,
  required String cartifactNo,
  required String cartifactIcon,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          listHeadingText(shape),
          listHeadingText('|'),
          listHeadingText(careat),
          listHeadingText('|'),
          listHeadingText(colorcode),
          listHeadingText('|'),
          listHeadingText(clarity),
          listHeadingText('|'),
          listHeadingText(lab),
        ],
      ),
      Row(
        children: [
          Image.asset(cartifactIcon, scale: 27, color: AppColor.primary),
          listHeadingText(cartifactNo),
        ],
      ),
    ],
  );
}

Widget listImage(icon) {
  return Image.asset(icon, scale: 4.5, color: AppColor.primary);
}

Widget fristrow({
  required String cps,
  required String meas,
  required String refNo,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      valuNameOne('C-P-S', cps),
      valuNameOne('MEAS', meas),
      valuNameOne('Ref No', refNo),
    ],
  );
}

Widget valuNameOne(head, value) {
  return Row(children: [listsubHedding(head), listsubHeddingValue1(value)]);
}

Widget valuNameSeconde(head, value) {
  return Row(children: [listsubHedding(head), listsubHeddingValue2(value)]);
}

Widget secondrow({required String T, required String D, required String loc}) {
  return Column(
    children: [
      valuNameSeconde('T', T),
      valuNameSeconde('D', D),
      valuNameSeconde('LOC', loc),
    ],
  );
}

Widget thardrow({required String ct, required String total}) {
  return Column(
    children: [valuNameSeconde('₹/CT', ct), valuNameSeconde('₹/Total', total)],
  );
}

Widget listHeadingText(text) {
  return Padding(
    padding: EdgeInsets.all(Get.width * 0.003),
    child: Text(
      text,
      style: TextStyle(
        color: AppColor.primary,
        fontWeight: FontWeight.w600,
        fontSize: Textsize.small,
      ),
    ),
  );
}

Widget listsubHedding(text) {
  return Padding(
    padding: EdgeInsets.only(right: Get.width * 0.01),
    child: SizedBox(
      width: Get.width * 0.11,
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.gray3,
          fontWeight: FontWeight.w600,
          fontSize: Textsize.minismall,
        ),
      ),
    ),
  );
}

Widget listsubHeddingValue1(text) {
  return SizedBox(
    width: Get.width / 3.8,
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: Textsize.minismall,
      ),
    ),
  );
}

Widget listsubHeddingValue2(text) {
  return Row(
    children: [
      SizedBox(
        width: Get.width * 0.11,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Textsize.minismall,
          ),
        ),
      ),
    ],
  );
}
