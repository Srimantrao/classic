import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/holdDiamond/holdDiamondService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HoldDiamondController extends GetxController {
  final holdDiamond = HoldDiamondService();
  var isLoading = false.obs;
  var getHoldDimaondData = {}.obs;

  Future<void> getHoldDimaond() async {
    try {
      isLoading.value = true;
      final response = await holdDiamond.holdDimaond();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: getHoldDimaondData,
          callAPI: 'getHoldDimaondData',
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'getHoldDimaondData');
    } finally {
      isLoading.value = false;
    }
  }
}
