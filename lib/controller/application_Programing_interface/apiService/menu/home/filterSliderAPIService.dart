// ignore_for_file: avoid_print, implementation_imports, file_names

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/src/response.dart';

class FiltersilderService {
  Future<Response<dynamic>> filtersilder() {
    final Future<Response<dynamic>> response = ApiService.get(
      AppUrl.filterSlider,
    );
    print(AppUrl.filterSlider);
    return response;
  }
}
