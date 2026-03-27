// ignore_for_file: file_names, strict_top_level_inference, unnecessary_null_comparison

import 'package:classic/view/screen/menu/dashbord/dashbordExtraWidget/dashbordExtraWidget.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/productDetail.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../utils/app_json.dart';

Widget diamondSection({
  bool? isDiamond,
  String? informationContainerDiamondText,
  String? informationContainerDiamondValue,
  String? informationContainerOrderText,
  String? informationContainerOrderValue,
  String? informationContainerHoldText,
  String? informationContainerHoldValue,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      //Information Container Start
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          constraints: BoxConstraints(minWidth: Get.width),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              informationOfProduct(
                isDiamond: isDiamond ?? false,
                informationContainerDiamondText,
                informationContainerDiamondValue,
                isFirst: true,
              ),
              informationOfProduct(
                isDiamond: isDiamond ?? false,
                informationContainerOrderText,
                informationContainerOrderValue,
              ),
              (informationContainerHoldText == '' &&
                      informationContainerHoldValue == '')
                  ? SizedBox()
                  : informationOfProduct(
                      isDiamond: isDiamond ?? false,
                      informationContainerHoldText,
                      informationContainerHoldValue,
                    ),
            ],
          ),
        ),
      ),

      //Information Container End
      SizedBox(height: Get.height * 0.02),
    ],
  );
}

//Recent Viwe & My Cart Button Start
Widget selectIndexText({
  required bool isrecentViwe,
  required bool isMyCartViwe,
  void Function()? onTapMyCartViwe,
  void Function()? onTapRecentViwe,
}) {
  return selectIndexViwe(
    textRecentViwe: AppString.recentViwe,
    colorRecentViwe: (isrecentViwe) ? AppColor.primary : AppColor.white,
    textMyCartViwe: AppString.myCart,
    colorMyCartViwe: (isMyCartViwe) ? AppColor.primary : AppColor.white,
    onTapRecentViwe: onTapRecentViwe,
    onTapMyCartViwe: onTapMyCartViwe,
  );
  //Recent Viwe & My Cart Button End
}

//Jewellwery List
Widget jewelryListViwe({required List jewelryList}) {
  if(jewelryList == null || jewelryList.isEmpty){
    return Expanded(child: Center(child: Lottie.asset(AppJson.noData)));
  }
  return Expanded(
    child: ListView.builder(
      itemCount: jewelryList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = jewelryList[index]['productDetails'] ?? {};
        final imageList = item['images'] ?? [];
        final imageUrl = imageList.isNotEmpty ? imageList[0]['zoom'] : '';
        return jeawellweryList(
          imageUrl: imageUrl,
          productTitle: item['productTitle'] ?? '',
          finalPrice:
              '\$${(double.tryParse(item['finalPrice']?.toString() ?? '0') ?? 0).toStringAsFixed(2)}',
          itemCode: item['itemCode'] ?? '',
          metalType: item['metalType'] ?? '',
          appxMetalWgt: item['appxMetalWgt'].toString(),
          totalWgt: item['totalWgt'].toString(),
          categoryId: item['categoryId'] ?? '',
          slug: item['slug'] ?? '',
        );
      },
    ),
  );
}

Widget cartJewelryList({required List jewelryList}) {
  if (jewelryList.isEmpty) {
    return Expanded(child: Center(child: Lottie.asset(AppJson.noData)));
  }

  return Expanded(
    child: ListView.builder(
      itemCount: jewelryList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = jewelryList[index]['productDetails'] ?? {};
        final imageList = item['images'] ?? [];
        final imageUrl =
        imageList.isNotEmpty ? imageList.first['zoom'] ?? '' : '';
        return jeawellweryList(
          imageUrl: imageUrl,
          productTitle: item['productTitle'] ?? '',
          finalPrice:
          '\$${(double.tryParse(item['finalPrice']?.toString() ?? '0') ?? 0).toStringAsFixed(2)}',
          itemCode: item['itemCode'] ?? '',
          metalType: item['metalType'] ?? '',
          appxMetalWgt: item['appxMetalWgt']?.toString() ?? '',
          totalWgt: item['totalWgt']?.toString() ?? '',
          categoryId: item['categoryId'] ?? '',
          slug: item['slug'] ?? '',
        );
      },
    ),
  );
}

Widget jeawellweryList({
  required String imageUrl,
  required String productTitle,
  required String finalPrice,
  required String itemCode,
  required String metalType,
  required String appxMetalWgt,
  required String totalWgt,
  required String categoryId,
  required String slug,
}) {
  return horizontalPadding(
    child: GestureDetector(
      onTap: () {
        Get.to(() => ProductDetail(slug: slug, categoryId: categoryId));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.009),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.gray),
          borderRadius: BorderRadius.circular(borderradius.buttonboder),
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.03),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(AppImage.pandant1, scale: 25),

              SizedBox(width: Get.width * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Textsize.small,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      finalPrice,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Get.width * 0.04,
                        color: AppColor.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    valueShow('SKU: ', itemCode),
                    valueShow('Metal: ', metalType),
                    valueShow('Weight(Apx): ', appxMetalWgt),
                    valueShow('Total Weight: ', totalWgt),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget valueShow(head, value) {
  return Row(children: [subHedding(head), subValue(value)]);
}

Widget subHedding(text) {
  return Row(
    children: [
      Text(
        text,
        style: TextStyle(fontSize: Textsize.small, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget subValue(text) {
  return Row(
    children: [
      Text(
        text.toString(),
        style: TextStyle(
          fontSize: Textsize.small,
          fontWeight: FontWeight.w500,
          color: AppColor.primary,
        ),
      ),
    ],
  );
}
