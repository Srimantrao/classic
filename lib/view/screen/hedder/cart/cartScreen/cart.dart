// ignore_for_file: body_might_complete_normally_nullable, strict_top_level_inference, unnecessary_import, use_key_in_widget_constructors

import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/cardRecord_Controller.dart';
import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/hedder/cart/cartUI_Controller.dart';
import 'package:classic/view/screen/hedder/cart/cartScreen/checkout.dart';
import 'package:classic/view/screen/hedder/cart/cartWidget/body/cartWidget.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/bottomNavigationButton.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import '../../../../../controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';

class Cart extends StatelessWidget {
  final cartAPICallAPI = Get.put(CartAPICall());
  final cartUI = Get.put(CartUiController());
  final productDetail = Get.put(ProductDetailUIController());
  final cardRecord = Get.put(CardRecordController());
  final adToCart = Get.put(CreateCartController());
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.myCart),
      bottomNavigationBar: buttonNavigation(
        child: button(
          onTap: () => Get.to(() => Checkout()),
          AppString.proceed,
          bottomBottonFontSize: true,
          isLowercase: true,
        ),
      ),
      child: Obx(() {
        final api = cartAPICallAPI.cartAPI;
        final cartData = api.cartData;
        if (cartData.isEmpty) {
          return const SizedBox();
        }
        final dataList = cartData['data'];
        if (dataList == null || dataList.isEmpty) {
          return Center(child: Lottie.asset(AppJson.noData));
        }
        final cartProduct = dataList[0]['productLookup'] as List? ?? [];
        final diamondProduct = dataList[0]['diamondLookup'] as List? ?? [];
        final totalDiamondPrice =
            (dataList[0]['totalDiamondPrice'] as num?)?.toDouble() ?? 0.0;
        final cartRecord = cardRecord.cardRecordData as List? ?? [];
        if (cartProduct.isEmpty && diamondProduct.isEmpty) {
          return Center(child: Lottie.asset(AppJson.noData));
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              //Product List
              if (cartProduct.isNotEmpty)
                cartProductItem(
                  cartUI,
                  cartProduct,
                  productDetail,
                  diamondTotal: totalDiamondPrice,
                ),
              if (cartProduct.isEmpty && diamondProduct.isNotEmpty)
                GetBuilder<CartUiController>(
                  id: 'grand_total',
                  initState: (_) =>
                      cartUI.initQty([], apiDiamondTotal: totalDiamondPrice),
                  builder: (_) => const SizedBox.shrink(),
                ),

              //Diamond List
              if (cartRecord.isNotEmpty) diamondProductItem(diamondProduct),

              //Price
              GetBuilder<CartUiController>(
                id: 'grand_total',
                builder: (cartUI) {
                  return horizontalPadding(
                    child: total("\$${cartUI.grandTotal.toStringAsFixed(2)}"),
                  );
                },
              ),

              Padding(
                padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.025),
              ),
            ],
          ),
        );
      }),
    );
  }
}
