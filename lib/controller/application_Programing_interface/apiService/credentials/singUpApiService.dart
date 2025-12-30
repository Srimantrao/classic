// ignore_for_file: file_names, avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class SingUpApiService {
  Future<Response<dynamic>> singUpService({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? confirmPassword,
    required String mobileNo,
    required String businessType,
    required String howDidYouHearAboutUs,
    required String memberOf,
    required String companyName,
    required String countryId,
    required String state,
    required String city,
    required String code,
    required String zipCode,
    required String termCondition,
    required String address,
    required String subscribing,
    required String recaptcha,
  }) {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.signup,
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "mobileNo": mobileNo,
        "businessType": businessType,
        "howDidYouHearAboutUs": howDidYouHearAboutUs,
        "memberOf": memberOf,
        "companyName": companyName,
        "countryId": countryId,
        "state": state,
        "city": city,
        "code": code,
        "zipCode": zipCode,
        "termCondition": termCondition,
        "address": address,
        "subscribing": subscribing,
        "recaptcha": recaptcha,
      },
    );
    print(AppUrl.signup);
    return response;
  }
}
