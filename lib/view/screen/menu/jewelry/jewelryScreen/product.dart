import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList_Controller.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/filter.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productbody.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../utils/app_String.dart';
import '../../../../utils/app_URL.dart';
import '../../../../utils/widget/horizontalpaddind.dart';
import '../jewelryExtraWidget/product.dart';
import '../jewelryWidget/body/productbody.dart';

// class Product extends StatelessWidget {
//   final productListAPI = Get.put(ProductlistController());
//   final String categoryId;
//   final String categoryName;
//   final String? subCategoryId;
//   final String? metalType;
//   final String? metalStamp;
//   final String? shape;
//   final String? settingType;
//   final String? minPrice;
//   final String? priceShort;
//
//   Product({
//     super.key,
//     required this.categoryId,
//     required this.categoryName,
//     this.subCategoryId,
//     this.metalType,
//     this.metalStamp,
//     this.shape,
//     this.settingType,
//     this.minPrice,
//     this.priceShort,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     productListAPI.productList(categoryId: categoryId);
//     final searchController = TextEditingController();
//     return Fullscreen(
//       appBar: allOtherScreen(categoryName.toUpperCase(), cart: true),
//       child: Column(
//         children: [
//           search(searchController, filtertab: () => Get.to(() => Filter())),
//           Obx(() {
//             final loading = productListAPI.isLoading.value;
//             final product = productListAPI.productListData;
//             final prdoductList = product['data'];
//             // 1️⃣ Loading state
//             if (loading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//
//             // 2️⃣ Empty data state
//             if (product.isEmpty ||
//                 prdoductList == null ||
//                 prdoductList.isEmpty) {
//               return const Center(child: Text('No products found'));
//             }
//
//             // 3️⃣ Success state
//             return Expanded(
//               child: horizontalPadding(
//                 child: GridView.builder(
//                   itemCount: prdoductList.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: Get.width * 0.04,
//                     mainAxisSpacing: Get.width * 0.04,
//                     mainAxisExtent: 340,
//                   ),
//                   itemBuilder: (_, index) {
//                     final product = prdoductList[index];
//                     final List childProducts = product['childProduct'] ?? [];
//
//                     if (childProducts.isEmpty) {
//                       return const SizedBox();
//                     }
//
//                     // 🔑 Per-product controller (VERY IMPORTANT)
//                     final variantController = Get.put(
//                       ProductVariantController(),
//                       tag: product['_id'],
//                     );
//
//                     variantController.initDefault(childProducts);
//
//                     return Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColor.gray),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Obx(() {
//                           final item = variantController.selectedVariant.value;
//                           final images = item?['images'] ?? [];
//
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               /// IMAGE
//                               Image.network(
//                                 images.isNotEmpty ? images.first['zoom'] : '',
//                                 height: 120,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (_, __, ___) => const SizedBox(
//                                   height: 120,
//                                   child: Center(child: Text('No Image')),
//                                 ),
//                               ),
//
//                               const SizedBox(height: 6),
//
//                               /// TITLE
//                               productName(
//                                 item?['productTitle']?.toString().substring(
//                                       0,
//                                       item['productTitle'].length > 35
//                                           ? 35
//                                           : item['productTitle'].length,
//                                     ) ??
//                                     '',
//                               ),
//
//                               /// PRICE
//                               price(
//                                 (double.tryParse('${item?['finalPrice']}') ?? 0)
//                                     .toStringAsFixed(2),
//                               ),
//
//                               const SizedBox(height: 6),
//
//
//
//                               // /// METAL STAMP (10k / 14k / 18k)
//                               // Wrap(
//                               //   spacing: 6,
//                               //   children: childProducts
//                               //       .map(
//                               //         (e) => e['metalStamp'][0]['paraMtrName'],
//                               //       )
//                               //       .toSet()
//                               //       .map((stamp) {
//                               //         final isSelected =
//                               //             variantController
//                               //                 .selectedStamp
//                               //                 .value ==
//                               //             stamp;
//                               //
//                               //         return GestureDetector(
//                               //           onTap: () => variantController
//                               //               .selectStamp(childProducts, stamp),
//                               //           child: Container(
//                               //             padding: const EdgeInsets.symmetric(
//                               //               horizontal: 8,
//                               //               vertical: 4,
//                               //             ),
//                               //             decoration: BoxDecoration(
//                               //               border: Border.all(
//                               //                 color: isSelected
//                               //                     ? AppColor.primary
//                               //                     : AppColor.gray,
//                               //               ),
//                               //               borderRadius: BorderRadius.circular(
//                               //                 4,
//                               //               ),
//                               //             ),
//                               //             child: Text(
//                               //               stamp,
//                               //               style: const TextStyle(
//                               //                 fontSize: 11,
//                               //               ),
//                               //             ),
//                               //           ),
//                               //         );
//                               //       })
//                               //       .toList(),
//                               // ),
//                               //
//                               // const SizedBox(height: 6),
//                               //
//                               // /// METAL COLOR (WG / RG / YG)
//                               // Wrap(
//                               //   spacing: 6,
//                               //   children: childProducts
//                               //       .map((e) => e['metalType'][0]['metal'])
//                               //       .toSet()
//                               //       .map((metal) {
//                               //         final isSelected =
//                               //             variantController
//                               //                 .selectedMetal
//                               //                 .value ==
//                               //             metal;
//                               //
//                               //         return GestureDetector(
//                               //           onTap: () => variantController
//                               //               .selectMetal(childProducts, metal),
//                               //           child: Container(
//                               //             padding: const EdgeInsets.symmetric(
//                               //               horizontal: 8,
//                               //               vertical: 4,
//                               //             ),
//                               //             decoration: BoxDecoration(
//                               //               border: Border.all(
//                               //                 color: isSelected
//                               //                     ? AppColor.primary
//                               //                     : AppColor.gray,
//                               //               ),
//                               //               borderRadius: BorderRadius.circular(
//                               //                 4,
//                               //               ),
//                               //             ),
//                               //             child: Text(
//                               //               metal.replaceAll(' Gold', ''),
//                               //               style: const TextStyle(
//                               //                 fontSize: 11,
//                               //               ),
//                               //             ),
//                               //           ),
//                               //         );
//                               //       })
//                               //       .toList(),
//                               // ),
//
//                               const SizedBox(height: 6),
//
//                               /// CARAT
//                               Row(
//                                 children: [
//                                   information('Carat'),
//                                   caratHowMany('${item?['totalWgt'] ?? 0}'),
//                                 ],
//                               ),
//                             ],
//                           );
//                         }),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

