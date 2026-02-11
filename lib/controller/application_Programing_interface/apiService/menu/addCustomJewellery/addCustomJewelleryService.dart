// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:dio/dio.dart';
import '../../../../../view/utils/app_URL.dart';
import '../../../../../view/utils/widget/apiService.dart';

class AddCustomJewelleryService {
  Future<Response<dynamic>> addCustomJewellery({
    required String Category,
    required String MediaType,
    String? filesORMediaUrl,
    required String metalType,
    required String metalStamp,
    required String AppxMetalWgt,
    String? Engraving,
    String? EngravingText,
    String? Size,
    required String Budget,
    String? diamond,
    required String FirstName,
    required String LastName,
    required String Email,
    required String Phone,
    String? ReferredBy,
  }) {
    Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.addCustomJewellery,
      data: {
        "Category": Category,
        "MediaType": MediaType,
        "files OR MediaUrl": filesORMediaUrl,
        "metalType": metalType,
        "metalStamp": metalStamp,
        "AppxMetalWgt": AppxMetalWgt,
        "Engraving": Engraving,
        "EngravingText": EngravingText,
        "Size": Size,
        "Budget": Budget,
        "diamond": diamond,
        "FirstName": FirstName,
        "LastName": LastName,
        "Email": Email,
        "Phone": Phone,
        "ReferredBy": ReferredBy,
      }
    );
    print(AppUrl.addCustomJewellery);
    return response;
  }
}
