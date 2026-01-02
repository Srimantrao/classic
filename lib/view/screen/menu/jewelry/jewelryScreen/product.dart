import 'dart:developer';

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList_Controller.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/filter.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productbody.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../utils/widget/horizontalpaddind.dart';
import '../jewelryExtraWidget/product.dart';


class Product extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  final String? subCategoryId;
  final String? metalType;
  final String? metalStamp;
  final String? shape;
  final String? settingType;
  final String? minPrice;
  final String? priceShort;

  const Product({
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
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final productListAPI = Get.put(ProductlistController());
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    productListAPI.productList(categoryId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(widget.categoryName.toUpperCase(), cart: true),
      child: Column(
        children: [
          search(searchController, filtertab: () => Get.to(() => Filter())),

          Obx(() {
            final api = productListAPI;
            final loading = api.isLoading.value;
            final product = api.productListData;
            final List productList = product['data'] ?? [];

            if (loading) {
              return const Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
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
                    mainAxisExtent: 340,
                  ),
                  itemBuilder: (context, index) {
                    final product = productList[index];
                    final List childProducts = product['childProduct'] ?? [];
                    var activeVariant = childProducts
                        .where((item) => item?['slug'] == product?['slug'])
                        .toList();
                    if (childProducts.isEmpty) {
                      return const SizedBox();
                    }
                    final List images = activeVariant[0]['images'] ?? [];
                    final String productTitle = activeVariant[0]['productTitle'] ?? '';
                    final double finalPrice = activeVariant[0]['finalPrice'];
                    final List metalStamp = activeVariant[0]['metalStamp'] ?? [];
                    final List<dynamic>combinedMetal = product['childProduct'].cast<Map>().expand((item) {
                      final metalStamps = (item['metalStamp'] as List? ?? []).cast<Map>();
                      final metalTypes = (item['metalType'] as List? ?? []).cast<Map>();
                      return [
                        for (var stamp in metalStamps)
                          for (var metal in metalTypes)
                            {
                              'metalStampId': stamp['_id'] ?? '',
                              'metalTypeId': metal['_id'] ?? '',
                              'combinedMetalName':
                                  '${stamp['paraMtrName'] ?? ''}${(stamp['paraMtrName'] != null && metal['metal'] != null) ? ' ' : ''}${metal['metal'] ?? ''}',
                              'param': stamp['paraMtrName'],
                            },
                      ];
                    }).toList();

                    final double priceValue = (finalPrice as num?)?.toDouble() ?? 0.0;
                    final String priceText = priceValue.toStringAsFixed(2);

                    Widget buildMetalStamps() => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: combinedMetal.map((stamp) {
                          final name = (stamp['param'] ?? '').toString();

                          // Conditional background color
                          Color bgColor;
                          if (stamp['combinedMetalName'].contains('White')) {
                            bgColor = Colors.grey.shade300; // grey for White
                          } else if (stamp['combinedMetalName'].contains(
                            'Rose',
                          )) {
                            bgColor = Colors.pink.shade200; // rose color
                          } else if (stamp['combinedMetalName'].contains(
                            'Yellow',
                          )) {
                            bgColor = Colors.yellow.shade200; // rose color
                          } else {
                            bgColor = Colors.white; // default
                          }

                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );

                    return Container(
                      padding:  EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (images.isNotEmpty)
                              ? Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.network(
                                    (images.first['zoom'] ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : SizedBox(),

                          (productTitle.isNotEmpty)
                              ? productName(productTitle)
                              : SizedBox(),

                          (priceText.isNotEmpty)
                              ? price(priceText)
                              : SizedBox(),

                          (metalStamp.isNotEmpty)
                              ? Row(
                                  children: [
                                    information('Metal'),
                                    Expanded(child: buildMetalStamps()),
                                  ],
                                )
                              : SizedBox(),
                        ],
                      ),
                    );
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
