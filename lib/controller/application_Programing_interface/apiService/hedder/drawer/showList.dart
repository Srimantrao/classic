// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import '../../../../../view/utils/app_URL.dart';
import '../../../../../view/utils/widget/apiService.dart';

class ShowListService {
  Future<Response<dynamic>> showListData(){
    final Future<Response<dynamic>> response = ApiService.get(
      AppUrl.showList,
    );
    print(AppUrl.showList);
    return response;
  }
}