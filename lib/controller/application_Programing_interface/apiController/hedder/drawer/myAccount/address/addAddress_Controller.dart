import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/address/addAddressService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AddaddressController extends GetxController {
  final addAddressService = AddAddessService();
  var isLoading = false.obs;
  var addAddress = {}.obs;

  Future<void> addAddressPost({
    required String firstName,
    required String lastName,
    required String email,
    required String address,
    required String countryId,
    required String state,
    required String city,
    required String code,
    required String phone,
    required String customer,
    required bool isDefault,
    required String faxNo,
  }) async {
    try {
      isLoading(true);
      final response = await addAddressService.addAdresspost(
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
        isDefault: isDefault,
        faxNo: faxNo,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          callAPI: 'addAddress',
          data: addAddress,
          messages: true,
          showSnackbarSuccess: true,
        );
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'addAddress',
        showSnackbar: true,
        showSnackbarErorr: true,
      );
    } finally {
      isLoading(false);
    }
  }
}
