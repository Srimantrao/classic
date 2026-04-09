// ignore: file_names

// ignore_for_file: avoid_print, file_names, duplicate_ignore, non_constant_identifier_names, avoid_unnecessary_containers, strict_top_level_inference

import 'package:classic/controller/application_Programing_interface/apiController/hedder/cart/cart_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/fitterWish/deletWish_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/fitterWish/fitterWish_Controller.dart';
import 'package:classic/view/screen/hedder/cart/cartWidget/extraWidget/extraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/holdDiamods/holdDiamondWidget/body/holdDiamondWidget.dart';
import 'package:classic/view/screen/menu/dashbord/dashbordScreen/diamondDetail.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/removeIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../../controller/application_Programing_interface/callApi/callAPI.dart';
import '../../../../../../controller/user_Interface/hedder/cart/cartUI_Controller.dart';
import '../../../../../../controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import '../../../../menu/jewelry/jewelryScreen/productDetail.dart';

Widget cartProductItem(
  CartUiController cartUI,
  List cartProduct,
  ProductDetailUIController productDetail,
) {
  return GetBuilder<CartUiController>(
    id: 'qty_list',
    initState: (_) => cartUI.initQty(cartProduct),
    builder: (cartUI) {
      if (cartUI.qtyList.isEmpty ||
          cartUI.qtyList.length < cartProduct.length) {
        return const SizedBox();
      }
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cartProduct.length,
        itemBuilder: (context, index) {
          if (index >= cartUI.qtyList.length) {
            return const SizedBox();
          }
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

Widget diamondProductItem(List dataList) {
  final deletWish = Get.put(DeletWishController());
  final fitterWish = Get.put(FitterWishController());
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: dataList.length,
    itemBuilder: (BuildContext context, int index) {
      final diamond = dataList[index]['diamondDetails'] ?? {};
      final diamondID = dataList[index]['_id']?.toString() ?? '';
      return GestureDetector(
        onTap: () {
          Get.to(
            () => DiamondDetail(
              id: dataList[index]['diamondId']?.toString() ?? '',
              image: diamond['imageurl1']?.toString() ?? '',
            ),
          );
        },
        child: cartViwe(
          imageURL: diamond['imageurl1']?.toString() ?? '',
          stockId: diamond['stockId']?.toString() ?? '',
          shape: diamond['shape']?.toString() ?? '',
          color: diamond['color']?.toString() ?? '',
          clarity: diamond['clarity']?.toString() ?? '',
          carat: diamond['carat']?.toString() ?? '',
          cut: diamond['cut']?.toString() ?? '',
          lab: diamond['lab']?.toString() ?? '',
          parcarat: diamond['selling_price_per_ct']?.toString() ?? '',
          customeJewellerDiscountAmount: diamond['CustomeDiamondDiscount']
              .toString(),
          finalamount: diamond['finalamount']?.toString() ?? '',
          checkBoxWidget: GestureDetector(
            onTap: () {
              print("diamondID :-$diamondID");
              deletWish.deleWishList(diamondID.toString());
              fitterWish.fitterWishList();
              calculateWishCount(fitterWish);
            },
            child: removeIcon(),
          ),
        ),
      );
    },
  );
}

// final adToCart = Get.put(CreateCartController());
// final removeItem = Get.put(DeleteCartController());
// final cartAPICallAPI = Get.put(CartAPICall());
// final adToCart = Get.put(CreateCartController());
// final removeItem = Get.put(DeleteCartController());
// final cartAPICallAPI = Get.put(CartAPICall());
// return listDiamond(
//   idOnTop: () {
//     final String? link = diamond['certurl']?.toString();
//     if (link == null || link.isEmpty) {
//       if (kDebugMode) {
//         print("No Link");
//       }
//       return;
//     } else {
//       productLink(link);
//     }
//   },
//   cartifactIcon: (diamond?['certno'] == null || diamond?['certno'] == '-')
//       ? AppIcon.documant
//       : AppIcon.documant,
//   ids: diamond['_id']?.toString() ?? '',
//   images: diamond['imageurl1']?.toString() ?? '',
//   videos: diamond['videourl']?.toString() ?? '',
//   shape: diamond['shape']?.toString() ?? '',
//   careat: diamond['carat']?.toString() ?? '',
//   lab: diamond['lab']?.toString() ?? '',
//   colorcode: diamond['countryCode']?.toString() ?? '',
//   clarity: diamond['clarity']?.toString() ?? '',
//   cartifactNo: (diamond['certno'] == null || diamond['certno'] == '-')
//       ? ''
//       : diamond['certno'].toString(),
//   cps: diamond['polish']?.toString() ?? 'NONE-Undefined-U',
//   meas: diamond['measurement']?.toString() ?? 'undefined',
//   refNo: diamond['stockId']?.toString() ?? '',
//   T: diamond['depth']?.toString() ?? '0%',
//   D: diamond['tablepercent']?.toString() ?? 'NaN%',
//   loc: diamond['country']?.toString() ?? '',
//   ct: diamond['carat']?.toString() ?? '',
//   total: diamond['finalamount']?.toString() ?? '',
//   isWishlist: true,
//   video: true,
//   camara: true,
//   link: true,
//   deletdiamond: true,
//   videoOnTap: () {
//     final String? video = diamond['videourl']?.toString();
//     if (video == null || video.isEmpty) {
//       ToastificationError.Error(AppString.noVideo);
//       if (kDebugMode) {
//         print("No Video");
//       }
//       return;
//     } else {
//       Get.to(() => ProductVideo(videoUrl: video));
//     }
//   },
//   camaraOnTap: () {
//     final String? image = diamond['imageurl1']?.toString();
//     if (image == null || image.isEmpty) {
//       ToastificationError.Error(AppString.noImage);
//       if (kDebugMode) {
//         print("No Image");
//       }
//       return;
//     }
//     Get.to(() => ProductImage(images: image));
//   },
//   deleteDiamond: () async {
//     await removeItem.deleteCart(diamond['_id']?.toString() ?? '');
//     await cartAPICallAPI.cartAPI.filterCart();
//     calculateCartCount(cartAPICallAPI.cartAPI);
//   },
//   cartOnTap: () {
//     adToCart.createCart(
//       price: diamond['finalamount']?.toString() ?? '',
//       productId: diamond['_id']?.toString() ?? '',
//       DiamondId: diamond['dimCountryId']?.toString() ?? '',
//     );
//   },
//   linkOnTap: () {
//     final String? link = diamond['certurl']?.toString();
//     if (link == null || link.isEmpty) {
//       ToastificationError.Error(AppString.noLink);
//       if (kDebugMode) {
//         print("No Link");
//       }
//       return;
//     } else {
//       productLink(link);
//     }
//   },
// );

Widget cartShow(
  product,
  productImage,
  CartUiController cartUI,
  int index,
  List cartProduct,
  ProductDetailUIController productDetail,
) {
  Get.put(CartController());
  return GetBuilder<CartUiController>(
    id: 'qty_$index',
    builder: (_) {
      if (index >= cartUI.qtyList.length ||
          index >= cartUI.unitPriceList.length) {
        return const SizedBox();
      }
      final cartAPICallAPI = Get.put(CartAPICall());
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
          removeItem: () async {
            await cartUI.removeCartItem(index, product['_id']);
            await cartAPICallAPI.cartAPI.filterCart();
            calculateCartCount(cartAPICallAPI.cartAPI);
          },
          productDetail: productDetail,
          categoryId:
              product['productDetails']?['categoryDetails']?['_id'] ?? '',
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
