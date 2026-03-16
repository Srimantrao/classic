// ignore_for_file: strict_top_level_inference

import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/address/getAddressService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetAddressController extends GetxController {
  final getAddressService = GetAddressService();
  var isLoading = false.obs;
  var gerAddress = {}.obs;

  Future<void> getAddress(id) async {
    try {
      isLoading(true);
      final response = await getAddressService.getAddress(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          callAPI: 'getAddress',
          data: gerAddress,
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'getAddress');
    } finally {
      isLoading(false);
    }
  }
}
