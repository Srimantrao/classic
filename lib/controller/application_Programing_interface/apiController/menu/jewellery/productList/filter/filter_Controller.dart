
// ignore_for_file: file_names

import 'package:classic/controller/application_Programing_interface/apiService/menu/jewellery/productList/filter/filterService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  final filter = FilterService();
  var isLoading = false.obs;
  var filterData = {}.obs;

  Future<void> filterAPI() async {
    isLoading.value = true;
    try {
      final response = await filter.filterAPI();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: filterData,
          callAPI: 'Filter',
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'FilterSlider');
    } finally {
      isLoading.value = false;
    }
  }
}
