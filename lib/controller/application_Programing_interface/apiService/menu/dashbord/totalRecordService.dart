import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class TotalRecordService {
  Future<Response<dynamic>> totalRecordService() {
    final Future<Response<dynamic>> response = ApiService.get(
      AppUrl.totalRecord,
    );
    if (kDebugMode) {
      print(AppUrl.totalRecord);
    }
    return response;
  }
}
