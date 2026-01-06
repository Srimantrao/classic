// ignore_for_file: unused_local_variable

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList_Controller.dart';
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

  Map<String, String> selectedVariants = {};
  Map<String, String> selectedShapes = {};

  @override
  void initState() {
    super.initState();
    productListAPI.productList(
      categoryId: widget.categoryId,
      pageNumber: '1',
      pageSize: '25',
    );
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
                    final List childProducts = product['childProduct'] ?? [];
                    final String productId = product['_id'] ?? 'product_$index';

                    // Get currently selected variant slug or use first one
                    final String selectedSlug =
                        selectedVariants[productId] ??
                        (childProducts.isNotEmpty
                            ? childProducts[0]['slug']
                            : '');

                    // Find active variant based on selection
                    var activeVariant = childProducts
                        .where((item) => item?['slug'] == selectedSlug)
                        .toList();

                    // Fallback to first variant if selected not found
                    if (activeVariant.isEmpty && childProducts.isNotEmpty) {
                      activeVariant = [childProducts[0]];
                      selectedVariants[productId] = childProducts[0]['slug'];
                    }

                    if (childProducts.isEmpty || activeVariant.isEmpty) {
                      return const SizedBox();
                    }

                    // Extract data from active variant
                    final List images = activeVariant[0]['images'] ?? [];
                    final String productTitle =
                        activeVariant[0]['productTitle'] ?? '';
                    final double finalPrice =
                        activeVariant[0]['finalPrice']?.toDouble() ?? 0.0;

                    // Extract unique shape names from all child products
                    final List<Map<String, dynamic>> shapeList = [];
                    for (final item in childProducts) {
                      final List stoneDetails = item['stoneDetails'] ?? [];
                      for (final stone in stoneDetails) {
                        final shape = stone['shape'];
                        if (shape != null && shape['paraMtrName'] != null) {
                          shapeList.add({
                            'shapeId': shape['_id'],
                            'shapeName': shape['paraMtrName'],
                          });
                        }
                      }
                    }
                    final Set<String> added = {};
                    final List<Map<String, dynamic>> uniqueShapeList = [];
                    for (final s in shapeList) {
                      final name = s['shapeName'];
                      if (!added.contains(name)) {
                        added.add(name);
                        uniqueShapeList.add(s);
                      }
                    }

                    // Combine metalStamp and metalType from ALL child products
                    final List<Map<String, dynamic>>
                    combinedMetal = childProducts.cast<Map>().expand((item) {
                      final metalStamps = (item['metalStamp'] as List? ?? [])
                          .cast<Map>();
                      final metalTypes = (item['metalType'] as List? ?? [])
                          .cast<Map>();
                      final String itemSlug = item['slug'] ?? '';

                      return [
                        for (var stamp in metalStamps)
                          for (var metal in metalTypes)
                            {
                              'slug': itemSlug,
                              'metalStampId': stamp['_id'] ?? '',
                              'metalTypeId': metal['_id'] ?? '',
                              'combinedMetalName':
                                  '${stamp['paraMtrName'] ?? ''}${(stamp['paraMtrName'] != null && metal['metal'] != null) ? ' ' : ''}${metal['metal'] ?? ''}',
                              'param': stamp['paraMtrName'],
                            },
                      ];
                    }).toList();

                    // Extract carat options
                    final List<Map<String, dynamic>> carat = {
                      for (final child in childProducts)
                        for (final stamp
                            in (child['metalStamp'] as List? ?? []))
                          stamp['_id']: {
                            'carat':
                                stamp['slug'] ?? stamp['paraMtrName'] ?? '',
                            'caratId': stamp['_id'],
                          },
                    }.values.toList();

                    // Format price
                    final String priceText = finalPrice.toStringAsFixed(2);

                    // Helper function to handle variant selection
                    void selectVariant(String slug) {
                      setState(() {
                        selectedVariants[productId] = slug;
                      });

                      // Optional: Add animation or feedback
                      // HapticFeedback.lightImpact();
                    }

                    // Shape widget
                    Widget buildShape() => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: uniqueShapeList.map((shape) {
                          final name = shape['shapeName'] ?? '';
                          final shapeId = shape['shapeId'] ?? ''; // Changed from 'shape' to 'shapeId'

                          if (name.isEmpty) return const SizedBox();

                          final bool isSelected = selectedShapes[productId] == shapeId;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  // Deselect if already selected
                                  selectedShapes.remove(productId);
                                  // Reset variant selection to first
                                  if (childProducts.isNotEmpty) {
                                    selectedVariants[productId] = childProducts[0]['slug'];
                                  }
                                } else {
                                  // Select this shape
                                  selectedShapes[productId] = shapeId;

                                  // Find and select first variant with this shape
                                  final matchingVariant = childProducts.firstWhere(
                                        (item) {
                                      final stoneDetails = item['stoneDetails'] ?? [];
                                      return stoneDetails.any((stone) {
                                        final shapeData = stone['shape'];
                                        return shapeData != null &&
                                            shapeData['_id'] == shapeId;
                                      });
                                    },
                                    orElse: () => childProducts.isNotEmpty ? childProducts[0] : null,
                                  );

                                  if (matchingVariant != null) {
                                    selectedVariants[productId] = matchingVariant['slug'];
                                  }
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 4),
                              child: showContainer(
                                selectColor: isSelected ? AppColor.gray : null,
                                name: name,
                                bgColor: isSelected ? Colors.blue.shade50 : AppColor.gray,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );

                    // Build metal stamps with tap functionality
                    Widget buildMetalStamps() => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: combinedMetal.map((stamp) {
                          final name = (stamp['param'] ?? '').toString();
                          final String variantSlug = stamp['slug'];
                          final bool isSelected = selectedSlug == variantSlug;

                          // Conditional background color
                          Color bgColor;
                          if (stamp['combinedMetalName'].contains('White')) {
                            bgColor = Colors.grey.shade300;
                          } else if (stamp['combinedMetalName'].contains(
                            'Rose',
                          )) {
                            bgColor = Colors.pink.shade200;
                          } else if (stamp['combinedMetalName'].contains(
                            'Yellow',
                          )) {
                            bgColor = Colors.yellow.shade200;
                          } else {
                            bgColor = Colors.white;
                          }

                          return showContainer(
                            onTap: () => selectVariant(variantSlug),
                            name: name,
                            bgColor: bgColor,
                            selectColor: isSelected ? bgColor : null,
                          );
                        }).toList(),
                      ),
                    );

                    // Build total weight options
                    Widget buildTotalWgt() {
                      // First filter variants based on selected shape
                      List filteredVariants = childProducts;

                      // Apply shape filter if a shape is selected
                      if (selectedShapes[productId] != null) {
                        filteredVariants = childProducts.where((variant) {
                          final stoneDetails = variant['stoneDetails'] ?? [];
                          return stoneDetails.any((stone) {
                            final shape = stone['shape'];
                            return shape != null && shape['_id'] == selectedShapes[productId];
                          });
                        }).toList();
                      }

                      // If no variants match the filter, show all
                      if (filteredVariants.isEmpty) {
                        filteredVariants = childProducts;
                      }

                      // Group by total weight, but also ensure unique slugs
                      final Map<String, List<String>> weightOptions = {};
                      for (final item in filteredVariants) {
                        final wgt = item['totalWgt']?.toString();
                        final slug = item['slug'] ?? '';
                        if (wgt != null && slug.isNotEmpty) {
                          if (!weightOptions.containsKey(wgt)) {
                            weightOptions[wgt] = [];
                          }
                          weightOptions[wgt]!.add(slug);
                        }
                      }

                      final weightList = weightOptions.keys.toList();

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: weightList.map<Widget>((wgt) {
                            final slugs = weightOptions[wgt] ?? [];
                            final bool isSelected = slugs.contains(selectedSlug);

                            return showContainer(
                              onTap: () {
                                if (slugs.isNotEmpty) {
                                  // Select the first variant with this weight
                                  selectVariant(slugs[0]);
                                }
                              },
                              name: wgt.toString(),
                              bgColor: AppColor.gray,
                              selectColor: isSelected ? AppColor.gray : null,
                            );
                          }).toList(),
                        ),
                      );
                    }

                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray),
                        borderRadius: BorderRadius.circular(
                          borderradius.buttonboder,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image with loading and error handling
                          if (images.isNotEmpty &&
                              (images.first['zoom'] ?? '').isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.network(
                                images.first['zoom'],
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      );
                                    },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(
                                      Icons.broken_image,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            )
                          else
                            const SizedBox(),

                          // Product title
                          if (productTitle.isNotEmpty)
                            productName(productTitle),

                          // Price
                          if (priceText.isNotEmpty) price(priceText),

                          // Shape
                          if (uniqueShapeList.isNotEmpty)
                            Row(
                              children: [
                                information('Shape'),
                                Expanded(child: buildShape()),
                              ],
                            ),

                          // Metal stamps (now interactive)
                          if (combinedMetal.isNotEmpty)
                            Row(
                              children: [
                                information('Metal'),
                                Expanded(child: buildMetalStamps()),
                              ],
                            ),

                          // Carat/Weight options (now interactive)
                          if (carat.isNotEmpty)
                            Row(
                              children: [
                                information('Carat'),
                                Expanded(child: buildTotalWgt()),
                              ],
                            ),
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

Widget shimmerGrid() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: horizontalPadding(
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          mainAxisExtent: 335,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(borderradius.buttonboder),
            ),
          );
        },
      ),
    ),
  );
}

