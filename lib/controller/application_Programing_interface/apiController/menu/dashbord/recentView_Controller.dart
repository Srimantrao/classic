import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../apiService/menu/dashbord/recentViewService.dart';

class RecentViewController extends GetxController {
  final recentView = RecentViewService();
  var isLoading = false.obs;
  var recentViewData = {}.obs;

  Future<void> recentViewdata() async {
    isLoading.value = true;

    try {
      final response = await recentView.recentView();
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          data: recentViewData,
          callAPI: 'recentViewData',
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'recentViewData');
    } finally {
      isLoading.value = false;
    }
  }
}
