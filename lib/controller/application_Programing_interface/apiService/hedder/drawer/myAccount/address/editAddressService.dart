// ignore_for_file: avoid_print, strict_top_level_inference

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class EditAddresService {
  Future<Response<dynamic>> editAddress(
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
    Future<Response<dynamic>> response = ApiService.post(
      url: "${AppUrl.editAddress}/$id",
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
        "faxNo": faxNo,
      },
    );
    print("${AppUrl.editAddress}/$id");
    return response;
  }
}
