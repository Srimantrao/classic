// ignore_for_file: strict_top_level_inference

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DiamondShowService {
  Future<Response<dynamic>> diamondShow(id) {
    final Future<Response<dynamic>> response = ApiService.get(
      '${AppUrl.diamondDetails}/$id',
    );
    if (kDebugMode) {
      print('${AppUrl.diamondDetails}/$id');
    }
    return response;
  }
}
