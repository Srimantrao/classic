// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/customProduct/customProductScreen/customShowDetailProduct.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryExtraWidget/orderHistroryExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';

Widget custumProduct() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      orderHistoryhedding(AppString.orderid),
      orderHistoryhedding(AppString.orderDate),
      orderHistoryhedding(AppString.budget),
      orderHistoryhedding(AppString.state),
    ],
  );
}

Widget customProductValue(customList) {
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

  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd/MMM/yy').format(parsedDate);
  }

  return Expanded(
    child: ListView.builder(
      itemCount: customList.length,
      itemBuilder: (BuildContext context, int index) {
        final order = customList[index];
        final status = order['Status'];
        return GestureDetector(
          onTap: () => Get.to(() => CustomShowDetailProduct(id: order['_id'])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              orderHistoryvalue(order['OrderNo']),
              orderHistoryvalue(formatDate(order['updatedAt'])),
              orderHistoryvalue(order['Budget'].toString()),
              orderHistoryvalue(
                status,
                color: color(status),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        );
      },
    ),
  );
}
