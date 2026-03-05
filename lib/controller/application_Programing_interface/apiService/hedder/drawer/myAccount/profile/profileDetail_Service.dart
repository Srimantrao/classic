// ignore_for_file: avoid_print, implementation_imports

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/src/response.dart';

class ProfileDetailService {
  Future<Response<dynamic>> profileService() async {
    final Future<Response<dynamic>> response = ApiService.get(AppUrl.profile);
    print(AppUrl.profile);
    return response;
  }
}
