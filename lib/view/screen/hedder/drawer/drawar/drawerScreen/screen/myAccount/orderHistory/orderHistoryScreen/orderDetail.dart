// ignore_for_file: unnecessary_null_comparison

import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/orderHistory/orderDetail_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryWidget/body/orderDetailWidget.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../../../../utils/app_String.dart';

class OrderDetail extends StatelessWidget {
  final String orderID;
  final orderDetail = Get.put(OrderDetailController());
  OrderDetail({super.key, required this.orderID});
  @override
  Widget build(BuildContext context) {
    orderDetail.getOrderDetail(orderID);
    return Fullscreen(
      appBar: allOtherScreen(AppString.orderDetail),
      child: Obx(() {
        if (orderDetail.isLoading.value) {
          return seletaonWatting();
        }
        final apdata = orderDetail.orderDetailData;
        if (apdata == null ||
            apdata['data'] == null ||
            apdata['data'].isEmpty) {
          return const Center(child: Text("No Data Found"));
        }
        if (apdata['data'][0] == null) {
          return const Center(child: Text("Order data is invalid"));
        }
        final order = apdata['data'][0];
        if (order['biilingAddress'] == null ||
            order['biilingAddress'].isEmpty) {
          return Center(child: Lottie.asset(AppJson.noData));
        }
        final billing = order['biilingAddress'][0];
        if (order['OrderProductList'] == null ||
            order['OrderProductList'].isEmpty) {
          return Center(child: Lottie.asset(AppJson.noData));
        }
        final orderProduct = order['OrderProductList'];
        final item = orderProduct[0];
        return SingleChildScrollView(
          child: SafeArea(
            child: horizontalPadding(
              child: Column(
                children: [
                  //Order Details Start
                  orderDetailPop(order),
                  // //Order Details End

                  //Billing Address Start
                  billingAddressPop(billing),
                  //Billing Address End

                  //Order Items Start
                  orderItem(order),
                  //Order Items End

                  //Total Price Start
                  totalPricePointPop(item),
                  //Total Price End
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}


