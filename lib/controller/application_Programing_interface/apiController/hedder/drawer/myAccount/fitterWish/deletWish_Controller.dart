// ignore_for_file: invalid_use_of_protected_member, strict_top_level_inference

import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/fitterWish/deletWishService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DeletWishController extends GetxController {
  final deletWishService = DeletWishService();
  var isLoading = false.obs;
  var deletWishData = {}.obs;

  Future<void> deleWishList(id) async {
    try {
      isLoading(true);
      final response = await deletWishService.deleWishList(id);
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          messages: true,
          showSnackbarSuccess: true,
          data: deletWishData.value,
          callAPI: 'deletWishData',
        );
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'deletWishData',
        showSnackbar: true,
        showSnackbarErorr: true,
      );
    } finally {
      isLoading(false);
    }
  }
}
