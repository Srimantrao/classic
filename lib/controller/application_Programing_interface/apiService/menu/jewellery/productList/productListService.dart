// ignore_for_file: avoid_print, file_names

import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';
import '../../../../../../view/utils/app_URL.dart';

class ProductListService {
  Future<Response<dynamic>> productListService({
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
    final Future<Response<dynamic>> responce = ApiService.post(
      url: AppUrl.productList,
      data: {
        "categoryId": categoryId,
        "subCategoryId": subCategoryId,
        "metalType": metalType,
        "metalStamp": metalStamp,
        "shape": shape,
        "settingType": settingType,
        "minPrice": minPrice,
        "priceShort": priceShort,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
      },
    );
    print(AppUrl.productList);
    return responce;
  }
}
