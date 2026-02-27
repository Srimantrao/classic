// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class EditProfileService {
  Future<Response<dynamic>> editProfileService({
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
  }) {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.editProfile,
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "mobileNo": mobileno,
        "code": code,
        "businessType": businessType,
        "companyName": companyName,
        "countryId": countryId,
        "city": city,
        "state": state,
        "address": address,
        "memberOf": memberOf,
        "howDidYouHearAboutUs": howDidYouHearAboutUs,
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "passwordChange": passwordChange,
      },
    );
    print(AppUrl.editProfile);
    return response;
  }
}
