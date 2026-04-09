// ignore_for_file: use_key_in_widget_constructors

import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/cardRecord_Controller.dart';
import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/hedder/cart/cartUI_Controller.dart';
import 'package:classic/controller/user_Interface/hedder/cart/checkOutUI_Controller.dart';
import 'package:classic/controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import 'package:classic/view/screen/hedder/cart/cartWidget/body/cartWidget.dart';
import 'package:classic/view/screen/hedder/cart/cartWidget/body/checkoutWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/bottomNavigationButton.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Checkout extends StatelessWidget {
  final checkoutUi = Get.put(CheckoutUiController());
  final cartAPICallAPI = Get.put(CartAPICall());
  final cardRecord = Get.put(CardRecordController());
  final cartUI = Get.put(CartUiController());
  final productDetail = Get.put(ProductDetailUIController());

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.checkout),
      bottomNavigationBar: buttonNavigation(
        child: button(
          AppString.placeOrder,
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
        final cartRecordList = cardRecord.cardRecordData as List? ?? [];

        if (cartProduct.isEmpty && diamondProduct.isEmpty) {
          return Center(child: Lottie.asset(AppJson.noData));
        }

        final ui = checkoutUi;
        final value = ui.isbiilingValue.value;
        final billingValue = checkoutUi.billingAddress.value;

        return SingleChildScrollView(
          child: Column(
            children: [
              prdoctItem(
                checkoutUi.isBillingItem,
                (billingValue)
                    ? Icon(Icons.keyboard_arrow_down, color: AppColor.primary)
                    : Icon(Icons.keyboard_arrow_up, color: AppColor.primary),
              ),

              (billingValue)
                  ? Container(
                      decoration: BoxDecoration(color: AppColor.skyBlue),
                      child: Column(
                        children: [
                          //Product List
                          if (cartProduct.isNotEmpty)
                            cartProductItem(cartUI, cartProduct, productDetail),

                          //Diamond List
                          if (cartRecordList.isNotEmpty)
                            diamondProductItem(diamondProduct),
                        ],
                      ),
                    )
                  : const SizedBox(),

              shippingAddress(),
              billingAddress(value, (value) {
                checkoutUi.isbillingAddress(value!);
              }),
              remarkInput(),
              priceDetail("\$${cartUI.grandTotal.toStringAsFixed(2)}"),
            ],
          ),
        );
      }),
    );
  }
}
