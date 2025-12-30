// ignore_for_file: file_names
import 'package:classic/controller/application_Programing_interface/apiService/credentials/singUpApiService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SingUpApiController extends GetxController {
  final sinupService = SingUpApiService();
  var isLoading = false.obs;
  var sinupData = {}.obs;

  Future<void> singUpuser({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    String? mobileNo,
    String? businessType,
    String? howDidYouHearAboutUs,
    String? memberOf,
    String? companyName,
    String? countryId,
    String? state,
    String? city,
    String? code,
    String? zipCode,
    String? termCondition,
    String? address,
    String? subscribing,
    String? recaptcha,
  }) async {
    isLoading.value = true;
    try {
      final response = await sinupService.singUpService(
        firstName: firstName!,
        lastName: lastName!,
        email: email!,
        password: password!,
        confirmPassword: confirmPassword!,
        mobileNo: mobileNo!,
        businessType: businessType!,
        howDidYouHearAboutUs: howDidYouHearAboutUs!,
        memberOf: memberOf!,
        companyName: companyName!,
        countryId: countryId!,
        state: state!,
        city: city!,
        code: code!,
        zipCode: zipCode!,
        termCondition: termCondition!,
        address: address!,
        subscribing: subscribing!,
        recaptcha: recaptcha!,
      );
      successMesssess(
        response: response,
        data: sinupData,
        callAPI: 'SinUp',
        messages: true,
        showSnackbarMessages: true,
      );
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'SinUp', showSnackbarErorr: true);
    } finally {
      isLoading.value = false;
    }
  }
}
