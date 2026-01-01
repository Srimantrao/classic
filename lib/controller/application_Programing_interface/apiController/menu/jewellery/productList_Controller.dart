import 'package:classic/controller/application_Programing_interface/apiService/menu/jewellery/productListService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductlistController extends GetxController {
  final productListService = ProductListService();
  var isLoading = false.obs;
  var productListData = {}.obs;

  Future<void> productList({
    required String categoryId,
    String? subCategoryId,
    String? metalType,
    String? metalStamp,
    String? shape,
    String? settingType,
    String? minPrice,
    String? priceShort,
    String? pageNumber,
    String? pageSize,
  }) async {
    isLoading.value = true;
    try {
      final response = await productListService.productListService(
        categoryId: categoryId,
        subCategoryId: subCategoryId,
        metalType: metalType,
        metalStamp: metalStamp,
        shape: shape,
        settingType: settingType,
        minPrice: minPrice,
        priceShort: priceShort,
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          data: productListData,
          callAPI: 'ProductList',
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'ProductList');
    } finally {
      isLoading.value = false;
    }
  }
}
