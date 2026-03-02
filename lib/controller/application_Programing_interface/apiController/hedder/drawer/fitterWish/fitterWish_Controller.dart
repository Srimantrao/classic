import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/fitterWish/fitterWishService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FitterWishController extends GetxController {
  final fitterWish = FitterWishService();
  var fitterWishData = {}.obs;
  var isLoading = false.obs;

  Future<void> fitterWishService() async {
    try {
      isLoading(true);
      final response = await fitterWish.fitterWish();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'FitterWishService',
          data: fitterWishData,
        );
      }
    } on DioException catch (e) {
      errorMesssess(callAPI: 'FitterWishService', e: e);
    } finally {
      isLoading(false);
    }
  }
}
