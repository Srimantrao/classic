// ignore_for_file: file_names, unnecessary_import, non_constant_identifier_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../dashbordExtraWidget/diamondDetailExtraWidget.dart';

Widget diamondDetailHadder({
  required String shape,
  required String careat,
  required String lab,
  required String colorcode,
  required String clarity,
  required String cartifactNo,
  String? location,
  String? PPC,
  String? total,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColor.gray, AppColor.white, AppColor.gray],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.008),
      child: Column(
        children: [
          horizontalPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                smallText(shape),
                varticalDivaders(),
                smallText(careat),
                varticalDivaders(),
                smallText(colorcode),
                varticalDivaders(),
                smallText(clarity),
                varticalDivaders(),
                smallText(lab),
                varticalDivaders(),
                smallText(cartifactNo),
              ],
            ),
          ),
          Divider(color: AppColor.editColor),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    smallTextsecond('Location'),
                    smallAanwasr(location),
                  ],
                ),
                Column(children: [smallTextsecond('PPC'), smallAanwasr(PPC)]),
                Column(
                  children: [smallTextsecond('Total'), smallAanwasr(total)],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
