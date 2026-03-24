import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CardRecordService {
  Future<Response<dynamic>> cardRecordService({
    String? pageSize,
    String? pageNumber,
    String? type,
  }) async {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.cartRecord,
      data: {"pageSize": pageSize, "pageNumber": pageNumber, "type": type},
    );
    if (kDebugMode) {
      print(AppUrl.cartRecord);
    }
    return response;
  }
}
