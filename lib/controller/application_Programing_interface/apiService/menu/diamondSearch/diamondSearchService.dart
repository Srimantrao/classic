// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class DiamondSearchService {
  Future<Response<dynamic>> diamondSearchService({
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
    required String pageSize,
    required String pageNumber,
  }) {
    final Map<String, dynamic> data = {
      'shape': shape,
      'carats': carat,
      'clarity': clarity,
      'color': color,
      'lab': lab,
      'polish': polish,
      'symmetry': symmetry,
      'available': availability,
      'treatment': treatment,
      'flo': fluorescence,
      'eyeClean': eyeClean,
      'shortcut': shortcut,
      'sym': sym,
      'location': location,
      'stoneIdCertNo': stoneIdCertNo,
      'pageSize': pageSize,
      'pageNumber': pageNumber,
    };
    data.removeWhere(
      (key, value) => value == null || (value is List && value.isEmpty),
    );
    final Future<Response<dynamic>> response = ApiService.post(
      url: AppUrl.filterDiamond,
      data: data,
    );
    print(AppUrl.filterDiamond);
    return response;
  }
}
