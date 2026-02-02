// ignore_for_file: file_names, strict_top_level_inference, unnecessary_brace_in_string_interps, unnecessary_import

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shimmer/shimmer.dart';

Widget smallText(text) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: Textsize.small,
      fontFamily: 'FuturaCyrillic',
    ),
  );
}

Widget smallTextsecond(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.minismall,
      fontWeight: FontWeight.w500,
      color: AppColor.gray5,
      fontFamily: 'FuturaCyrillic',
    ),
  );
}

Widget smallAanwasr(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.minismall,
      fontWeight: FontWeight.w500,
      color: AppColor.black,
    ),
  );
}

Widget varticalDivaders() {
  return Text(
    "|",
    style: TextStyle(
      fontSize: Get.width * 0.05,
      fontWeight: FontWeight.w600,
      color: AppColor.gray3,
    ),
  );
}

Widget grayContainer({
  required String leftlable,
  required String leftvalue,
  required String rightlable,
  required String rightvalue,
  required Color color,
}) {
  final width = Get.width * 0.40;
  return Container(
    decoration: BoxDecoration(color: color),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: width, child: paramitaer(leftlable, leftvalue)),
          SizedBox(width: width, child: paramitaer(rightlable, rightvalue)),
        ],
      ),
    ),
  );
}

Widget lableValue(text) {
  return Text(
    '${text} -',
    style: TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.w500,
      fontFamily: 'FuturaCyrillic',
      fontSize: Textsize.samisubHedding,
    ),
  );
}

Widget value(text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.w500,
      fontFamily: 'FuturaCyrillic',
      fontSize: Textsize.samiHedding,
    ),
  );
}

Widget paramitaer(label, values) {
  return Row(
    children: [
      lableValue(label),
      SizedBox(width: Get.width * 0.02),
      SizedBox(width: Get.width * 0.15, child: value(values)),
    ],
  );
}

Widget shirmmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.gray, AppColor.white, AppColor.gray],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
            child: Column(
              children: [
                horizontalPadding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
                Divider(color: AppColor.editColor),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: []),
                      Column(children: []),
                      Column(children: []),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        angelPadding(),
        horizontalPadding(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width * 0.4,
                    height: Get.height * 0.05,
                    decoration: BoxDecoration(
                      color: AppColor.gray,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Get.width * 0.02),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.4,
                    height: Get.height * 0.05,
                    decoration: BoxDecoration(
                      color: AppColor.gray,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Get.width * 0.02),
                      ),
                    ),
                  ),
                ],
              ),
              angelPadding(),
              Container(
                height: Get.height * 0.5,
                decoration: BoxDecoration(
                  color: AppColor.gray,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Get.width * 0.02),
                  ),
                ),
              ),
              angelPadding(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width * 0.3,
                    height: Get.height * 0.05,
                    decoration: BoxDecoration(
                      color: AppColor.gray,
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.3,
                    height: Get.height * 0.05,
                    decoration: BoxDecoration(
                      color: AppColor.gray,
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.3,
                    height: Get.height * 0.05,
                    decoration: BoxDecoration(
                      color: AppColor.gray,
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                  ),
                ],
              ),
              angelPadding(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.005)),
                      Row(
                        children: [
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.02)),
                          Container(
                            width: Get.width * 0.2,
                            height: Get.height * 0.005,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(Get.width * 0.02),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget angelPadding() {
  return Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.03));
}