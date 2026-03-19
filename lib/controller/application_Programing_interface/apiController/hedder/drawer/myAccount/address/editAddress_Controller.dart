// ignore_for_file: strict_top_level_inference

import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/address/editAddressService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class EditAddressController extends GetxController {
  final editAddressService = EditAddresService();
  var isLoading = false.obs;
  var editAddress = {}.obs;

  Future<void> editAddressPost(
    id, {
    String? firstName,
    String? lastName,
    String? email,
    String? address,
    String? countryId,
    String? state,
    String? city,
    String? code,
    String? phone,
    String? customer,
    bool? isDefault,
    String? faxNo,
  }) async {
    try {
      isLoading(true);
      final response = await editAddressService.editAddress(
        id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        address: address,
        countryId: countryId,
        state: state,
        city: city,
        code: code,
        phone: phone,
        customer: customer,
        isDefault: false,
        faxNo: faxNo,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          callAPI: 'editAddress',
          data: editAddress,
          messages: true,
          showSnackbarSuccess: true,
        );
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'editAddress',
        showSnackbar: true,
        showSnackbarErorr: true,
      );
    } finally {
      isLoading(false);
    }
  }
}
