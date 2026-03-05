// ignore_for_file: strict_top_level_inference, deprecated_member_use

import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget boxinsodeLable(
  value, {
  Color? color,
  double? fontSize,
  String? fontFamily,
}) {
  return Text(
    "$value : ",
    style: TextStyle(
      fontSize: fontSize ?? Get.width * 0.035,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    ),
  );
}

Widget detailShowing({
  required String orderID,
  required String orderValue,
  String? value3,
  Color? color,
}) {
  return Row(
    children: [
      boxinsodeLable(orderID),
      Text(orderValue, style: TextStyle(color: color)),
      Padding(padding: EdgeInsetsGeometry.only(right: Get.width * 0.01)),
      Text(value3 ?? '', style: TextStyle(color: color)),
    ],
  );
}

Widget detailExtraShowing({
  required String value1,
  required String value2,
  String? value3,
  Color? color,
}) {
  return Row(
    children: [
      Text(value1),
      Padding(padding: EdgeInsetsGeometry.only(right: Get.width * 0.01)),
      Text(value2, style: TextStyle(color: color)),
      Text(value3 ?? '', style: TextStyle(color: color)),
    ],
  );
}

Widget colorStats(String status) {
  Color color(status) {
    switch (status) {
      case 'Cancel':
        return AppColor.red;
      case 'Approved':
        return AppColor.primary;
      case 'Pending':
        return AppColor.complete;
      default:
        return AppColor.black;
    }
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: color(status).withOpacity(0.1),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: color(status)),
    ),
    child: Text(
      status,
      style: TextStyle(color: color(status), fontWeight: FontWeight.w600),
    ),
  );
}

Widget totalPricePoint({
  required String lable,
  required String value,
  Color? color,
  double? fontSize,
  String? fontFamily,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      boxinsodeLable(
        lable,
        color: AppColor.primary,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
      Text(
        '\$$value',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
      ),
    ],
  );
}
