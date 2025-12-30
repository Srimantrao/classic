// ignore_for_file: file_names

import 'package:classic/controller/application_Programing_interface/apiService/menu/home/filterSliderAPIService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FilterSliderController extends GetxController {
  final filterSliderService = Get.put(FiltersilderService());
  var isLoading = false.obs;
  var filterSliderData = {}.obs;

  @override
  void onInit() {
    filterSlider();
    super.onInit();
  }

  Future<void> filterSlider() async {
    isLoading.value = true;
    try {
      final response = await filterSliderService.filtersilder();
      successMesssess(
        response: response,
        data: filterSliderData,
        callAPI: 'FilterSlider',
      );
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'FilterSlider');
    } finally {
      isLoading.value = false;
    }
  }
}
