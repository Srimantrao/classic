// ignore_for_file: body_might_complete_normally_nullable, strict_top_level_inference, unnecessary_import

import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/hedder/cart/cartUI_Controller.dart';
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

class Cart extends StatelessWidget {
  final cartAPICallAPI = Get.put(CartAPICall());
  final cartUI = Get.put(CartUiController());
  Cart({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.myCart),
      bottomNavigationBar: buttonNavigation(
        child: button(
          AppString.proceed,
          bottomBottonFontSize: true,
          isLowercase: true,
        ),
      ),
      child: horizontalPadding(
        child: Obx(() {
          final api = cartAPICallAPI.cartAPI;
          // final apiLoading = api.isLoading;
          // if (apiLoading.value) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          final cartData = api.cartData;
          if (cartData.isEmpty) {
            return Center(child: Lottie.asset(AppJson.noData));
          }
          final cartProduct = cartData['data'][0]['productLookup'] as List;
          if (cartProduct.isEmpty) {
            return Center(child: Lottie.asset(AppJson.noData));
          }
          final _ = cartProduct.fold<double>(
            0.0,
            (sum, product) => sum + (product['grandTotalPrice'] ?? 0.0),
          );
          return Column(
            children: [
              //List
              cartProductItem(cartUI, cartProduct),
              //Price
              // total(totalPrice.toStringAsFixed(2)),
              GetBuilder<CartUiController>(
                id: 'grand_total',
                builder: (cartUI) {
                  return total(cartUI.grandTotal.toStringAsFixed(2));
                },
              )
            ],
          );
        }),
      ),
    );
  }
}