class Product extends StatelessWidget {
  final productListAPI = Get.put(ProductlistController());

  final String categoryId;
  final String categoryName;

  Product({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    productListAPI.productList(categoryId: categoryId);
    final searchController = TextEditingController();

    return Fullscreen(
      appBar: allOtherScreen(categoryName.toUpperCase(), cart: true),
      child: Column(
        children: [
          search(searchController, filtertab: () => Get.to(() => Filter())),

          /// PRODUCT LIST
          Obx(() {
            if (productListAPI.isLoading.value) {
              return const Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final product = productListAPI.productListData;
            final productList = product['data'] ?? [];

            if (productList.isEmpty) {
              return const Expanded(
                child: Center(child: Text('No products found')),
              );
            }

            return Expanded(
              child: horizontalPadding(
                child: GridView.builder(
                  itemCount: productList.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 340,
                  ),
                  itemBuilder: (_, index) {
                    final product = productList[index];
                    final List childProducts =
                        product['childProduct'] ?? [];

                    if (childProducts.isEmpty) {
                      return const SizedBox();
                    }

                    /// 🔑 Per-product controller
                    final variantController = Get.put(
                      ProductVariantController(),
                      tag: product['_id'],
                    );

                    variantController.initDefault(childProducts);

                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Obx(() {
                          final item =
                              variantController.selectedVariant.value;
                          final images = item?['images'] ?? [];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// IMAGE
                              Image.network(
                                images.isNotEmpty
                                    ? images.first['zoom']
                                    : '',
                                height: 120,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                const SizedBox(
                                  height: 120,
                                  child: Center(
                                      child: Text('No Image')),
                                ),
                              ),

                              const SizedBox(height: 6),

                              /// TITLE
                              productName(
                                item?['productTitle'] ?? '',
                              ),

                              /// PRICE
                              price(
                                (double.tryParse(
                                    '${item?['finalPrice']}') ??
                                    0)
                                    .toStringAsFixed(2),
                              ),

                              const SizedBox(height: 8),

                              /// 🔥 METAL COMBINATIONS
                              _MetalComboWidget(
                                variants: childProducts,
                                controller: variantController,
                              ),

                              const SizedBox(height: 8),

                              /// CARAT
                              Row(
                                children: [
                                  information('Carat'),
                                  caratHowMany(
                                      '${item?['totalWgt'] ?? 0}'),
                                ],
                              ),
                            ],
                          );
                        }),
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

class _MetalComboWidget extends StatelessWidget {
  final List variants;
  final ProductVariantController controller;

  const _MetalComboWidget({
    required this.variants,
    required this.controller,
  });

  String _comboText(String stamp, String metal) {
    if (metal.contains('White')) return '$stamp WG';
    if (metal.contains('Rose')) return '$stamp RG';
    if (metal.contains('Yellow')) return '$stamp YG';
    return '$stamp';
  }

  @override
  Widget build(BuildContext context) {
    final combos = variants
        .map((v) => _comboText(
      v['metalStamp'][0]['paraMtrName'],
      v['metalType'][0]['metal'],
    ))
        .toSet()
        .toList();

    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 6,
          children: combos.map((combo) {
            final isSelected =
                controller.selectedCombo.value == combo;

            return GestureDetector(
              onTap: () =>
                  controller.selectCombo(variants, combo),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? AppColor.primary
                        : AppColor.gray,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  combo,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? AppColor.primary
                        : AppColor.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}

class ProductVariantController extends GetxController {
  final RxString selectedCombo = ''.obs;
  final Rxn<Map<String, dynamic>> selectedVariant = Rxn();

  void initDefault(List variants) {
    if (variants.isEmpty) return;

    final first = variants.first;
    selectedVariant.value = first;

    final stamp = first['metalStamp'][0]['paraMtrName'];
    final metal = first['metalType'][0]['metal'];

    selectedCombo.value = _comboText(stamp, metal);
  }

  void selectCombo(List variants, String combo) {
    selectedCombo.value = combo;

    selectedVariant.value = variants.firstWhere(
          (v) => _comboText(
        v['metalStamp'][0]['paraMtrName'],
        v['metalType'][0]['metal'],
      ) ==
          combo,
      orElse: () => selectedVariant.value ?? variants.first,
    );
  }

  String _comboText(String stamp, String metal) {
    if (metal.contains('White')) return '$stamp WG';
    if (metal.contains('Rose')) return '$stamp RG';
    if (metal.contains('Yellow')) return '$stamp YG';
    return stamp;
  }
}

// class ProductVariantController extends GetxController {
//   final RxString selectedStamp = ''.obs;
//   final RxString selectedMetal = ''.obs;
//   final Rxn<Map<String, dynamic>> selectedVariant = Rxn();
//
//   void initDefault(List variants) {
//     if (variants.isEmpty) return;
//
//     final first = variants.first;
//     selectedVariant.value = first;
//     selectedStamp.value = first['metalStamp'][0]['paraMtrName'];
//     selectedMetal.value = first['metalType'][0]['metal'];
//   }
//
//   void selectStamp(List variants, String stamp) {
//     selectedStamp.value = stamp;
//     _filter(variants);
//   }
//
//   void selectMetal(List variants, String metal) {
//     selectedMetal.value = metal;
//     _filter(variants);
//   }
//
//   void _filter(List variants) {
//     selectedVariant.value = variants.firstWhere(
//           (v) =>
//       v['metalStamp'][0]['paraMtrName'] == selectedStamp.value &&
//           v['metalType'][0]['metal'] == selectedMetal.value,
//       orElse: () => selectedVariant.value ?? variants.first,
//     );
//   }
// }

// class Product extends StatelessWidget {
//   final jewellry = Get.put(JewelleryAPICall());
//   final List categoryId;
//   Product({super.key, required this.categoryId});
//   @override
//   Widget build(BuildContext context) {
//     final listItem = jewellry.categoryAPI.catagoryData['data'];
//     final searchController = TextEditingController();
//     return Fullscreen(
//       appBar: allOtherScreen(AppString.product, cart: true),
//       child: Column(
//         children: [
//           search(searchController, filtertab: () => Get.to(() => Filter())),
//       Expanded(
//         child: horizontalPadding(
//           child: GridView.builder(
//             itemCount: categoryId['subCategory'].length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: Get.width * 0.04,
//               mainAxisSpacing: Get.width * 0.04,
//               mainAxisExtent: 300,
//             ),
//             itemBuilder: (context, index) {
//               final item = categoryId[''][index];
// print(categoryId[index]['subCategory'][index]['slug']);
//               return Container(
//                 // child: Image.network(categoryId[index]['image']),
//               );
//             },
//           ),
//         ),
//       )],
//       ),
//     );
//   }
// }

// productList(
//   list: listItem['subCategory'],
//   onTapImagePath: (image) {
//     Get.to(() => ProductImage(image: image));
//   },
//   onTapProductDetail: (image, name, price) {
//     Get.to(
//           () => ProductDetail(image: image, name: name, price: price),
//     );
//   },
// ),
