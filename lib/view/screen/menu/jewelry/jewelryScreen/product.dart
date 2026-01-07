// ignore_for_file: unused_local_variable

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList_Controller.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/filter.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productbody.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../utils/widget/horizontalpaddind.dart';

class Product extends StatelessWidget {
  final productListAPI = Get.put(ProductlistController());
  final searchController = TextEditingController();
  final scrollController = ScrollController();
  final String categoryId;
  final String categoryName;
  final String? subCategoryId;
  final String? metalType;
  final String? metalStamp;
  final String? shape;
  final String? settingType;
  final String? minPrice;
  final String? priceShort;
  Product({
    super.key,
    required this.categoryId,
    required this.categoryName,
    this.subCategoryId,
    this.metalType,
    this.metalStamp,
    this.shape,
    this.settingType,
    this.minPrice,
    this.priceShort,
  });
  @override
  Widget build(BuildContext context) {
    productListAPI.fetchFirstPage(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      metalType: metalType,
      metalStamp: metalStamp,
      shape: shape,
      settingType: settingType,
      minPrice: minPrice,
      priceShort: priceShort,
    );

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        productListAPI.fetchNextPage(
          categoryId: categoryId,
          subCategoryId: subCategoryId,
          metalType: metalType,
          metalStamp: metalStamp,
          shape: shape,
          settingType: settingType,
          minPrice: minPrice,
          priceShort: priceShort,
        );
      }
    });
    return Fullscreen(
      appBar: allOtherScreen(categoryName.toUpperCase(), cart: true),
      child: Column(
        children: [
          search(searchController, filtertab: () => Get.to(() => Filter())),
          Obx(() {
            final api = productListAPI;
            final loading = api.isLoading.value;
            final product = api.productListData;
            // final List productList = product['data'] ?? [];
            final List productList = product;

            if (loading) {
              return Expanded(child: Center(child: shimmerGrid()));
            }

            if (product.isEmpty || productList.isEmpty) {
              return Expanded(
                child: Center(child: Lottie.asset(AppJson.noData)),
              );
            }

            return Expanded(
              child: horizontalPadding(
                child: Column(
                  children: [
                    listController(
                      productList,
                      scrollController,
                      isLoadMore: api.isLoadMore.value,
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        vertical: Get.height * 0.02,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
