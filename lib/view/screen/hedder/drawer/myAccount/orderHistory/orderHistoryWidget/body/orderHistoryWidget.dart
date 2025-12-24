// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/screen/hedder/drawer/myAccount/orderHistory/orderHistoryExtraWidget/orderHistroryExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';

Widget orderHistory() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      orderHistoryhedding('Order ID'),
      orderHistoryhedding('Order Date'),
      orderHistoryhedding('Total'),
      orderHistoryhedding('Status'),
    ],
  );
}

Widget orderHistoryValue(orderList) {
  color(status) {
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
  return Expanded(
    child: ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (BuildContext context, int index) {
        final order = orderList[index];
        final status = order['Status'];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            orderHistoryvalue(order['Order ID']),
            orderHistoryvalue(order['Order Date']),
            orderHistoryvalue(order['Total']),
            orderHistoryvalue(status, color: color(status)),
          ],
        );
      },
    ),
  );
}
