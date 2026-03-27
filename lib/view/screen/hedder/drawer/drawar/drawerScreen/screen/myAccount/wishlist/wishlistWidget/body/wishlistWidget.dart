// ignore_for_file: file_names, strict_top_level_inference
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/fitterWish/deletWish_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/fitterWish/fitterWish_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/view/screen/menu/diamondSearch/diamondWidget/body/searchResultWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/image/productImage.dart';
import 'package:classic/view/utils/widget/indexButton.dart';
import 'package:classic/view/utils/widget/link/productLink.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
            onTap: onTapJewellwery,
            text: AppString.jewelry,
            color: (isSelectJewellwery) ? AppColor.primary : AppColor.white,
            textColor: (isSelectJewellwery) ? AppColor.white : AppColor.black,
            borderColor: (isSelectJewellwery)
                ? AppColor.primary
                : AppColor.gray3,
          ),
        ),
        SizedBox(width: Get.width * 0.04),
        Expanded(
          child: indexButton(
            onTap: onTapDiamond,
            text: AppString.diamond,
            color: (isSelectDiamond) ? AppColor.primary : AppColor.white,
            textColor: (isSelectDiamond) ? AppColor.white : AppColor.black,
            borderColor: (isSelectDiamond) ? AppColor.primary : AppColor.gray3,
          ),
        ),
      ],
    ),
  );
}

Widget diamondListWish(header) {
  final wishlist = header.fitterWish.fitterWishData;
  if (wishlist.isEmpty || wishlist['data'] == null) {
    return Expanded(child: Center(child: Lottie.asset(AppJson.noData)));
  }
  final dataList = wishlist['data'] as List?;
  if (dataList == null || dataList.isEmpty) {
    return Expanded(child: Center(child: Lottie.asset(AppJson.noData)));
  }
  final diamondList = dataList[0]['diamondLookup'] as List?;
  if (diamondList == null || diamondList.isEmpty) {
    return Expanded(child: Center(child: Lottie.asset(AppJson.noData)));
  }
  final adToCart = Get.put(CreateCartController());
  return Expanded(
    child: ListView.builder(
      itemCount: diamondList.length,
      itemBuilder: (context, index) {
        final diamond = diamondList[index] as Map?;
        final details = diamond?['diamondDetails'] as Map? ?? {};
        return listDiamond(
          deletdiamond: true,
          deleteDiamond: () async {
            final deletWish = Get.put(DeletWishController());
            final fitterWish = Get.put(FitterWishController());
            await deletWish.deleWishList(diamond!['_id']);
            await fitterWish.fitterWishList();
            calculateWishCount(fitterWish);
          },
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
          camara: true,
          isCart: true,
          link: true,
          video: true,
          ids: diamond?['diamondId']?.toString() ?? '',
          images: details['imageurl1']?.toString() ?? '',
          videos: details['videourl']?.toString() ?? '',
          shape: details['shape']?.toString() ?? '',
          careat: details['carat']?.toString() ?? '',
          lab: details['lab']?.toString() ?? '',
          colorcode: details['color']?.toString() ?? '',
          clarity: details['clarity']?.toString() ?? '',
          refNo: details['stockId']?.toString() ?? '',
          loc: details['location']?.toString() ?? '',
          total: details['finalamount'] != null
              ? (details['finalamount'] as num).toDouble().toStringAsFixed(2)
              : '0.00',
          cartOnTap: () {
            adToCart.createCart(
              price: details['finalamount']?.toString() ?? '',
              productId: details['_id']?.toString() ?? '',
              DiamondId: diamond?['diamondId']?.toString() ?? '',
            );
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
          cartifactNo: (details['certno'] == null || details['certno'] == '-')
              ? ''
              : details['certno'].toString(),
          cps: details['polish']?.toString() ?? '',
          meas: details['measurement']?.toString() ?? '',
          T: details['tablepercent']?.toString() ?? '',
          D: details['depth']?.toString() ?? '',
          ct: details['carat']?.toString() ?? '',
        );
      },
    ),
  );
}
