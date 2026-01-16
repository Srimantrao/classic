// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class YouMayLikeService {
  Future<Response<dynamic>> getYouMayLike({
    required String shape,
    required String carat,
    required String AppWeight,
    required String metalType,
    required String metalStamp,
  }) async {
    final Future<Response<dynamic>> responce = ApiService.post(
      url: AppUrl.youmayLike,
      data: {
        "shape": shape,
        "carat": carat,
        "AppWeight": AppWeight,
        "metalType": metalType,
        "metalStamp": metalStamp,
      },
    );
    print(AppUrl.youmayLike);
    return responce;
  }
}
