// ignore_for_file: file_names

import 'dart:developer';

import 'package:classic/controller/application_Programing_interface/apiService/menu/jewellery/categoryService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final categoryService = Categoryservice();
  var isLoading = false.obs;
  var catagoryData = {}.obs;

  Future<void> getCategory() async {
    isLoading(true);
    try {
      final response = await categoryService.categorySerivce();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: catagoryData,
          callAPI: 'Catagory',
        );
        log(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'FilterSlider');
    } finally {
      isLoading(false);
    }
  }
}
