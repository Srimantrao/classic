// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class AddAddessService {
  Future<Response<dynamic>> addAdresspost({
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
    Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.addAddress,
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "address": address,
        "countryId": countryId,
        "state": state,
        "city": city,
        "code": code,
        "phone": phone,
        "customer": customer,
        "isDefault": isDefault,
        "faxNo" : faxNo,
      },
    );
    print(AppUrl.addAddress);
    return response;
  }
}
