// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import 'package:classic/controller/user_Interface/menu/diamondSearch/searchResult_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/holdDiamods/holdDiamodsExtraWidget/holdDiamodsExtraWidget.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/checkbox.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../../../controller/application_Programing_interface/callApi/callAPI.dart';
import '../../../../../utils/app_Borderradius.dart';
import '../../../../../utils/app_Color.dart';
import '../../../../../utils/app_icon.dart';
import '../../../../../utils/widget/cartList.dart';
import '../../../../../utils/widget/horizontalpaddind.dart';
import '../../../../../utils/widget/image/productImage.dart';
import '../../../../../utils/widget/image/productVideo.dart';
import '../../../dashbord/dashbordScreen/diamondDetail.dart';

Widget checkvaluehedding(
  SearchResultController holdcontroller,
  List valueList,
) {
  return holdDiamondValueList(
    pcs: holdcontroller.selectedDiamondCount.toString(),
    cts: holdcontroller.getTotalCts(valueList).toStringAsFixed(2),
    price: holdcontroller.getTotalCarat(valueList).toStringAsFixed(2),
    amount: holdcontroller.getTotalAmount(valueList).toStringAsFixed(2),
  );
}

Widget holdDiamondValueList({
  required String pcs,
  required String cts,
  required String price,
  required String amount,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.020),
    decoration: BoxDecoration(color: AppColor.secondary),
    child: horizontalPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [chakhedding(AppString.pcs), chakValue(pcs)]),
          Column(children: [chakhedding(AppString.cts), chakValue(cts)]),
          Column(children: [chakhedding(AppString.price), chakValue(price)]),
          Column(
            children: [
              chakhedding(AppString.amount.toUpperCase()),
              chakValue("\$$amount"),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget valueListDiamond({
  required List valueList,
  bool isWishlist = false,
  bool isCart = false,
  bool camara = false,
  bool video = false,
  bool holdDiamond = false,
  ScrollController? scrollController,
}) {
  final adToCart = Get.put(CreateCartController());
  final cartAPICallAPI = Get.put(CartAPICall());
  final searchResult = Get.find<SearchResultController>();
  if (searchResult.holdDiamondList.length != valueList.length) {
    searchResult.initHoldDiamond(valueList.length);
  }
  return Expanded(
    child: ListView.builder(
      controller: scrollController,
      itemCount: valueList.length,
      itemBuilder: (BuildContext context, int index) {
        return listDiamond(
          holdDiamond: holdDiamond,
          isHoldDiamondChecked: searchResult.holdDiamondList[index],
          isCart: isCart,
          camara: camara,
          video: video,
          isWishlist: isWishlist,
          link: true,
          ids: valueList[index]['_id']?.toString() ?? '',
          images: valueList[index]['imageurl1']?.toString() ?? '',
          videos: valueList[index]['videourl']?.toString() ?? '',
          shape: valueList[index]['shape']?.toString() ?? '',
          careat: valueList[index]['carat']?.toString() ?? '',
          lab: valueList[index]['lab']?.toString() ?? '',
          colorcode: valueList[index]['countryCode']?.toString() ?? '',
          clarity: valueList[index]['clarity']?.toString() ?? '',
          cartifactIcon:
              (valueList[index]['certno'] == null ||
                  valueList[index]['certno'] == '-')
              ? AppIcon.user1
              : AppIcon.diamondId,
          cartifactNo:
              (valueList[index]['certno'] == null ||
                  valueList[index]['certno'] == '-')
              ? ''
              : valueList[index]['certno'].toString(),
          cps: valueList[index]['polish']?.toString() ?? '',
          meas: valueList[index]['measurement']?.toString() ?? '',
          refNo: valueList[index]['stockId']?.toString() ?? '',
          T: valueList[index]['depth']?.toString() ?? '',
          D: valueList[index]['tablepercent']?.toString() ?? '',
          loc: valueList[index]['countryCode']?.toString() ?? '',
          ct: valueList[index]['parcarat']?.toString() ?? '',
          total: valueList[index]['finalamount']?.toString() ?? '',
          cartOnTap: () {
            adToCart.createCart(
              price: jsonEncode([valueList[index]['finalamount']]),
              DiamondId: jsonEncode([valueList[index]['_id']]),
              qty: '1',
            );
            cartAPICallAPI.cartAPI.filterCart();
          },
          holdDiamondChanged: (value) {
            searchResult.holdDiamondValue(index, value!);
          },
          linkOnTap: () {
            final String? image = valueList[index]['certurl']?.toString();
            if (image == null || image.isEmpty) {
              if (kDebugMode) {
                print("no Certurl");
              }
              return;
            }
            Get.to(() => ProductImage(images: image));
          },
          camaraOnTap: () {
            final String? image = valueList[index]['imageurl1']?.toString();
            if (image == null || image.isEmpty) {
              if (kDebugMode) {
                print("No Image");
              }
              return;
            }
            Get.to(() => ProductImage(images: image));
          },
          videoOnTap: () {
            final String? video = valueList[index]['videourl']?.toString();
            if (video == null || video.isEmpty) {
              if (kDebugMode) {
                print("No Video");
              }
              return;
            } else {
              Get.to(() => ProductVideo(videoUrl: video));
            }
          },
        );
      },
    ),
  );
}

Widget listDiamond({
  required String ids,
  required String images,
  required String videos,
  required String shape,
  required String careat,
  required String lab,
  required String colorcode,
  required String clarity,
  required String cartifactNo,
  String? cartifactIcon,
  required String cps,
  required String meas,
  required String refNo,
  required String T,
  required String D,
  required String loc,
  required String ct,
  required String total,
  bool isWishlist = false,
  bool isCart = false,
  bool camara = false,
  bool video = false,
  bool link = false,
  bool holdDiamond = false,
  bool isHoldDiamondChecked = false,
  void Function()? camaraOnTap,
  void Function()? videoOnTap,
  void Function()? cartOnTap,
  void Function()? linkOnTap,
  void Function()? idOnTop,
  void Function()? deleteDiamond,
  bool deletdiamond = false,
  void Function()? isWishlistOnTap,
  Function(bool?)? holdDiamondChanged,
}) {
  return horizontalPadding(
    child: GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.009),
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[2],
          color: AppColor.white,
          borderRadius: BorderRadius.circular(borderradius.boder),
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.03),
          child: Column(
            children: [
              listHeddind(
                shape: shape,
                careat: careat,
                lab: lab,
                colorcode: colorcode,
                clarity: clarity,
                cartifactNo: cartifactNo,
                cartifactIcon: cartifactIcon.toString(),
                idOnTop: idOnTop,
                deletdiamond: deletdiamond,
                deleteDiamond: deleteDiamond,
              ),
              Divider(color: AppColor.gray3),
              GestureDetector(
                onTap: () {
                  final String id = ids;
                  final String image = images;
                  final String video = videos;
                  Get.to(
                    () => DiamondDetail(id: id, image: image, video: video),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(color: AppColor.white),
                  child: Row(
                    children: [
                      fristrow(cps: cps, meas: meas, refNo: refNo),
                      Padding(
                        padding: EdgeInsetsGeometry.only(
                          left: Get.width * 0.03,
                        ),
                      ),
                      secondrow(T: T, D: D, loc: loc),
                      SizedBox(
                        height: Get.height * 0.06,
                        child: VerticalDivider(
                          color: AppColor.gray3,
                          thickness: Get.width * 0.002,
                          width: Get.width * 0.01,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(
                          left: Get.width * 0.01,
                        ),
                      ),
                      thardrow(ct: ct, total: total),
                    ],
                  ),
                ),
              ),
              Divider(color: AppColor.gray3),
              buttonOnList(
                isWishlist: isWishlist,
                isCart: isCart,
                camara: camara,
                video: video,
                link: link,
                cartOnTap: cartOnTap,
                camaraOnTap: camaraOnTap,
                videoOnTap: videoOnTap,
                linkOnTap: linkOnTap,
                isWishlistOnTap: isWishlistOnTap,
                holdDiamond: holdDiamond,
                isHoldDiamondChecked: isHoldDiamondChecked,
                holdDiamondChanged: holdDiamondChanged,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buttonOnList({
  bool isWishlist = false,
  bool isCart = false,
  bool camara = false,
  bool video = false,
  bool link = false,
  bool holdDiamond = false,
  bool isHoldDiamondChecked = false,
  void Function()? camaraOnTap,
  void Function()? videoOnTap,
  void Function()? cartOnTap,
  void Function()? linkOnTap,
  void Function()? isWishlistOnTap,
  Function(bool?)? holdDiamondChanged,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      if (isWishlist)
        GestureDetector(
          onTap: isWishlistOnTap,
          child: Container(
            padding: EdgeInsetsGeometry.only(right: 22, top: 5, bottom: 5),
            decoration: BoxDecoration(color: AppColor.white),
            child: listImage(AppIcon.wishlist),
          ),
        ),
      if (isCart)
        GestureDetector(
          onTap: cartOnTap,
          child: Container(
            padding: EdgeInsetsGeometry.only(
              right: 22,
              left: 22,
              top: 5,
              bottom: 5,
            ),
            decoration: BoxDecoration(color: AppColor.white),
            child: listImage(AppIcon.newcart),
          ),
        ),
      if (camara)
        GestureDetector(
          onTap: camaraOnTap,
          child: Container(
            padding: EdgeInsetsGeometry.only(
              right: 22,
              left: 22,
              top: 5,
              bottom: 5,
            ),
            decoration: BoxDecoration(color: AppColor.white),
            child: Image.asset(
              AppIcon.camera,
              scale: 24,
              color: AppColor.primary,
            ),
          ),
        ),
      if (video)
        GestureDetector(
          onTap: videoOnTap,
          child: Container(
            padding: EdgeInsetsGeometry.only(
              right: 22,
              left: 22,
              top: 5,
              bottom: 5,
            ),
            decoration: BoxDecoration(color: AppColor.white),
            child: listImage(AppIcon.video),
          ),
        ),
      if (link)
        GestureDetector(
          onTap: linkOnTap,
          child: Container(
            padding: EdgeInsetsGeometry.only(left: 22, top: 5, bottom: 5),
            decoration: BoxDecoration(color: AppColor.white),
            child: listImage(AppIcon.diamondId),
          ),
        ),
      if (holdDiamond)
        checkBox(
          isHoldDiamondChecked,
          holdDiamondChanged,
          boderColor: AppColor.primary,
        ),
    ],
  );
}
