// ignore_for_file: avoid_print

import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/apiService.dart';
import 'package:dio/dio.dart';

class DiamondSearchService {
  Future<Response<dynamic>> diamondSearchService({
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
    required String pageSize,
    required String pageNumber,
  }) {
    final Map<String, dynamic> data = {
      if (shape != null && shape.isNotEmpty) 'shape': shape,
      if (carat != null && carat.isNotEmpty) 'carats': carat,
      if (clarity != null && clarity.isNotEmpty) 'clarity': clarity,
      if (color != null && color.isNotEmpty) 'color': color,
      if (lab != null && lab.isNotEmpty) 'lab': lab,
      if (polish != null && polish.isNotEmpty) 'polish': polish,
      if (symmetry != null && symmetry.isNotEmpty) 'symmetry': symmetry,
      if (availability != null && availability.isNotEmpty) 'available': availability,
      if (treatment != null && treatment.isNotEmpty) 'treatment': treatment,
      if (fluorescence != null && fluorescence.isNotEmpty) 'flo': fluorescence,
      if (eyeClean != null && eyeClean.isNotEmpty) 'eyeClean': eyeClean,
      if (shortcut != null && shortcut.isNotEmpty) 'shortcut': shortcut,
      if (sym != null && sym.isNotEmpty) 'sym': sym,
      if (location != null && location.isNotEmpty) 'location': location,
      if (stoneIdCertNo != null && stoneIdCertNo.isNotEmpty) 'stoneIdCertNo': stoneIdCertNo,
      if (length != null && length.isNotEmpty) 'length': length,
      if (width != null && width.isNotEmpty) 'width': width,
      if (depth != null && depth.isNotEmpty) 'depth': depth,
      if (table != null && table.isNotEmpty) 'table': table,
      if (crownHeight != null && crownHeight.isNotEmpty) 'crownHeight': crownHeight,
      if (crownAngle != null && crownAngle.isNotEmpty) 'crownAngle': crownAngle,
      if (pavilionDepth != null && pavilionDepth.isNotEmpty) 'pavilionDepth': pavilionDepth,
      if (pavilionAngle != null && pavilionAngle.isNotEmpty) 'pavilionAngle': pavilionAngle,
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
