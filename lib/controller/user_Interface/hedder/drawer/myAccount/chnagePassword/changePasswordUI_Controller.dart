import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/changePassword/updateProfile_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/profile/profileDetail_Controller.dart';
import 'package:classic/controller/user_Interface/credentials/loginUI_Controller.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/pop.dart';
import 'package:get/get.dart';

class ChangePasswordUiController extends GetxController {
  final updateProfile = Get.put(UpdateProfileController());
  final profileDetail = Get.put(ProfileDetailController());
  final loginUI = Get.put(LoginuiController());

  void changePassword({
    String? currentPassword,
    String? newPassword,
    String? passwordChange,
  }) {
    final profile = profileDetail.profileDetailData;
    final profileData = profile['data'];
    if (currentPassword!.isEmpty ||
        newPassword!.isEmpty ||
        passwordChange!.isEmpty) {
      ToastificationError.Error(AppString.changeError);
      return;
    }
    if (currentPassword == newPassword) {
      ToastificationError.Error(AppString.changeErrorDifferentd);
      return;
    }
    if (newPassword != passwordChange) {
      ToastificationError.Error(AppString.changeErrorMatch);
      return;
    }
    updateProfile.updateProfilePost(
      id: profileData['_id'] ?? '',
      firstname: profileData['firstName'],
      lastname: profileData['lastName'] ?? '',
      email: profileData['email'],
      mobileno: profileData['mobileno'] ?? '',
      code: profileData['code'],
      businessType: profileData['businessType'] ?? '',
      companyName: profileData['companyName'] ?? '',
      countryId: profileData['countryId'] ?? '',
      city: profileData['city'] ?? '',
      state: profileData['state'] ?? '',
      address: profileData['address'] ?? '',
      memberOf: profileData['memberOf'] ?? '',
      howDidYouHearAboutUs: profileData['howDidYouHearAboutUs'] ?? '',
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordChange: passwordChange,
    );
  }
}
