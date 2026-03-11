import 'package:classic/controller/application_Programing_interface/apiService/menu/diamondSearch/diamondholdService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DiamondHoldController extends GetxController {
  final holdDiamondService = DiamondHoldService();
  var isLoading = false.obs;
  var diamondDataHold = {}.obs;

  Future<void> holdDiamond({required String ids}) async {
    try {
      isLoading(true);
      final response = await holdDiamondService.holdDiamond(ids: ids);
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'diamondDataHold',
          data: diamondDataHold,
          messages: true,
          showSnackbarMessages: true,
        );
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'diamondDataHold',
        showSnackbar: true,
        showSnackbarMessages: true,
      );
    } finally {
      isLoading(false);
    }
  }
}
