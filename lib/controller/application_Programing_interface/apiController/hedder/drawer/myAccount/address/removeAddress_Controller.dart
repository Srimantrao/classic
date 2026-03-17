// ignore_for_file: strict_top_level_inference

import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/address/removeAddressService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RemoveAddressController extends GetxController {
  final removeAddressService = RemoveAddresService();
  var isLoading = false.obs;
  var removeAddress = {}.obs;

  Future<void> removeAddressPost(id) async {
    try {
      isLoading(true);
      final response = await removeAddressService.removeAdress(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          callAPI: 'removeAddress',
          data: removeAddress,
          messages: true,
          showSnackbarSuccess: true,
        );
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'removeAddress',
        showSnackbar: true,
        showSnackbarErorr: true,
      );
    }
  }
}
