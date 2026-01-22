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

import '../../../menu/jewelry/jewelryScreen/productDetail.dart';

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
          final apiLoading = api.isLoading;
          if (apiLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          final cartData = api.cartData;
          if (cartData.isEmpty) {
            return Center(child: Lottie.asset(AppJson.noData));
          }
          final cartProduct = cartData['data'][0]['productLookup'] as List;
          if(cartProduct.isEmpty){
            return Center(child: Lottie.asset(AppJson.noData));
          }
          final totalPrice = cartProduct.fold<double>(
            0.0,
            (sum, product) => sum + (product['price'] ?? 0.0),
          );
          return Column(
            children: [
              //List
              cartProductItem(cartUI, cartProduct),
              //Price
              total(totalPrice.toStringAsFixed(2)),
            ],
          );
        }),
      ),
    );
  }
}

Widget cartProductItem(cartUI, cartProduct) {
  return GetBuilder<CartUiController>(
    id: 'cartList',
    initState: (_) => cartUI.initQty(cartProduct),
    builder: (cartUI) {
      return Expanded(
        child: ListView.builder(
          itemCount: cartProduct.length,
          itemBuilder: (context, index) {
            final product = cartProduct[index];
            final images = product['productDetails']?['images'] as List?;
            final productImage = (images != null && images.isNotEmpty)
                ? images.first
                : null;
            return cartShow(product, productImage, cartUI, index, cartProduct);
          },
        ),
      );
    },
  );
}

Widget cartShow(product, productImage, cartUI, index, cartProduct) {
  if (index >= cartUI.qtyList.length ||
      index >= cartUI.unitPriceList.length ||
      cartUI.qtyList.isEmpty) {
    return SizedBox.shrink();
  }
  return GetBuilder<CartUiController>(
    id: 'cartList',
    builder: (_) {
      return GestureDetector(
        onTap: () {
          Get.to(
                () => ProductDetail(
              slug: product['productDetails']?['slug'],
              categoryId: product['productId'],
            ),
          );
        },
        child: cart(
          title: product['productDetails']?['productTitle'] ?? '',
          cartImage: productImage?['zoom'] ?? '',
          PRICE_CT: (cartUI.unitPriceList[index] * cartUI.qtyList[index]).toStringAsFixed(2),
          stock: product['productDetails']?['itemCode'] ?? '',
          type: product['productDetails']?['metalType'] ?? '',
          Weightm: product['productDetails']?['appxMetalWgt']?.toString() ?? '',
          onTapDecrimant: () {
            cartUI.decrementQty(index, product['_id']);
          },
          onTapIncrimant: () {
            cartUI.incrementQty(index, product['_id']);
          },
          value: cartUI.qtyList[index],
          removeItem: () {
            cartUI.removeCartItem(index, product['_id']);
          },
        ),
      );
    },
  );
}

// Widget cartShow(product, productImage, cartUI, index, cartProduct) {
//   Get.put(UpdateCartController());
//   return GetBuilder<CartUiController>(
//     id: 'qty_$index',
//     builder: (_) {
//       double price = product['price']?.toDouble() ?? 0;
//       return GestureDetector(
//         onTap: () {
//           Get.to(
//             () => ProductDetail(
//               slug: product['productDetails']?['slug'],
//               categoryId: product['productId'],
//             ),
//           );
//         },
//         child: cart(
//           title: product['productDetails']?['productTitle'] ?? '',
//           cartImage: productImage?['zoom'] ?? '',
//           PRICE_CT: price.toString(),
//           stock: product['productDetails']?['itemCode'] ?? '',
//           type: product['productDetails']?['metalType'] ?? '',
//           Weightm: product['productDetails']?['appxMetalWgt'].toString() ?? '',
//           onTapDecrimant: () {
//             cartUI.decrementQty(index, cartProduct, product['_id']);
//           },
//           onTapIncrimant: () {
//             cartUI.incrementQty(index, cartProduct, product['_id']);
//           },
//           value: cartUI.qtyList[index],
//         ),
//       );
//     },
//   );
// }
