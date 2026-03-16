// ignore_for_file: strict_top_level_inference

import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryExtraWidget/orderDetailExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryWidget/body/orderDetailWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

Widget shireemer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Column(
      children: [
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.02)),
        Container(
          width: Get.width,
          height: Get.height * 0.07,
          color: AppColor.gray,
        ),
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.02)),
        Container(
          height: Get.height * 0.4,
          width: Get.width,
          decoration: BoxDecoration(color: AppColor.gray),
        ),
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.02)),
        Container(
          height: Get.height * 0.3,
          width: Get.width,
          decoration: BoxDecoration(color: AppColor.gray),
        ),
      ],
    ),
  );
}

Widget heddindDetail({required String orderid, required String date}) {
  return Container(
    padding: EdgeInsetsGeometry.symmetric(
      vertical: Get.height * 0.015,
      horizontal: Get.width * 0.02,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Get.width * 0.02),
      border: Border.all(color: AppColor.secondary),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [Text("${AppString.orderid} :- "), Text(orderid)]),
        Row(
          children: [
            Text("${AppString.orderDate} :- "),
            Text(date, style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    ),
  );
}

Widget personalDetails(apidata) {
  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd/MMM/yy').format(parsedDate);
  }

  color(status) {
    switch (status) {
      case 'INACTIVE':
        return AppColor.red;
      case 'ACTIVE':
        return AppColor.green1;
      default:
        return AppColor.black;
    }
  }

  final status = apidata['Status'];
  return showOrderDetailContainer(
    heddingValue: AppString.personalDetails,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        detailShowing(
          orderID: AppString.orderid,
          orderValue: apidata['OrderNo'].toString(),
        ),
        detailShowing(
          orderID: AppString.fristname,
          orderValue: apidata['FirstName'].toString(),
        ),
        detailShowing(
          orderID: AppString.fristname,
          orderValue: apidata['LastName'].toString(),
        ),
        detailShowing(
          orderID: AppString.emailId,
          orderValue: apidata['Email'].toString(),
        ),
        detailShowing(
          orderID: AppString.mobileNo,
          orderValue: apidata['Phone'].toString(),
        ),
        detailShowing(
          orderID: AppString.budget,
          orderValue: apidata['Budget'].toString(),
        ),
        detailShowing(
          orderID: AppString.orderDate,
          orderValue: formatDate(apidata['updatedAt'].toString()),
        ),
        detailShowing(
          orderID: AppString.status,
          orderValue: status,
          color: color(status),
        ),
        button('show Quotation', width: Get.width * 0.4),
      ],
    ),
  );
}

Widget productDetails(apidata) {
  return showOrderDetailContainer(
    heddingValue: AppString.productDetails,
    child: Column(
      children: [
        detailShowing(
          orderID: AppString.productType,
          orderValue: apidata['Category'].toString(),
        ),
        detailShowing(
          orderID: AppString.metalType,
          orderValue: apidata['MetalType'].toString(),
        ),
        detailShowing(
          orderID: AppString.metalStamp,
          orderValue: apidata['MetalStamp'].toString(),
        ),
        detailShowing(
          orderID: AppString.appxMetalWeight,
          orderValue: apidata['AppxMetalWgt'].toString(),
        ),
        detailShowing(
          orderID: AppString.ringSize,
          orderValue: apidata['AppxMetalWgt'].toString(),
        ),
        detailShowing(
          orderID: AppString.remark,
          orderValue: apidata['productStatus']['remark'].toString(),
        ),
      ],
    ),
  );
}
