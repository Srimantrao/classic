// ignore_for_file: prefer_const_constructors_in_immutables, file_names

import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/modal/headder/myAccount/orderHistory.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryExtraWidget/orderHistroryExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryScreen/orderDetail.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryWidget/body/orderHistoryWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orderhistory extends StatelessWidget {
  final orderList = OrderhistoryList();
  final hedder = Get.put(CartAPICall());
  Orderhistory({super.key});
  @override
  Widget build(BuildContext context) {
    final api = hedder.orderHistory;
    final apiData = api.orderHistoryData['data'];
    return Fullscreen(
      appBar: allOtherScreen(AppString.orderHistory),
      child: horizontalPadding(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.02),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: orderHistoyDecoration(),
                child: Column(
                  children: [
                    orderHistory(),
                    Divider(color: AppColor.secondary),
                    orderHistoryValue(
                      apiData,
                      onTap: () {
                        Get.to(() => OrderDetail());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
