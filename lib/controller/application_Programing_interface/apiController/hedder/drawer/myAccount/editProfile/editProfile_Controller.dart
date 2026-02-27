import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/editProfile/editprofile_Service.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final editProfileService = Get.put(EditProfileService());
  final isLoading = false.obs;
  final editProfileData = {}.obs;

  Future<void> editProfile({
    String? firstName,
    String? lastName,
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
      isLoading(true);
      final response = await editProfileService.editProfileService(
        firstName: firstName,
        lastName: lastName,
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
      );
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: editProfileData,
          callAPI: 'editProfile',
        );
      }
    } on DioException catch (e) {
      errorMesssess(callAPI: 'editProfile', e: e);
    } finally {
      isLoading(false);
    }
  }
}
