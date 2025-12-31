// ignore_for_file: file_names

import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../apiService/menu/home/homeCollctionAPIService.dart';

class HomeCollctionapiController extends GetxController {
  final homeCollctionApiService = Get.put(Homecollctionapiservice());
  var isLoading = false.obs;
  var homeCollectionData = {}.obs;
  
  Future<void> homeCollectionApi() async {
    isLoading.value = true;
    try {
      final response = await homeCollctionApiService.homecollctionApiService();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: homeCollectionData,
          callAPI: 'HomeCollection',
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'FilterSlider');
    } finally {
      isLoading.value = false;
    }
  }
}
