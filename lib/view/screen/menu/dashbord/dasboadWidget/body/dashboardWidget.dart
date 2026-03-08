// ignore_for_file: file_names, strict_top_level_inference, non_constant_identifier_names

import 'dart:convert';

import 'package:classic/controller/application_Programing_interface/apiController/hedder/cart/cart_Controller.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/indexButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import '../../../../../utils/app_icon.dart';
import '../../../../../utils/widget/image/productImage.dart';
import '../../../../../utils/widget/link/productLink.dart';
import '../../../diamondSearch/diamondWidget/body/searchResultWidget.dart';

//Index Button
Widget indexButtons({
  required bool isSelectDiamond,
  required bool isSelectJewellwery,
  void Function()? onTapDiamond,
  void Function()? onTapJewellwery,
}) {
  return horizontalPadding(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: indexButton(
            onTap: onTapDiamond,
            text: AppString.diamond,
            color: (isSelectDiamond) ? AppColor.primary : AppColor.white,
            textColor: (isSelectDiamond) ? AppColor.white : AppColor.black,
            borderColor: (isSelectDiamond) ? AppColor.primary : AppColor.gray3,
          ),
        ),
        SizedBox(width: Get.width * 0.04),
        Expanded(
          child: indexButton(
            onTap: onTapJewellwery,
            text: AppString.jewelry,
            color: (isSelectJewellwery) ? AppColor.primary : AppColor.white,
            textColor: (isSelectJewellwery) ? AppColor.white : AppColor.black,
            borderColor: (isSelectJewellwery)
                ? AppColor.primary
                : AppColor.gray3,
          ),
        ),
      ],
    ),
  );
}

Widget myCartDiamond(cartAPICallAPI) {
  return Expanded(
    child: Obx(() {
      final dataList = cartAPICallAPI.cartAPI.cartData.value['data'] as List?;
      final cartData = (dataList != null && dataList.isNotEmpty)
          ? (dataList[0]['diamondLookup'] as List? ?? [])
          : [];
      if (cartData.isEmpty) {
        return Center(child: Lottie.asset(AppJson.noData));
      }
      final adToCart = Get.put(CreateCartController());
      return ListView.builder(
        padding: EdgeInsets.only(bottom: Get.width * 0.20),
        itemCount: cartData.length,
        itemBuilder: (_, index) {
          final item = cartData[index];
          final diamond = item['diamondDetails'] ?? {};
          return listDiamond(
            isWishlist: true,
            camara: true,
            isCart: true,
            link: true,
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
            cartifactIcon:
                (diamond?['certno'] == null || diamond?['certno'] == '-')
                ? AppIcon.documant
                : AppIcon.documant,
            ids: item['diamondId'] ?? '',
            images: diamond['imageurl1'] ?? '',
            shape: diamond['shape'] ?? '',
            careat: diamond['carat']?.toString() ?? '',
            lab: diamond['lab'] ?? '',
            colorcode: diamond['color'] ?? '',
            clarity: diamond['clarity'] ?? '',
            cartifactNo: diamond['certno'] ?? '',
            cps: diamond['selling_price_per_ct']?.toString() ?? '',
            refNo: diamond['stockId'] ?? '',
            loc: diamond['location'] ?? '',
            ct: diamond['cut'] ?? '',
            total: (diamond['finalamount'] as num?)?.toStringAsFixed(2) ?? '',
            videos: '',
            meas: diamond['measurement']?.toString() ?? '',
            T: diamond['tablepercent']?.toString() ?? '',
            D: diamond['depth']?.toString() ?? '',
            cartOnTap: () {
              adToCart.createCart(
                price: diamond['finalamount']?.toString() ?? '',
                productId: diamond['_id']?.toString() ?? '',
                DiamondId: diamond['dimCountryId']?.toString() ?? '',
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
    }),
  );
}

Widget recentviwe(dashbord_API) {
  return Expanded(
    child: Builder(
      builder: (_) {
        final recentView = dashbord_API.recentView.recentViewData;
        if (recentView == null) {
          return const SizedBox();
        }
        final dataList = recentView['data'] as List?;
        if (dataList == null || dataList.isEmpty) {
          return Center(child: Lottie.asset(AppJson.noData));
        }
        final diamondList = dataList.first?['diamondList'] as List?;
        if (diamondList == null || diamondList.isEmpty) {
          return Center(child: Lottie.asset(AppJson.noData));
        }
        final adToCart = Get.put(CreateCartController());
        return ListView.builder(
          padding: EdgeInsets.only(bottom: Get.width * 0.20),
          itemCount: diamondList.length,
          itemBuilder: (_, index) {
            final diamond = diamondList[index] as Map?;
            final details = diamond?['diamondDetails'] as Map? ?? {};
            return listDiamond(
              idOnTop: () {
                final String? link = details['certurl']?.toString();
                if (link == null || link.isEmpty) {
                  if (kDebugMode) {
                    print("No Link");
                  }
                  return;
                } else {
                  productLink(link);
                }
              },
              cartifactIcon:
                  (diamond?['certno'] == null || diamond?['certno'] == '-')
                  ? AppIcon.documant
                  : AppIcon.edit,
              isWishlist: true,
              camara: true,
              isCart: true,
              link: true,
              ids: diamond?['diamondId']?.toString() ?? '',
              images: details['imageurl1']?.toString() ?? '',
              videos: details['videourl']?.toString() ?? '',
              shape: details['shape']?.toString() ?? '',
              careat: details['carat']?.toString() ?? '',
              lab: details['lab']?.toString() ?? '',
              colorcode: details['color']?.toString() ?? '',
              clarity: details['clarity']?.toString() ?? '',
              cartifactNo:
                  (details['certno'] == null || details['certno'] == '-')
                  ? ''
                  : details['certno'].toString(),
              cps: details['polish']?.toString() ?? '',
              meas: details['measurement']?.toString() ?? '',
              refNo: details['stockId']?.toString() ?? '',
              T: details['tablepercent']?.toString() ?? '',
              D: details['depth']?.toString() ?? '',
              loc: details['county']?.toString() ?? '',
              ct: details['carat']?.toString() ?? '',
              total: details['finalamount'] != null
                  ? (details['finalamount'] as num).toDouble().toStringAsFixed(
                      2,
                    )
                  : '0.00',
              cartOnTap: () {
                final cartAPI = Get.put(CartController());
                adToCart.createCart(
                  price: jsonEncode(details['finalamount'] ?? 0).toString(),
                  DiamondId: jsonEncode([diamond!['diamondId']]),
                  qty: '1',
                );
                cartAPI.filterCart();
              },
              camaraOnTap: () {
                final String? image = details['imageurl1']?.toString();
                if (image == null || image.isEmpty) {
                  if (kDebugMode) {
                    print("No Image");
                  }
                  return;
                }
                Get.to(() => ProductImage(images: image));
              },
              linkOnTap: () {
                final String? link = details['certurl']?.toString();
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
      },
    ),
  );
}
