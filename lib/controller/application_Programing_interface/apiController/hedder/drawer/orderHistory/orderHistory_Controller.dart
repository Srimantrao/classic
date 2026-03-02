// ignore_for_file: avoid_print

import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/orderHistory/orderHistoryService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  final orderHistoryService = OrderHistoryService();
  var orderHistoryData = {}.obs;
  var isLoading = false.obs;

  Future<void> oderHistory() async {
    try {
      isLoading(true);
      final response = await orderHistoryService.profileService();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'OrderHistoryService',
          data: orderHistoryData,
        );
      }
    } on DioException catch (e) {
      errorMesssess(callAPI: 'OrderHistoryService', e: e);
    } finally {
      isLoading(false);
    }
  }
}
