// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore, non_constant_identifier_names, avoid_unnecessary_containers, strict_top_level_inference

import 'package:classic/view/screen/hedder/cart/cartWidget/extraWidget/extraWidget.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../../controller/user_Interface/hedder/cart/cartUI_Controller.dart';
import '../../../../menu/jewelry/jewelryScreen/productDetail.dart';

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
  // if (index >= cartUI.qtyList.length ||
  //     index >= cartUI.unitPriceList.length ||
  //     cartUI.qtyList.isEmpty) {
  //   return SizedBox.shrink();
  // }
  return GetBuilder<CartUiController>(
    id: 'qty_$index',
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
          PRICE_CT: (cartUI.unitPriceList[index] * cartUI.qtyList[index])
              .toStringAsFixed(2),
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

Widget cart({
  required String cartImage,
  required String PRICE_CT,
  required String stock,
  required String type,
  required String Weightm,
  required String title,
  void Function()? onTapIncrimant,
  void Function()? onTapDecrimant,
  required void Function() removeItem,
  int? value,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: Get.height * 0.007),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.gray),
      boxShadow: kElevationToShadow[1],
      color: AppColor.white,
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
    ),
    child: cartValue(
      cartImage: cartImage,
      PRICE_CT: PRICE_CT,
      stock: stock,
      type: type,
      Weightm: Weightm,
      title: title,
      onTapIncrimant: onTapIncrimant,
      onTapDecrimant: onTapDecrimant,
      value: value, removeItem: removeItem
    ),
  );
}

Widget total(text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.gray),
      boxShadow: kElevationToShadow[1],
      color: AppColor.white,
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
    ),
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.005),
    child: horizontalPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [price(AppString.total), price(text)],
      ),
    ),
  );
}