// ignore_for_file: file_names, strict_top_level_inference, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/cart/cart_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/fitterWish/fitterWish_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/cardRecord_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createWishList_Controller.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/image/productVideo.dart';
import 'package:classic/view/utils/widget/indexButton.dart';
import 'package:classic/view/utils/widget/pop.dart';
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
        Padding(padding: EdgeInsetsGeometry.only(right: Get.width * 0.04)),
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

Widget myCartDiamond(CardRecordController cartAPICallAPI) {
  return Expanded(
    child: Obx(() {
      final adToCart = Get.put(CreateCartController());
      final dataList = cartAPICallAPI.cardRecordData;
      if (dataList.isEmpty) {
        return Center(child: Lottie.asset(AppJson.noData));
      }
      return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: Get.width * 0.20),
        itemCount: dataList.length,
        itemBuilder: (_, index) {
          final item = dataList[index];
          return listDiamond(
            isWishlist: true,
            camara: true,
            isCart: true,
            link: true,
            video: true,
            idOnTop: () {
              final String? link = item['certurl']?.toString();
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
                (item?['certno'] == null || item?['certno'] == '-')
                ? AppIcon.documant
                : AppIcon.documant,
            ids: item['diamondId'] ?? '',
            images: item['imageurl1'] ?? '',
            shape: item['shape'] ?? '',
            careat: item['carat']?.toString() ?? '',
            lab: item['lab'] ?? '',
            colorcode: item['color'] ?? '',
            clarity: item['clarity'] ?? '',
            cartifactNo: item['certno'] ?? '',
            cps: item['selling_price_per_ct']?.toString() ?? '',
            refNo: item['stockId'] ?? '',
            loc: item['country'] ?? '',
            ct: item['cut'] ?? '',
            total: (item['finalamount'] as num?)?.toStringAsFixed(2) ?? '',
            videos: '',
            meas: item['measurement']?.toString() ?? '',
            T: item['tablepercent']?.toString() ?? '',
            D: item['depth']?.toString() ?? '',
            cartOnTap: () {
              adToCart.createCart(
                price: item['finalamount']?.toString() ?? '',
                productId: item['_id']?.toString() ?? '',
                DiamondId: item['dimCountryId']?.toString() ?? '',
              );
            },
            videoOnTap: () {
              final String? video = item['videourl']?.toString();
              if (video == null || video.isEmpty) {
                ToastificationError.Error(AppString.noVideo);
                if (kDebugMode) {
                  print("No Video");
                }
                return;
              } else {
                Get.to(() => ProductVideo(videoUrl: video));
              }
            },
            camaraOnTap: () {
              final String? image = item['imageurl1']?.toString();
              if (image == null || image.isEmpty) {
                ToastificationError.Error(AppString.noImage);
                if (kDebugMode) {
                  print("No Image");
                }
                return;
              }
              Get.to(() => ProductImage(images: image));
            },
            linkOnTap: () {
              final String? link = item['certurl']?.toString();
              if (link == null || link.isEmpty) {
                ToastificationError.Error(AppString.noLink);
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
  final addWishListCart = Get.put(CreateWishlistController());
  final fitterWish = Get.put(FitterWishController());
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
                  ToastificationError.Error(AppString.noLink);
                  if (kDebugMode) {
                    print(AppString.noLink);
                  }
                  return;
                } else {
                  productLink(link);
                }
              },
              videoOnTap: () {
                final String? video = details['videourl']?.toString();
                if (video == null || video.isEmpty) {
                  if (kDebugMode) {
                    print("No Video");
                  }
                  return;
                } else {
                  Get.to(() => ProductVideo(videoUrl: video));
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
              video: false,
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
                  ToastificationError.Error(AppString.noImage);
                  if (kDebugMode) {
                    print(AppString.noImage);
                  }
                  return;
                }
                Get.to(() => ProductImage(images: image));
              },
              linkOnTap: () {
                final String? link = details['certurl']?.toString();
                if (link == null || link.isEmpty) {
                  ToastificationError.Error(AppString.noLink);
                  if (kDebugMode) {
                    print(AppString.noLink);
                  }
                  return;
                } else {
                  productLink(link);
                }
              },
              isWishlistOnTap: (){
                addWishListCart.createWishlist(
                  DiamondId: jsonEncode([diamond!['_id']]),
                  qty: '1',
                );
                print("Add WhisList :- ${[diamond['_id']]}");
                fitterWish.fitterWishList();
              },
            );
          },
        );
      },
    ),
  );
}
