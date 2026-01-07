// ignore_for_file: unused_local_variable

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList_Controller.dart';
import 'package:classic/controller/user_Interface/menu/jewelry/productUI_Controller.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/filter.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productbody.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/widget/horizontalpaddind.dart';
import '../jewelryExtraWidget/product.dart';

class Product extends StatelessWidget {
  final productListAPI = Get.put(ProductlistController());
  final searchController = TextEditingController();
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
    productListAPI.productList(
      categoryId: categoryId,
      pageNumber: '1',
      pageSize: '25',
    );
    return Fullscreen(
      appBar: allOtherScreen(categoryName.toUpperCase(), cart: true),
      child: Column(
        children: [
          search(searchController, filtertab: () => Get.to(() => Filter())),
          Obx(() {
            final api = productListAPI;
            final loading = api.isLoading.value;
            final product = api.productListData;
            final List productList = product['data'] ?? [];

            if (loading) {
              return Expanded(child: Center(child: shimmerGrid()));
            }

            if (product.isEmpty || productList.isEmpty) {
              return const Expanded(
                child: Center(child: Text('No products found')),
              );
            }

            return Expanded(
              child: horizontalPadding(
                child: GridView.builder(
                  itemCount: productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 330,
                  ),
                  itemBuilder: (context, index) {
                    final product = productList[index];
                    final List<Map<String, dynamic>> childProducts =
                        List<Map<String, dynamic>>.from(
                          product['childProduct'] ?? [],
                        );
                    final String productId = product['_id'] ?? 'product_$index';

                    final productControllerUI = Get.put(
                      ProductuiController(
                        productId: productId,
                        initialChildProducts: childProducts,
                      ),
                      tag: productId, // 🔥 REQUIRED
                    );

                    return productShowList(productControllerUI);
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}