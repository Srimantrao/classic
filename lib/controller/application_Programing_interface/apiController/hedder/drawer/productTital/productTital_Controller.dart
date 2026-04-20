import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/productTital/productTitalService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductTitalController extends GetxController {
  final getMetal = GetMetalService();
  var isLoading = false.obs;
  var getMetalName = {}.obs;

  Future<void> geMetalNameFun() async {
    try {
      isLoading.value = true;
      final response = await getMetal.getMetal();
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          data: getMetalName,
          callAPI: 'getMetalName',
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'getMetalName');
    } finally {
      isLoading.value = false;
    }
  }
}
