import 'package:classic/controller/application_Programing_interface/apiService/menu/dashbord/cardRecordService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CardRecordController extends GetxController {
  final cardRecord = CardRecordService();
  var isLoading = false.obs;
  var isPaginationLoading = false.obs;
  var cardRecordData = [].obs;
  var page = 1.obs;
  final int pageSize = 25;
  var hasMoreData = true.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchCardRecords(isFirstLoad: true);
  // }

  Future<void> fetchCardRecords({
    bool isFirstLoad = false,
    String? type,
  }) async {
    if (isFirstLoad) {
      page.value = 1;
      hasMoreData.value = true;
      isLoading.value = true;
    } else {
      if (!hasMoreData.value || isPaginationLoading.value) return;
      isPaginationLoading.value = true;
      page.value++;
    }
    try {
      final response = await cardRecord.cardRecordService(
        pageSize: pageSize.toString(),
        pageNumber: page.value.toString(),
        type: type,
      );
      if (response.statusCode == 200) {
        List newData = response.data['data'] ?? [];
        if (isFirstLoad) {
          cardRecordData.value = newData;
          if (newData.length < pageSize) {
            hasMoreData.value = false;
          }
          successMesssess(
            response: response,
            data: newData,
            callAPI: 'cardRecordData',
          );
        } else {
          cardRecordData.addAll(newData);
        }
        if (newData.length < pageSize) {
          hasMoreData.value = false;
        }
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'cardRecordData');
    } finally {
      isLoading.value = false;
      isPaginationLoading.value = false;
    }
  }
}
