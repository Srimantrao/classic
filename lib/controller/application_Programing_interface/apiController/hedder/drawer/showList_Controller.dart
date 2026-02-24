import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/showList.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ShowListController extends GetxController {
  final showList = ShowListService();
  var isLoading = false.obs;
  var showListData = {}.obs;

  Future<void> showListView() async {
    try {
      isLoading.value = true;
      final response = await showList.showListData();
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          callAPI: 'showListData',
          data: showListData,
        );
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'showListData',
        showSnackbar: true,
        showSnackbarMessages: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
