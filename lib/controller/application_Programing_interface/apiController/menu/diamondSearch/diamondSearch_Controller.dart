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
    String? shape,
    String? carat,
    String? clarity,
    String? color,
    String? lab,
    String? polish,
    String? symmetry,
    String? availability,
    String? treatment,
    String? fluorescence,
    String? eyeClean,
    String? shortcut,
    String? sym,
    String? location,
    String? stoneIdCertNo,
    String? length,
    String? width,
    String? depth,
    String? table,
    String? crownHeight,
    String? crownAngle,
    String? pavilionDepth,
    String? pavilionAngle,
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
        length: length,
        width: width,
        depth: depth,
        table: table,
        crownHeight: crownHeight,
        crownAngle: crownAngle,
        pavilionDepth: pavilionDepth,
        pavilionAngle: pavilionAngle,
      );
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          callAPI: 'diamondSearch',
          data: diamondSearchData,
          messages: true,
          showSnackbarSuccess: true,
        );
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}');
        }
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'diamondSearch',
        showSnackbarErorr: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
