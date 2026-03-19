import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/changePassword/updateProfileService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  final updateProfileService = UpdateProfile();
  var isLoading = false.obs;
  var updateProfile = {}.obs;

  Future<void> updateProfilePost({
    required String id,
    String? firstname,
    String? lastname,
    String? email,
    String? mobileno,
    String? code,
    String? businessType,
    String? companyName,
    String? countryId,
    String? city,
    String? state,
    String? address,
    String? memberOf,
    String? howDidYouHearAboutUs,
    String? currentPassword,
    String? newPassword,
    String? passwordChange,
  }) async {
    try {
      isLoading.value = true;
      final response = await updateProfileService.updateProfile(
        firstname: firstname,
        lastname: lastname,
        email: email,
        mobileno: mobileno,
        code: code,
        businessType: businessType,
        companyName: companyName,
        countryId: countryId,
        city: city,
        state: state,
        address: address,
        memberOf: memberOf,
        howDidYouHearAboutUs: howDidYouHearAboutUs,
        currentPassword: currentPassword,
        newPassword: newPassword,
        passwordChange: passwordChange,
        id: id,
      );
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: updateProfile,
          messages: true,
          showSnackbarSuccess: true,
          callAPI: 'updateProfile',
        );
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'updateProfile',
        showSnackbar: true,
        showSnackbarErorr: true,
      );
    }
  }
}
