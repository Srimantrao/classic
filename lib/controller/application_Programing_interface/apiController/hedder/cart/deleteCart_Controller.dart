// ignore_for_file: strict_top_level_inference

import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../apiService/hedder/cart/deleteCartServie.dart';

class DeleteCartController extends GetxController {
  final deleteCartService = Get.put(DeleteCartService());
  var isLoading = false.obs;
  var deleteCartData = {}.obs;

  Future<void> deleteCart(id) async {
    try {
      isLoading(true);
      final response = await deleteCartService.deleteCartService(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          data: deleteCartData,
          callAPI: 'deleteCartData',
          messages: true,
          showSnackbarSuccess: true,
          showSnackbar: true,
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'deleteCartData');
    } finally {
      isLoading(false);
    }
  }
}
