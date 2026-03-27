// ignore_for_file: file_names, avoid_print, unnecessary_null_comparison, deprecated_member_use

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/productDetail_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/youmayLike_Controller.dart';
import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productDetail.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productList/productList_Controller.dart';
import '../../../../../controller/application_Programing_interface/callApi/callAPI.dart';
import '../../../../../controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import '../../../../utils/app_cricularProgrssIndicator.dart';
import '../../../../utils/widget/bottomNavigationButton.dart';

class ProductDetail extends StatelessWidget {
  final productDetail = Get.put(ProductDetailUIController());
  final productDetailAPI = Get.put(ProductdetailController());
  final cartAPICallAPI = Get.put(CartAPICall());
  final productListAPI = Get.put(ProductlistController(), permanent: true);
  final youMayLikeControllerAPI = Get.put(YoumaylikeController());
  final products = Lisofproduct();
  final String slug;
  final String categoryId;
  ProductDetail({super.key, required this.slug, required this.categoryId});
  @override
  Widget build(BuildContext context) {
    productDetailAPI.prductDetail(slug);
    ever(productListAPI.productListData, (_) {
      if (productListAPI.productListData.isNotEmpty) {
        youlike(youMayLikeControllerAPI, productListAPI);
      }
    });
    youlike(youMayLikeControllerAPI, productListAPI);
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
            loadingWait: (productDetail.adToCart.isLoading.value)
                ? customCircular()
                : null,
            onTap: () async {
              await productDetail.addToCart();
              await cartAPICallAPI.cartAPI.filterCart();
              calculateCartCount(cartAPICallAPI.cartAPI);
            },
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
