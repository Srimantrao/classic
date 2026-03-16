// ignore_for_file: strict_top_level_inference

import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/customProduct/customProductDetailService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CustomProductDetailController extends GetxController {
  final customProductDetailService = CustomProductDetailService();
  var isLoading = false.obs;
  var customProductDetail = {}.obs;

  Future<void> customProductDetails(id) async {
    try {
      isLoading(true);
      final response = await customProductDetailService.customProductDetail(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          callAPI: 'customProductDetail',
          data: customProductDetail,
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'customProductDetail');
    } finally {
      isLoading(false);
    }
  }
}
