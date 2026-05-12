// ignore_for_file: avoid_print

import 'package:classic/controller/application_Programing_interface/apiService/banner/bannerService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final bannerUrl = Get.put(BannerService());
  var isLoading = false.obs;
  var bannerData = {}.obs;

  Future<void> banner() async {
    try {
      isLoading.value = true;
      final response = await bannerUrl.bannerServive();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'bannerData',
          data: bannerData,
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'bannerData');
    } finally {
      isLoading.value = false;
    }
  }
}
