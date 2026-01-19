// ignore_for_file: avoid_print

import 'package:classic/controller/application_Programing_interface/apiService/menu/jewellery/productDetail/productSizeService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BraceletPriceController extends GetxController {
  final braceletPriceService = BraceletPrice();
  var isLoadind = false.obs;
  var braceletPrice = {}.obs;

  Future<void> braceletPriceAPI({
    required String productId,
    required String sizeId,
  }) async {
    isLoadind.value = true;
    try {
      final response = await braceletPriceService.productDetailService(
        productId: productId,
        sizeId: sizeId,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          data: braceletPrice,
          callAPI: 'braceletPrice',
        );
      }
    } on DioException catch (e) {
      print("braceletPrice Error :-  $e");
    } finally {
      isLoadind.value = false;
    }
  }
}

class RingsSizeController extends GetxController {
  final ringsPriceService = RindsPrice();
  var isLoading = false.obs;
  var ringsPrice = {}.obs;

  Future<void> ringsPriceAPI({
    required String productId,
    required String sizeId,
  }) async {
    isLoading.value = true;
    try {
      final response = await ringsPriceService.ringsDetailService(
        productId: productId,
        sizeId: sizeId,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          data: ringsPrice,
          callAPI: 'ringsPrice',
        );
      }
    } on DioException catch (e) {
      print("ringsPrice Error :-  $e");
    } finally {
      isLoading.value = false;
    }
  }
}
