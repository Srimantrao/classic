// ignore_for_file: strict_top_level_inference

import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryExtraWidget/orderDetailExtraWidget.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';

Widget showOrderDetailContainer({
  required String heddingValue,
  required Widget child,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.008),
    child: Container(
      decoration: BoxDecoration(border: Border.all(color: AppColor.gray)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColor.gray),
            width: Get.width,
            padding: EdgeInsetsDirectional.all(8),
            child: Text(
              heddingValue,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Get.width * 0.041,
              ),
            ),
          ),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.008)),
          Container(padding: EdgeInsetsDirectional.all(8), child: child),
        ],
      ),
    ),
  );
}

//Order Details Start
Widget orderDetailPop(order) {
  return showOrderDetailContainer(
    heddingValue: AppString.orderDetails,
    child: Column(
      children: [
        detailShowing(orderID: 'Order Id', orderValue: order['orderNo']),
        detailShowing(
          orderID: 'Date Added',
          orderValue: DateFormat(
            'dd / MMM / yy',
          ).format(DateTime.parse(order['updatedAt'])),
        ),
      ],
    ),
  );
}
//Order Details End

//Billing Address Start
Widget billingAddressPop(billing) {
  return showOrderDetailContainer(
    heddingValue: AppString.billingAddress,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        detailExtraShowing(
          value1: billing['firstName'],
          value2: billing['lastName'],
        ),
        Text(billing['address']),
        detailExtraShowing(value1: billing['state'], value2: billing['city']),
        Text(billing['code']),
        Text(billing['biilingCountryDetail']['name']),
      ],
    ),
  );
}
//Billing Address End

//Order Items Start
Widget orderItem(order) {
  return showOrderDetailContainer(
    heddingValue: AppString.orderItems,
    child: ListView.builder(
      itemCount: order['OrderProductList'].length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final item = order['OrderProductList'][index];
        return Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderradius.buttonboder),
              border: Border.all(color: AppColor.gray),
              boxShadow: kElevationToShadow[1],
              color: AppColor.white,
            ),
            child: Row(
              children: [
                Image.network(item['images'][0]['MediaLocation'], scale: 3),
                Padding(
                  padding: EdgeInsetsGeometry.only(right: Get.width * 0.02),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['productTitle']),
                      detailShowing(
                        orderID: AppString.qty,
                        orderValue: item['itemCode'],
                      ),
                      detailShowing(
                        orderID: AppString.metal,
                        orderValue: item['metalStampName'],
                        value3: item['metalTypeName'],
                      ),
                      detailShowing(
                        orderID: AppString.wgt,
                        orderValue: item['productStone'][0]['wgt'].toString(),
                      ),
                      detailShowing(
                        orderID: AppString.qty,
                        orderValue: item['qty'].toString(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: colorStats(order['orderStatus'].toString()),
                          ),
                        ],
                      ),
                      detailShowing(
                        orderID: AppString.amount,
                        orderValue: (item['finalPrice'] ?? 0)
                            .toDouble()
                            .toStringAsFixed(2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
//Order Items End

//Total Price Start
Widget totalPricePointPop(item) {
  return showOrderDetailContainer(
    heddingValue: AppString.totalPrice,
    child: Column(
      children: [
        totalPricePoint(
          lable: AppString.subTotal,
          value: item['orderPrice'].toString(),
          fontFamily: 'FuturaCyrillic',
        ),
        totalPricePoint(
          lable: AppString.shipping,
          value: item['labourPrice'].toString(),
          fontFamily: 'FuturaCyrillic',
        ),
        totalPricePoint(
          lable: AppString.grandTotal,
          value: (item['finalPrice'] ?? 0).toDouble().toStringAsFixed(2),
          color: AppColor.primary,
          fontSize: Get.width * 0.042,
          fontFamily: 'FuturaCyrillic',
        ),
      ],
    ),
  );
}
//Total Price End
