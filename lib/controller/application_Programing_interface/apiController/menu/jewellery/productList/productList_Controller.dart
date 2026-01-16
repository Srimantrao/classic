// ignore_for_file: avoid_print, file_names

import 'package:classic/controller/application_Programing_interface/apiService/menu/jewellery/productList/productListService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

// class ProductlistController extends GetxController {
//   final productListService = ProductListService();
//   var isLoading = false.obs;
//   var productListData = {}.obs;
//
//   Future<void> productList({
//     required String categoryId,
//     String? subCategoryId,
//     String? metalType,
//     String? metalStamp,
//     String? shape,
//     String? settingType,
//     String? minPrice,
//     String? priceShort,
//     String? pageNumber,
//     String? pageSize,
//   }) async {
//     isLoading.value = true;
//     try {
//       final response = await productListService.productListService(
//         categoryId: categoryId,
//         subCategoryId: subCategoryId,
//         metalType: metalType,
//         metalStamp: metalStamp,
//         shape: shape,
//         settingType: settingType,
//         minPrice: minPrice,
//         priceShort: priceShort,
//         pageNumber: pageNumber,
//         pageSize: pageSize,
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         successMesssess(
//           response: response,
//           data: productListData,
//           callAPI: 'ProductList',
//         );
//       }
//     } on DioException catch (e) {
//       errorMesssess(e: e, callAPI: 'ProductList');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

class ProductlistController extends GetxController {
  final productListService = ProductListService();

  var isLoading = false.obs;
  var isLoadMore = false.obs;
  var hasMore = true.obs;

  var pageNumber = 1;
  final int pageSize = 10;

  var productListData = <dynamic>[].obs;

  var productListDatas = {}.obs;

  /// RESET & LOAD FIRST PAGE
  Future<void> fetchFirstPage({
    required String categoryId,
    String? subCategoryId,
    String? metalType,
    String? metalStamp,
    String? shape,
    String? settingType,
    String? minPrice,
    String? priceShort,
  }) async {
    pageNumber = 1;
    hasMore.value = true;
    productListData.clear();

    await _fetchProducts(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      metalType: metalType,
      metalStamp: metalStamp,
      shape: shape,
      settingType: settingType,
      minPrice: minPrice,
      priceShort: priceShort,
    );
  }

  /// LOAD NEXT PAGE
  Future<void> fetchNextPage({
    required String categoryId,
    String? subCategoryId,
    String? metalType,
    String? metalStamp,
    String? shape,
    String? settingType,
    String? minPrice,
    String? priceShort,
  }) async {
    if (!hasMore.value || isLoadMore.value) return;

    pageNumber++;
    await _fetchProducts(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      metalType: metalType,
      metalStamp: metalStamp,
      shape: shape,
      settingType: settingType,
      minPrice: minPrice,
      priceShort: priceShort,
      isPagination: true,
    );
  }

  /// COMMON API CALL
  Future<void> _fetchProducts({
    required String categoryId,
    String? subCategoryId,
    String? metalType,
    String? metalStamp,
    String? shape,
    String? settingType,
    String? minPrice,
    String? priceShort,
    bool isPagination = false,
  }) async {
    isPagination ? isLoadMore.value = true : isLoading.value = true;

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
        pageNumber: pageNumber.toString(),
        pageSize: pageSize.toString(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List data = response.data['data'] ?? [];

        if (data.length < pageSize) {
          hasMore.value = false;
        }

        productListData.addAll(data);
        print("✅ProductList Status: ${response.statusCode}");
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'ProductList');
    } finally {
      isLoading.value = false;
      isLoadMore.value = false;
    }
  }
}
