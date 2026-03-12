import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/holdDiamond/removeholdDiamondService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RemoveDiamondController extends GetxController {
  final removeHDiamond = RemoveHDiamondService();
  var iaLoading = false.obs;
  var removeDiamondData = {}.obs;

  Future<void> removeDiamond(String id) async {
    try {
      iaLoading(true);
      final response = await removeHDiamond.removeHDiamond(id);
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'removeDiamondData',
          data: removeDiamondData,
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'removeDiamondData');
    } finally {
      iaLoading(false);
    }
  }
}
