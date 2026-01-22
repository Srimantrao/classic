// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore, non_constant_identifier_names, avoid_unnecessary_containers, strict_top_level_inference

import 'package:classic/view/screen/hedder/cart/cartWidget/extraWidget/extraWidget.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget cart({
  required String cartImage,
  required String PRICE_CT,
  required String stock,
  required String type,
  required String Weightm,
  required String title,
  void Function()? onTapIncrimant,
  void Function()? onTapDecrimant,
  required void Function() removeItem,
  int? value,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: Get.height * 0.007),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.gray),
      boxShadow: kElevationToShadow[1],
      color: AppColor.white,
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
    ),
    child: cartValue(
      cartImage: cartImage,
      PRICE_CT: PRICE_CT,
      stock: stock,
      type: type,
      Weightm: Weightm,
      title: title,
      onTapIncrimant: onTapIncrimant,
      onTapDecrimant: onTapDecrimant,
      value: value, removeItem: removeItem
    ),
  );
}

Widget total(text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.gray),
      boxShadow: kElevationToShadow[1],
      color: AppColor.white,
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
    ),
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.005),
    child: horizontalPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [price(AppString.total), price(text)],
      ),
    ),
  );
}