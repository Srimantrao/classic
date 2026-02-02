// ignore_for_file: strict_top_level_inference

import 'package:classic/controller/application_Programing_interface/apiService/menu/diamondSearch/diamondShowService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DiamondShowController extends GetxController {
  final diamondShow = DiamondShowService();
  var isLoading = false.obs;
  var diamondSearchData = {}.obs;

  Future<void> diamondShowData(id) async {
    try {
      isLoading.value = true;
      final response = await diamondShow.diamondShow(id);
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'diamondShow',
          data: diamondSearchData,
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'diamondShow');
    } finally {
      isLoading.value = false;
    }
  }
}
