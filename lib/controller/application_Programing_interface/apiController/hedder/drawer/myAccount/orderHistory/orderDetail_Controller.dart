// ignore_for_file: strict_top_level_inference

import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/orderHistory/orderDetail_Service.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  var orderDetail = OrderDetailService();
  var isLoading = false.obs;
  var orderDetailData = {}.obs;

  Future<void> getOrderDetail(id) async {
    try {
      isLoading(true);
      var response = await orderDetail.orderDetailService(id);
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: orderDetailData,
          callAPI: 'OrderDetailData',
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'getOrderDetail');
    } finally {
      isLoading(false);
    }
  }
}
