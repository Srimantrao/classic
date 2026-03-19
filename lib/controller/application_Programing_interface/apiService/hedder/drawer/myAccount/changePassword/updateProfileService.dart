// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class UpdateProfile {
  Future<Response<dynamic>> updateProfile({
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
    Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.changeAddress,
      data: {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobileno": mobileno,
        "code": code,
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
    print(AppUrl.changeAddress);
    return response;
  }
}
