// ignore_for_file: avoid_print

import 'package:classic/controller/application_Programing_interface/apiService/menu/jewellery/productDetail/createCartService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CreateCartController extends GetxController {
  final createCartService = CreateCartService();
  var isLoading = false.obs;
  var crateCardData = {}.obs;

  Future<void> createCart({
    String? qty,
    required String price,
    String? ringSize,
    String? engravingText,
    String? sizeRemark,
    required String productId,
    String? DiamondId,
  }) async {
    isLoading.value = true;
    try {
      final response = await createCartService.createCart(
        qty: qty,
        price: price,
        ringSize: ringSize,
        engravingText: engravingText,
        sizeRemark: sizeRemark,
        productId: productId,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          data: crateCardData,
          callAPI: 'crateCardData',
          showSnackbar: true,
          messages: true,
          showSnackbarSuccess: true,
        );
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'crateCardData',
        showSnackbar: true,
        showSnackbarMessages: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
