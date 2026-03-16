// ignore_for_file: avoid_print

import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/customProduct/customProductDetail_Controller.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../orderHistory/orderHistoryExtraWidget/orderDetailExtraWidget.dart';
import '../../orderHistory/orderHistoryExtraWidget/orderHistroryExtraWidget.dart';
import '../../orderHistory/orderHistoryWidget/body/orderDetailWidget.dart';
import '../customProductWidget/body/customProductDetailWidget.dart';

class CustomShowDetailProduct extends StatelessWidget {
  final String id;
  final customProductDetail = Get.put(CustomProductDetailController());
  CustomShowDetailProduct({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    customProductDetail.customProductDetails(id);
    String formatDate(String date) {
      DateTime parsedDate = DateTime.parse(date);
      return DateFormat('dd/MMM/yy').format(parsedDate);
    }
    print("id :- $id");
    return Fullscreen(
      appBar: allOtherScreen(AppString.customProduct),
      body: horizontalPadding(
        child: Obx(() {
          final api = customProductDetail.customProductDetail;
          final apiLoading = customProductDetail.isLoading.value;
          if (apiLoading) {
            return shireemer();
          }
          final apidata = api['data'];
          if (apidata.isEmpty) {
            return Center(child: Lottie.asset(AppJson.noData));
          }
          return Column(
            children: [
              Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.02)),
              heddindDetail(
                orderid: apidata['OrderNo'].toString(),
                date: formatDate(apidata['updatedAt'].toString()),
              ),
              personalDetails(apidata),
              productDetails(apidata),
            ],
          );
        }),
      ),
    );
  }
}
