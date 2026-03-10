// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore, non_constant_identifier_names, avoid_unnecessary_containers, strict_top_level_inference

import 'package:classic/view/screen/hedder/cart/cartWidget/extraWidget/extraWidget.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../../controller/application_Programing_interface/apiController/hedder/cart/deleteCart_Controller.dart';
import '../../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import '../../../../../../controller/application_Programing_interface/callApi/callAPI.dart';
import '../../../../../../controller/user_Interface/hedder/cart/cartUI_Controller.dart';
import '../../../../../../controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import '../../../../../utils/app_icon.dart';
import '../../../../../utils/widget/image/productImage.dart';
import '../../../../../utils/widget/link/productLink.dart';
import '../../../../menu/diamondSearch/diamondWidget/body/searchResultWidget.dart';
import '../../../../menu/jewelry/jewelryScreen/productDetail.dart';

Widget cartProductItem(cartUI, cartProduct, productDetail) {
  return GetBuilder<CartUiController>(
    id: 'cartList',
    initState: (_) => cartUI.initQty(cartProduct),
    builder: (cartUI) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cartProduct.length,
        itemBuilder: (context, index) {
          final product = cartProduct[index];
          final images = product['productDetails']?['images'] as List?;
          final productImage = (images != null && images.isNotEmpty)
              ? images.first
              : null;
          return horizontalPadding(
            child: cartShow(
              product,
              productImage,
              cartUI,
              index,
              cartProduct,
              productDetail,
            ),
          );
        },
      );
    },
  );
}

Widget diamondProductItem(diamondProduct) {
  final adToCart = Get.put(CreateCartController());
  final removeItem = Get.put(DeleteCartController());
  final cartAPICallAPI = Get.put(CartAPICall());
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: diamondProduct.length,
    itemBuilder: (BuildContext context, int index) {
      final diamond = diamondProduct[index]['diamondDetails'];
      return listDiamond(
        idOnTop: () {
          final String? link = diamond['certurl']?.toString();
          if (link == null || link.isEmpty) {
            if (kDebugMode) {
              print("No Link");
            }
            return;
          } else {
            productLink(link);
          }
        },
        cartifactIcon: (diamond?['certno'] == null || diamond?['certno'] == '-')
            ? AppIcon.documant
            : AppIcon.edit,
        ids: diamondProduct[index]['diamondId']?.toString() ?? '',
        images: diamond['imageurl1']?.toString() ?? '',
        videos: diamond['videourl']?.toString() ?? '',
        shape: diamond['shape']?.toString() ?? '',
        careat: diamond['carat']?.toString() ?? '',
        lab: diamond['lab']?.toString() ?? '',
        colorcode: diamond['countryCode']?.toString() ?? '',
        clarity: diamond['clarity']?.toString() ?? '',
        cartifactNo: (diamond['certno'] == null || diamond['certno'] == '-')
            ? ''
            : diamond['certno'].toString(),
        cps: diamond['polish']?.toString() ?? 'NONE-Undefined-U',
        meas: diamond['measurement']?.toString() ?? 'undefined',
        refNo: diamond['stockId']?.toString() ?? '',
        T: diamond['depth']?.toString() ?? '0%',
        D: diamond['tablepercent']?.toString() ?? 'NaN%',
        loc: diamond['country']?.toString() ?? '',
        ct: diamond['parcarat']?.toString() ?? '',
        total: diamond['finalamount']?.toString() ?? '',
        isWishlist: true,
        video: true,
        camara: true,
        link: true,
        deletdiamond: true,
        deleteDiamond: () {
          removeItem.deleteCart(diamondProduct[index]['_id']?.toString() ?? '');
          diamondProduct.removeAt(index);
          cartAPICallAPI.cartAPI.filterCart();
        },
        cartOnTap: () {
          adToCart.createCart(
            price: diamond['finalamount']?.toString() ?? '',
            productId: diamondProduct[index]['_id']?.toString() ?? '',
            DiamondId: diamondProduct[index]['dimCountryId']?.toString() ?? '',
          );
        },
        camaraOnTap: () {
          final String? image = diamond['imageurl1']?.toString();
          if (image == null || image.isEmpty) {
            if (kDebugMode) {
              print("No Image");
            }
            return;
          }
          Get.to(() => ProductImage(images: image));
        },
        linkOnTap: () {
          final String? link = diamond['certurl']?.toString();
          if (link == null || link.isEmpty) {
            if (kDebugMode) {
              print("No Link");
            }
            return;
          } else {
            productLink(link);
          }
        },
      );
    },
  );
}

Widget cartShow(
  product,
  productImage,
  cartUI,
  index,
  cartProduct,
  productDetail,
) {
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
          productDetail: productDetail,
          categoryId: product['productDetails']?['categoryDetails']?['_id'],
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
  required ProductDetailUIController productDetail,
  required String title,
  required String categoryId,
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
      value: value,
      removeItem: removeItem,
      productDetail: productDetail,
      categoryId: categoryId,
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
