import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/customProduct/customProductService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CustomProductController extends GetxController {
  final customProduct = CustomProductService();
  var isLoading = false.obs;
  var customProductData = {}.obs;

  Future<void> getCustomProduct() async {
    try {
      isLoading.value = true;
      final response = await customProduct.customProduct();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: customProductData,
          callAPI: 'customProduct',
        );
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'customProduct');
    } finally {
      isLoading.value = true;
    }
  }
}
