// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:classic/controller/application_Programing_interface/apiService/menu/jewellery/youmayLikeService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class YoumaylikeController extends GetxController {
  final youmaylikeService = YouMayLikeService();

  final isLoading = false.obs;
  final youmaylikeData = {}.obs;

  Future<void> getYouMayLike({
    required String shape,
    required String carat,
    required String AppWeight,
    required String metalType,
    required String metalStamp,
  }) async {
    isLoading.value = true;
    try {
      final response = await youmaylikeService.getYouMayLike(
        shape: shape,
        carat: carat,
        AppWeight: AppWeight,
        metalType: metalType,
        metalStamp: metalStamp,
      );
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: youmaylikeData,
          callAPI: 'YouMayLike',
        );
        isLoading.value = false;
      } else {
        isLoading.value = false;
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      isLoading.value = false;
      if (e is DioError) {
        if (e.response != null) {
          throw Exception(e.response!.data['message']);
        } else {
          throw Exception('No internet connection');
        }
      }
    }
  }
}
