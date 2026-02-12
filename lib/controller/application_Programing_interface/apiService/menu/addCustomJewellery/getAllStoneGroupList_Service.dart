import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class StoneGroupListService {
  Future<Response<dynamic>> getAllStoneGroupListService({
    bool? isGem,
    String? shape,
    String? color,
    String? clarity,
  }) {
    Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.getAllStoneGroupList,
      data: {
        "isGem": isGem,
        "shape": shape,
        "color": color,
        "clarity": clarity,
      },
    );
    return response;
  }
}
