// ignore_for_file: avoid_print, invalid_use_of_protected_member

import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../apiService/menu/addCustomJewellery/getAllStoneGroupList_Service.dart';

class GetAllStoneGroupListController extends GetxController {
  final stoneGroupListService = StoneGroupListService();
  final isLoading = false.obs;
  final getAllStoneGroupList = {}.obs;

  Future<void> getAllStoneGroupListService() async {
    try {
      isLoading.value = true;
      final response = await stoneGroupListService
          .getAllStoneGroupListService();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'getAllStoneGroupList',
          data: getAllStoneGroupList,
        );
        print('getAllStoneGroupList: ${getAllStoneGroupList.value}');
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'getAllStoneGroupList');
    } finally {
      isLoading.value = false;
    }
  }
}
