// ignore_for_file: unnecessary_type_check, unused_local_variable, deprecated_member_use

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList/productList_Controller.dart';
import 'package:classic/controller/user_Interface/menu/jewelry/filter_Controller.dart';
import 'package:classic/controller/user_Interface/menu/jewelry/productUI_Controller.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/filter.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/jewelryBody.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productbody.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/noDada.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/widget/horizontalpaddind.dart';

class Product extends StatelessWidget {
  final searchUIController = Get.put(ProductSerchController());
  final productListAPI = Get.put(ProductlistController(), permanent: true);
  final filter = Get.put(FilterUIController());
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
    this.priceShort = '1',
  });

  @override
  Widget build(BuildContext context) {
    final ProductAPICall apiController = Get.put(
      ProductAPICall(
        categoryId: categoryId,
        subCategoryId: subCategoryId,
        metalType: metalType,
        metalStamp: metalStamp,
        shape: shape,
        settingType: settingType,
        minPrice: minPrice,
        priceShort: priceShort,
      ),
    );
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        apiController.loadNextPage();
      }
    });
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        filter.reset(categoryId, categoryName);
        Get.back();
      },
      child: Fullscreen(
        appBar: allOtherScreen(
          onTapLeft: () {
            filter.reset(categoryId, categoryName);
            Get.back();
          },
          categoryName.toUpperCase(),
          cart: true,
        ),

        //Item List
        child: Column(
          children: [
            Expanded(
              flex: 13,
              child: Column(
                children: [
                  search(
                    searchController,
                    onChanged: (value) {
                      searchUIController.onSearchChanged(value);
                    },
                    filtertab: () {
                      bottomStyle(
                        context,
                        categoryId: categoryId,
                        categoryName: categoryName,
                      );
                    },
                  ),
                  Obx(() {
                    final api = productListAPI;
                    final loading = api.isLoading.value;
                    final product = api.productListData;
                    final List productList =
                        searchUIController.filteredProducts;
                    // final List productList = product['data'] ?? [];
                    // final List productList = product;

                    if (loading) {
                      return Expanded(child: Center(child: shimmerGrid()));
                    }

                    if (product.isEmpty || productList.isEmpty) {
                      return noData();
                    }

                    return Expanded(
                      child: horizontalPadding(
                        child: Column(
                          children: [
                            listController(
                              categoryId,
                              productList,
                              scrollController,
                              isLoadMore: api.isLoadMore.value,
                            ),
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: Get.height * 0.01,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),

            //Bottom Filters
            Expanded(
              flex: 1,
              child: filterBottom(
                filtersOnTap: () => filterFun(context, categoryId: categoryId),
                sortOnTap: () => shortFun(context, filter),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
