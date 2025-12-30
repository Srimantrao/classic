// ignore_for_file: avoid_print, file_names

import 'package:dio/dio.dart';
import '../../../../view/utils/app_URL.dart';
import '../../../../view/utils/widget/apiService.dart';

class CountryService {
  Future<Response<dynamic>> countryService() {
    final Future<Response<dynamic>> response = ApiService.get(AppUrl.country);
    print(AppUrl.country);
    return response;
  }
}
