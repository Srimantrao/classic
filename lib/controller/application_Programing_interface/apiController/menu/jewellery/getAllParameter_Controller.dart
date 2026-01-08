import 'package:classic/controller/application_Programing_interface/apiService/menu/jewellery/getAllParameterService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetallparameterController extends GetxController{
  final getAllParameter = GetAllParameterServices();
  var isLoading = false.obs;
  var getAllParameterData = {}.obs;

  Future<void> getAllParameterAPI() async {
    isLoading.value = true;

    try {
      final response = await getAllParameter.getAllParameter();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: getAllParameterData,
          callAPI: 'getAllParameter',
        );
      }
    } on DioException catch(e){
      errorMesssess(e: e, callAPI: 'getAllParameter');
    }
    finally{
      isLoading.value = false;
    }
  }
}