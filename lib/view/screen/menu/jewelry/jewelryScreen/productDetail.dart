// ignore_for_file: file_names, avoid_print, unnecessary_null_comparison, deprecated_member_use

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/youmayLike_Controller.dart';
import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productDetail.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productList_Controller.dart';
import '../../../../../controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import '../../../../utils/widget/bottomNavigationButton.dart';

class ProductDetail extends StatelessWidget {
  final productDetail = Get.put(ProductDetailUIController());
  final productDetailAPI = Get.put(ProductdetailController());
  final productListAPI = Get.put(ProductlistController(), permanent: true);
  final youMayLikeControllerAPI = Get.put(YoumaylikeController());
  final products = Lisofproduct();
  final String slug;
  final String categoryId;
  ProductDetail({super.key, required this.slug, required this.categoryId});
  @override
  Widget build(BuildContext context) {
    productDetailAPI.prductDetail(slug);
    T? getNestedValue<T>(Map<String, dynamic> map, List<dynamic> keys) {
      dynamic current = map;
      for (var key in keys) {
        if (current is Map && current.containsKey(key)) {
          current = current[key];
        } else if (current is List && key is int && key < current.length) {
          current = current[key];
        } else {
          return null;
        }
      }
      return current as T?;
    }
    final productData = productListAPI.productListData.isNotEmpty
        ? productListAPI.productListData[0]
        : <String, dynamic>{};
    youMayLikeControllerAPI.getYouMayLike(
      shape: getNestedValue<String>(productData, ['stoneDetails', 0, 'shape', '_id',]) ?? "",
      carat: getNestedValue<dynamic>(productData, ['totalWgt'])?.toString() ?? "",
      AppWeight: getNestedValue<dynamic>(productData, ['appxMetalWgt'])?.toString() ?? "",
      metalType: getNestedValue<String>(productData, ['metalType', 0, '_id']) ?? "",
      metalStamp: getNestedValue<String>(productData, ['metalStamp', 0, '_id']) ?? "",
    );
    return Fullscreen(
      appBar: allOtherScreen(AppString.productDetail, cart: true),
      bottomNavigationBar: Obx(() {
        final api = productDetailAPI;

        if (api.isLoading.value) {
          return SizedBox();
        }

        if (youMayLikeControllerAPI.isLoading.value) {
          return SizedBox();
        }

        return buttonNavigation(
          child: button(
            AppString.addtoCart,
            isLowercase: true,
            bottomBottonFontSize: true,
          ),
        );
      }),
      child: SingleChildScrollView(
        child: Obx(() {
          final api = productDetailAPI;

          if (api.isLoading.value) {
            return shimmerGrid();
          }

          if (youMayLikeControllerAPI.isLoading.value) {
            return shimmerGrid();
          }

          return productDetailList(
            productDetail,
            categoryId,
            youMayLikeControllerAPI,
          );
        }),
      ),
    );
  }
}

// youMayLikeControllerAPI.getYouMayLike(
//   shape: productListAPI.productListData[0]['stoneDetails'][0]['shape']['_id'].toString(),
//   carat: productListAPI.productListData[0]['totalWgt'].toString(),
//   AppWeight: productListAPI.productListData[0]['appxMetalWgt'].toString(),
//   metalType: productListAPI.productListData[0]['metalType'][0]['_id'],
//   metalStamp: productListAPI.productListData[0]['metalStamp'][0]['_id'],
// );
