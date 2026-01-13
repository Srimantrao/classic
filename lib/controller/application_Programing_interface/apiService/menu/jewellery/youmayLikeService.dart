// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class YouMayLikeService {
  Future<Response<dynamic>> getYouMayLike() async {
    final Future<Response<dynamic>> responce = ApiService.post(
      url: AppUrl.youmayLike,
    );
    print(AppUrl.youmayLike);
    return responce;
  }
}
