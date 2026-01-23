// ignore_for_file: strict_top_level_inference

import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../apiService/hedder/cart/updateCartService.dart';

class UpdateCartController extends GetxController {
  final updateCartService = Get.put(UpdateCartService());
  var isLoading = false.obs;
  var updateCartData = {}.obs;

  Future<void> updateCart(
    id, {
     String? qty,
     String? price,
     String? ringSizeId,
  }) async {
    try {
      isLoading(true);
      final response = await updateCartService.updateCartService(
        id,
        qty: qty!,
        price: price!,
        ringSizeId: ringSizeId!,
      );
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: updateCartData,
          callAPI: 'updateCartData',
          messages: true,
          showSnackbarSuccess: true,
          showSnackbar: true,
        );
        // updateCartData(response.data);
      } else {
        throw Exception('Failed to update cart');
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'updateCartData');
    } finally {
      isLoading(false);
    }
  }
}
