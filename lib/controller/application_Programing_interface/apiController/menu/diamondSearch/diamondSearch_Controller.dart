import 'package:classic/controller/application_Programing_interface/apiService/menu/diamondSearch/diamondSearchService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DiamondSearchController extends GetxController {
  final diamondSearch = DiamondSearchService();
  var isLoading = false.obs;
  var diamondSearchData = {}.obs;

  Future<void> diamondSearching({
    required String pageSize,
    required String pageNumber,
    List<dynamic>? shape,
    List<dynamic>? carat,
    List<dynamic>? clarity,
    List<dynamic>? color,
    List<dynamic>? lab,
    List<dynamic>? polish,
    List<dynamic>? symmetry,
    List<dynamic>? availability,
    List<dynamic>? treatment,
    List<dynamic>? fluorescence,
    List<dynamic>? eyeClean,
    List<dynamic>? shortcut,
    List<dynamic>? sym,
    List<dynamic>? location,
    List<dynamic>? stoneIdCertNo,
  }) async {
    isLoading.value = true;
    try {
      final response = await diamondSearch.diamondSearchService(
        pageSize: '1',
        pageNumber: '20',
        shape: shape,
        carat: carat,
        clarity: clarity,
        color: color,
        lab: lab,
        polish: polish,
        symmetry: symmetry,
        availability: availability,
        treatment: treatment,
        fluorescence: fluorescence,
        eyeClean: eyeClean,
        shortcut: shortcut,
        sym: sym,
        location: location,
        stoneIdCertNo: stoneIdCertNo,
      );
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'diamondSearchService',
          data: diamondSearchData,
        );
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}');
        }
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'diamondSearchService');
    } finally {
      isLoading.value = false;
    }
  }
}
