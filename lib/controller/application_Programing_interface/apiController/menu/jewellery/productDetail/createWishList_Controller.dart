// ignore_for_file: non_constant_identifier_names

import 'package:classic/controller/application_Programing_interface/apiService/menu/jewellery/productDetail/createWishlistService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CreateWishlistController extends GetxController {
  final createWishlistService = Get.put(CreateWishlistService());
  var isLoading = false.obs;
  var createWishListData = {}.obs;

  Future<void> createWishlist({
    String? qty,
    String? price,
    String? ringSize,
    String? engravingText,
    String? sizeRemark,
    String? productId,
    String? DiamondId,
  }) async {
    try {
      isLoading(true);
      final response = await createWishlistService.addWishList(
        qty: qty,
        price: price,
        ringSize: ringSize,
        engravingText: engravingText,
        sizeRemark: sizeRemark,
        productId: productId,
        DiamondId: DiamondId,
      );
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'createWishlist',
          data: createWishListData,
          messages: true,
          showSnackbarSuccess: true,
        );
      }
    } on DioException catch (e) {
      errorMesssess(
        callAPI: 'createWishlist',
        e: e,
        showSnackbarMessages: true,
        showSnackbar: true,
      );
    } finally {
      isLoading(false);
    }
  }
}
