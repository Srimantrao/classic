// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryExtraWidget/orderHistroryExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget orderHistory() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      orderHistoryhedding('Order'),
      orderHistoryhedding('Order Date'),
      orderHistoryhedding('Total'),
      orderHistoryhedding('Status'),
    ],
  );
}

Widget orderHistoryValue(orderList,{void Function()? onTap}) {
  if (orderList == null || orderList.isEmpty) {
    return Center(child: Lottie.asset(AppJson.noData));
  }
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
        final status = order['orderStatus'];
        if (order == null || order.isEmpty) {
          return Center(child: Lottie.asset(AppJson.noData));
        }
        return GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              orderHistoryvalue(order['orderNo']),
              orderHistoryvalue(order['date']),
              orderHistoryvalue(
                (double.tryParse(order['netAmount']?.toString() ?? '0') ?? 0)
                    .toStringAsFixed(2),
              ),
              orderHistoryvalue(status, color: color(status)),
            ],
          ),
        );
      },
    ),
  );
}
