// ignore_for_file: strict_top_level_inference

import 'package:classic/view/screen/menu/jewelry/jewelryExtraWidget/product.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget search(searchController, {void Function()? filtertab}) {
  return Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: Get.width * 0.02),
    child: Row(
      children: [
        Expanded(flex: 9, child: searchBar(searchController)),
        GestureDetector(
          onTap: filtertab,
          child: Icon(
            Icons.filter_alt_outlined,
            color: AppColor.gray3,
            size: 30,
          ),
        ),
      ],
    ),
  );
}

Widget productList({
  required List list,
  required void Function(String imagePath) onTapImagePath,
  required void Function(
    String imagePath,
    String productNameText,
    String priceText,
  )
  onTapProductDetail,
}) {
  return Expanded(
    child: horizontalPadding(
      child: GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Get.width * 0.04,
          mainAxisSpacing: Get.width * 0.04,
          mainAxisExtent: 300,
        ),
        itemBuilder: (context, index) {
          return productWidget(
            onTapImagePath: () {
              onTapImagePath(list[index]['image']);
            },
            onTapProductDetail: () {
              onTapProductDetail(
                list[index]['image'],
                list[index]['name'],
                list[index]['price'],
              );
            },
            productImagePath: list[index]['image'],
            productNameText: list[index]['name'],
            priceText: list[index]['price'],
          );
        },
      ),
    ),
  );
}

Widget productWidget({
  required String productImagePath,
  required String productNameText,
  required String priceText,
  void Function()? onTapImagePath,
  void Function()? onTapProductDetail,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
      border: Border.all(color: AppColor.gray),
    ),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTapImagePath,
            child: productImage(productImagePath),
          ),
          GestureDetector(
            onTap: onTapProductDetail,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                productName(productNameText),
                price(priceText),
                SizedBox(height: Get.height * 0.01),
                Row(
                  children: [
                    information('Metal'),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: caratInformation(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.01),
                Row(children: [information('Carat'), caratHowMany('1')]),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}