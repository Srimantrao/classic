// ignore_for_file: avoid_print, file_names, implementation_imports

import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/src/response.dart';
import '../../../../../view/utils/app_URL.dart';

class FilterService {
  Future<Response<dynamic>> filterAPI() {
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.getProductFilterList,
    );
    print(AppUrl.getProductFilterList);
    return response;
  }
}
