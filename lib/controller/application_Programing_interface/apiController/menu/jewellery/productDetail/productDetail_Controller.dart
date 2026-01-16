// ignore_for_file: strict_top_level_inference

import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../apiService/menu/jewellery/productDetail/productDetailService.dart';

class ProductdetailController extends GetxController {
  final productService = ProductDetailService();
  var isLoading = false.obs;
  var prdoctdetailData = {}.obs;

  Future<void> prductDetail(slug) async {
    isLoading.value = true;
    try {
      final response = await productService.productDetailService(slug);
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: prdoctdetailData,
          callAPI: 'productDetail',
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'productDetail');
    }finally{
      isLoading.value = false;
    }
  }
}