Widget showContainer({
  required String name,
  required Color bgColor,
  Color? selectColor,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: Get.width * 0.01),
      child: Container(
        margin: EdgeInsets.only(right: Get.width * 0.02),
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.025,
          vertical: Get.width * 0.015,
        ),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: selectColor?.withOpacity(0.3),
          borderRadius: BorderRadius.circular(borderradius.buttonboder),
          border: Border.all(color: bgColor),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: Get.width * 0.03,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

// Expanded(
// child: horizontalPadding(
// child: GridView.builder(
// itemCount: productList.length,
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 12,
// crossAxisSpacing: 12,
// mainAxisExtent: 330,
// ),
// itemBuilder: (context, index) {
// final product = productList[index];
// final List childProducts = product['childProduct'] ?? [];
// var activeVariant = childProducts
//     .where((item) => item?['slug'] == product?['slug'])
//     .toList();
// if (childProducts.isEmpty) {
// return const SizedBox();
// }
// final List images = activeVariant[0]['images'] ?? [];
// final String productTitle = activeVariant[0]['productTitle'] ?? '';
// final double finalPrice = activeVariant[0]['finalPrice'];
// final List metalStamp = activeVariant[0]['metalStamp'] ?? [];
//
// // Extract unique shape names
// final List<Map<String, dynamic>> shapeList = [];
// for (final item in childProducts) {
// final List stoneDetails = item['stoneDetails'] ?? [];
// for (final stone in stoneDetails) {
// final shape = stone['shape'];
// if (shape != null && shape['paraMtrName'] != null) {
// shapeList.add({
// 'shapeId': shape['_id'],
// 'shapeName': shape['paraMtrName'],
// });
// }
// }
// }
// final Set<String> added = {};
// final List<Map<String, dynamic>> uniqueShapeList = [];
// for (final s in shapeList) {
// final name = s['shapeName'];
// if (!added.contains(name)) {
// added.add(name);
// uniqueShapeList.add(s);
// }
// }
//
// // Combine metalStamp and metalType
// final List
// combinedMetal = product['childProduct'].cast<Map>().expand((item) {
// final metalStamps = (item['metalStamp'] as List? ?? []).cast<Map>();
// final metalTypes = (item['metalType'] as List? ?? []).cast<Map>();
// return [
// for (var stamp in metalStamps)
// for (var metal in metalTypes)
// {
// 'slug' : stamp['slug'] ?? '',
// 'metalStampId': stamp['_id'] ?? '',
// 'metalTypeId': metal['_id'] ?? '',
// 'combinedMetalName':
// '${stamp['paraMtrName'] ?? ''}${(stamp['paraMtrName'] != null && metal['metal'] != null) ? ' ' : ''}${metal['metal'] ?? ''}',
// 'param': stamp['paraMtrName'],
// },
// ];
// }).toList();
//
// final List<Map<String, dynamic>> carat = {
// for (final child in (product['childProduct'] as List? ?? []))
// for (final stamp in (child['metalStamp'] as List? ?? []))
// stamp['_id']: {
// 'carat': stamp['slug'] ?? stamp['paraMtrName'] ?? '',
// 'caratId': stamp['_id'],
// },
// }.values.toList();
//
// // Format price
// final double priceValue = (finalPrice as num?)?.toDouble() ?? 0.0;
// final String priceText = priceValue.toStringAsFixed(2);
//
// // Shape
// Widget buildShape() => SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: uniqueShapeList.map((shape) {
// final name = shape['shapeName'] ?? '';
// if (name.isEmpty) return const SizedBox();
// return showContainer(
// name: name,
// bgColor: AppColor.gray,
// );
// }).toList(),
// ),
// );
//
// // Build metal stamps
// Widget buildMetalStamps() => SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: combinedMetal.map((stamp) {
// final name = (stamp['param'] ?? '').toString();
//
// // Conditional background color
// Color bgColor;
// if (stamp['combinedMetalName'].contains('White')) {
// bgColor = Colors.grey.shade300; // grey for White
// } else if (stamp['combinedMetalName'].contains('Rose')) {
// bgColor = Colors.pink.shade200; // rose color
// } else if (stamp['combinedMetalName'].contains('Yellow')) {
// bgColor = Colors.yellow.shade200; // rose color
// } else {
// bgColor = Colors.white; // default
// }
//
// return showContainer(
// onTap: (){
//
// },
// name: name,
// bgColor: bgColor,
// );
// }).toList(),
// ),
// );
//
// // Build total wgt
// Widget buildTotalWgt() {
// final uniqueTotalWgt = {
// for (final item in childProducts)
// item['totalWgt']?.toString(): item,
// }.keys.toList();
// return SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: uniqueTotalWgt.map<Widget>((wgt) {
// return showContainer(
// name: wgt.toString(),
// bgColor: AppColor.gray,
// );
// }).toList(),
// ),
// );
// }
//
// return Container(
// padding: EdgeInsets.all(10),
// decoration: BoxDecoration(
// border: Border.all(color: AppColor.gray),
// borderRadius: BorderRadius.circular(
// borderradius.buttonboder,
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// (images.isNotEmpty && (images.first['zoom'] ?? '').isNotEmpty)
// ? Padding(
// padding: const EdgeInsets.all(5),
// child: Image.network(
// images.first['zoom'],
// fit: BoxFit.cover,
//
// // 👇 shows loader while downloading
// loadingBuilder: (context, child, loadingProgress) {
// if (loadingProgress == null) return child;
// return const Center(
// child: CircularProgressIndicator(strokeWidth: 2),
// );
// },
//
// // 👇 shows icon if image fails (Broken pipe, 404, etc.)
// errorBuilder: (context, error, stackTrace) {
// return const Center(
// child: Icon(
// Icons.broken_image,
// size: 40,
// color: Colors.grey,
// ),
// );
// },
// ),
// )
//     : const SizedBox(),
//
// (productTitle.isNotEmpty)
// ? productName(productTitle)
//     : SizedBox(),
//
// (priceText.isNotEmpty)
// ? price(priceText)
//     : SizedBox(),
//
// (shapeList.isNotEmpty)
// ? Row(
// children: [
// information('Shape'),
// Expanded(child: buildShape()),
// ],
// )
//     : SizedBox(),
//
// (metalStamp.isNotEmpty)
// ? Row(
// children: [
// information('Metal'),
// Expanded(child: buildMetalStamps()),
// ],
// )
//     : SizedBox(),
//
// (carat.isNotEmpty)
// ? Row(
// children: [
// information('Carat'),
// Expanded(child: buildTotalWgt()),
// ],
// )
//     : SizedBox(),
// ],
// ),
// );
// },
// ),
// ),
// );
