import 'package:classic/controller/application_Programing_interface/apiService/menu/dashbord/totalRecordService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TotalRecordedController extends GetxController {
  final totalRecordService = TotalRecordService();
  var isLoading = false.obs;
  var totalRecordData = {}.obs;

  Future<void> totalRecord() async {
    try {
      isLoading(true);
      final response = await totalRecordService.totalRecordService();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: totalRecordData,
          callAPI: 'totalRecordData',
        );
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'totalRecordData');
    } finally {
      isLoading(false);
    }
  }
}
