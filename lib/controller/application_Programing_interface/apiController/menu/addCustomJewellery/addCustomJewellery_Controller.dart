// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../apiService/menu/addCustomJewellery/addCustomJewelleryService.dart';

class AddCustomJewelleryController extends GetxController {
  final addCustom = AddCustomJewelleryService();
  var isLoading = false.obs;
  var addCustomJewellery = {}.obs;

  Future<void> addCustomJewelleryInformation({
    required String Category,
    required String MediaType,
    String? filesORMediaUrl,
    required String metalType,
    required String metalStamp,
    required String AppxMetalWgt,
    String? Engraving,
    String? EngravingText,
    String? Size,
    required String Budget,
    String? diamond,
    required String FirstName,
    required String LastName,
    required String Email,
    required String Phone,
    String? ReferredBy,
  }) async {
    try {
      isLoading.value = true;
      final response = await addCustom.addCustomJewellery(
        Category: Category,
        MediaType: MediaType,
        metalType: metalType,
        metalStamp: metalStamp,
        AppxMetalWgt: AppxMetalWgt,
        Budget: Budget,
        FirstName: FirstName,
        LastName: LastName,
        Email: Email,
        Phone: Phone,
        ReferredBy: ReferredBy,
        filesORMediaUrl: filesORMediaUrl,
        diamond: diamond,
        Engraving: Engraving,
        EngravingText: EngravingText,
        Size: Size,
      );
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'addCustomJewellery',
          data: addCustomJewellery,
          messages: true,
          showSnackbarSuccess: true,
        );
      } else {
        print(response.statusCode);
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'recentViewData',
        showSnackbar: true,
        showSnackbarErorr: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
