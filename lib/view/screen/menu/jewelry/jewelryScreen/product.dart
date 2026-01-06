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
              return Expanded(
                child: Center(child: shimmerGrid()),
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
                    mainAxisExtent: 330,
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

                    // Extract unique shape names
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

                    // Combine metalStamp and metalType
                    final List
                    combinedMetal = product['childProduct'].cast<Map>().expand((item) {
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

                    final List<Map<String, dynamic>> carat = {
                      for (final child in (product['childProduct'] as List? ?? []))
                        for (final stamp in (child['metalStamp'] as List? ?? []))
                          stamp['_id']: {
                            'carat': stamp['slug'] ?? stamp['paraMtrName'] ?? '',
                            'caratId': stamp['_id'],
                          },
                    }.values.toList();

                    // Format price
                    final double priceValue = (finalPrice as num?)?.toDouble() ?? 0.0;
                    final String priceText = priceValue.toStringAsFixed(2);

                    // Shape
                    Widget buildShape() => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: uniqueShapeList.map((shape) {
                          final name = shape['shapeName'] ?? '';
                          if (name.isEmpty) return const SizedBox();
                          return showContainer(
                            name: name,
                            bgColor: AppColor.gray,
                          );
                        }).toList(),
                      ),
                    );

                    // Build metal stamps
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

                          return showContainer(
                            name: name,
                            bgColor: bgColor,
                          );
                        }).toList(),
                      ),
                    );

                    // Build total wgt
                    Widget buildTotalWgt() {
                      final uniqueTotalWgt = {
                        for (final item in childProducts)
                          item['totalWgt']?.toString(): item,
                      }.keys.toList();
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: uniqueTotalWgt.map<Widget>((wgt) {
                            return showContainer(
                              name: wgt.toString(),
                              bgColor: AppColor.gray,
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
                          (images.isNotEmpty && (images.first['zoom'] ?? '').isNotEmpty)
                              ? Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.network(
                              images.first['zoom'],
                              fit: BoxFit.cover,

                              // 👇 shows loader while downloading
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                );
                              },

                              // 👇 shows icon if image fails (Broken pipe, 404, etc.)
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
                              : const SizedBox(),

                          (productTitle.isNotEmpty)
                              ? productName(productTitle)
                              : SizedBox(),

                          (priceText.isNotEmpty)
                              ? price(priceText)
                              : SizedBox(),

                          (shapeList.isNotEmpty)
                              ? Row(
                                  children: [
                                    information('Shape'),
                                    Expanded(child: buildShape()),
                                  ],
                                )
                              : SizedBox(),

                          (metalStamp.isNotEmpty)
                              ? Row(
                                  children: [
                                    information('Metal'),
                                    Expanded(child: buildMetalStamps()),
                                  ],
                                )
                              : SizedBox(),

                          (carat.isNotEmpty)
                              ? Row(
                                  children: [
                                    information('Carat'),
                                    Expanded(child: buildTotalWgt()),
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
