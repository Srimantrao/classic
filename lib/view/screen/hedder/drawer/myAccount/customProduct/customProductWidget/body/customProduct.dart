// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/screen/hedder/drawer/myAccount/orderHistory/orderHistoryExtraWidget/orderHistroryExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';

Widget custumProduct() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      orderHistoryhedding('Order ID'),
      orderHistoryhedding('Date'),
      orderHistoryhedding('Budget'),
      orderHistoryhedding('Status'),
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

  return Expanded(
    child: ListView.builder(
      itemCount: customList.length,
      itemBuilder: (BuildContext context, int index) {
        final order = customList[index];
        final status = order['Status'];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            orderHistoryvalue(order['Order ID']),
            orderHistoryvalue(order['Order Date']),
            orderHistoryvalue(order['Budget']),
            orderHistoryvalue(status, color: color(status)),
          ],
        );
      },
    ),
  );
}
