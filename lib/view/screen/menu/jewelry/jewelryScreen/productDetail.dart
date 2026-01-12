// ignore_for_file: file_names, avoid_print, unnecessary_null_comparison

import 'dart:developer';

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail_Controller.dart';
import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productDetail.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import '../../../../utils/app_Color.dart';
import '../../../../utils/widget/bottomNavigationButton.dart';
import '../jewelryExtraWidget/productDetail.dart';

class ProductDetail extends StatelessWidget {
  final productDetail = Get.put(ProductdetailuiController());
  final productDetailAPI = Get.put(ProductdetailController());
  final productDetailController = Get.put(ProductDetailController());
  final products = Lisofproduct();
  final String slug;

  ProductDetail({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    productDetailAPI.prductDetail(slug);

    return Fullscreen(
      appBar: allOtherScreen(AppString.productDetail, cart: true),
      bottomNavigationBar: buttonNavigation(
        child: button(
          AppString.addtoCart,
          isLowercase: true,
          bottomBottonFontSize: true,
        ),
      ),
      child: SingleChildScrollView(
        child: Obx(() {
          final api = productDetailAPI;

          if (api.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final productData = api.prdoctdetailData['data'];

          final List<Map<String, dynamic>> childProducts =
              (productData['childProduct'] as List)
                  .map((e) => Map<String, dynamic>.from(e))
                  .toList();

          /// ACTIVE VARIANT
          final activeVariant = childProducts.firstWhere(
            (p) =>
                p['slug'] == productDetailController.selectedVariantSlug.value,
            orElse: () => childProducts.first,
          );

          /// ✅ CURRENT VALUES (FIXED)
          final currentShape =
              activeVariant['productStoneDetails']?[0]?['shape']?['paraMtrName']
                  ?.toString() ??
              '';

          final currentMetalStamp =
              activeVariant['metalStamp']?[0]?['paraMtrName']?.toString() ?? '';

          final currentMetalType =
              activeVariant['metalType']?[0]?['metal']?.toString() ?? '';

          final currentCarat = activeVariant['totalWgt']?.toString() ?? '';

          /// ---------- UNIQUE OPTIONS ----------
          final List<Map<String, dynamic>> uniqueShapes = {
            for (var p in childProducts)
              p['productStoneDetails'][0]['shape']['paraMtrName']:
                  Map<String, dynamic>.from(
                    p['productStoneDetails'][0]['shape'],
                  ),
          }.values.toList();

          final List<Map<String, dynamic>> uniqueMetalStamp = {
            for (var p in childProducts)
              p['metalStamp'][0]['paraMtrName']: Map<String, dynamic>.from(
                p['metalStamp'][0],
              ),
          }.values.toList();

          final List<Map<String, dynamic>> uniqueMetalType = {
            for (var p in childProducts)
              p['metalType'][0]['metal']: Map<String, dynamic>.from(
                p['metalType'][0],
              ),
          }.values.toList();

          final uniqueCaratList = {
            for (var p in childProducts)
              p['totalWgt'].toString(): {'totalWgt': p['totalWgt']},
          }.values.toList();

          Get.put(ImageController(activeVariant['images']));

          return Column(
            children: [
              imageContainer(
                Get.find<ImageController>(),
                activeVariant['images'],
              ),

              productDetailsPrice(
                activeVariant['productTitle'],
                activeVariant['finalPrice'].toString(),
                activeVariant['itemCode'],
              ),

              /// SHAPE
              (currentShape.isNotEmpty)
                  ? commonHorizontalList(
                      title: AppString.shape,
                      list: uniqueShapes,
                      textKey: 'paraMtrName',
                      compareKey: 'paraMtrName',
                      selectedValue: currentShape,
                      onItemSelected: (s) {
                        final v = productDetailController.findMatchingVariant(
                          childProducts: childProducts,
                          shape: s['paraMtrName'],
                          metalStamp: currentMetalStamp,
                          metalType: currentMetalType,
                          carat: currentCarat,
                        );
                        productDetailController.updateSelectedVariant(
                          v['slug'],
                        );
                      },
                    )
                  : SizedBox(),

              /// METAL STAMP
              (currentMetalStamp.isNotEmpty)
                  ? commonHorizontalList(
                      title: AppString.metalStamp,
                      list: uniqueMetalStamp,
                      textKey: 'paraMtrName',
                      compareKey: 'paraMtrName',
                      selectedValue: currentMetalStamp,
                      onItemSelected: (s) {
                        final v = productDetailController.findMatchingVariant(
                          childProducts: childProducts,
                          shape: currentShape,
                          metalStamp: s['paraMtrName'],
                          metalType: currentMetalType,
                          carat: currentCarat,
                        );
                        productDetailController.updateSelectedVariant(
                          v['slug'],
                        );
                      },
                    )
                  : SizedBox(),

              /// METAL TYPE
              (currentMetalType.isNotEmpty)
                  ? commonHorizontalList(
                      title: AppString.metalType,
                      list: uniqueMetalType,
                      textKey: 'metal',
                      compareKey: 'metal',
                      selectedValue: currentMetalType,
                      onItemSelected: (s) {
                        final v = productDetailController.findMatchingVariant(
                          childProducts: childProducts,
                          shape: currentShape,
                          metalStamp: currentMetalStamp,
                          metalType: s['metal'],
                          carat: currentCarat,
                        );
                        productDetailController.updateSelectedVariant(
                          v['slug'],
                        );
                      },
                    )
                  : SizedBox(),

              /// CARAT
              (currentCarat.isNotEmpty)
                  ? commonHorizontalList(
                      title: AppString.carat,
                      list: uniqueCaratList,
                      textKey: 'totalWgt',
                      compareKey: 'totalWgt',
                      selectedValue: currentCarat,
                      onItemSelected: (s) {
                        final v = productDetailController.findMatchingVariant(
                          childProducts: childProducts,
                          shape: currentShape,
                          metalStamp: currentMetalStamp,
                          metalType: currentMetalType,
                          carat: s['totalWgt'].toString(),
                        );
                        productDetailController.updateSelectedVariant(
                          v['slug'],
                        );
                      },
                    )
                  : SizedBox(),

              // Remark
              productDetailsRemark(productDetail.remarkController),

              // Bracelet Size
              braceletSize(productDetail),

              // Engraving
              engraving(productDetail, productDetail.engravingController),

              // Quantity
              quantity(
                value: productDetail.qtyValue.value,
                onTapDecrimant: productDetail.decrementQty,
                onTapIncrimant: productDetail.incrementQty,
              ),

              // Metal & CenterStone Detail
              productmetalDetails(
                productCodeValue: activeVariant['itemCode'] ?? 'N/A',
                metalValue: currentMetalType.isNotEmpty
                    ? currentMetalType
                    : 'N/A',
                heightValue: '-',
                widthValue: '-',
                productWeightValue: '$currentCarat Gram',
                color: 'D',
                // You should extract this from your data
                clarity: 'SI1',
                // You should extract this from your data
                shape: currentShape.isNotEmpty ? currentShape : 'N/A',
                wgt: '$currentCarat Gram',
                pieces: '1',
                // You should extract this from your data
                metalDetail: productDetail.metalDetail.value,
                stoneDetail: productDetail.stoneDetail.value,
                onTapMetal: productDetail.metalDetails,
                onTapStone: productDetail.stoneDetails,
              ),

              // Like
              listLike(product: products.product),
            ],
          );
        }),
      ),
    );
  }
}

// class ProductDetailController extends GetxController {
//   final selectedVariantSlug = ''.obs;
//
//   // Store current selections for each attribute
//   final currentSelections = {
//     'shape': ''.obs,
//     'metalStamp': ''.obs,
//     'metalType': ''.obs,
//     'carat': ''.obs,
//   }.obs;
//
//   final hasInitializedSelections = false.obs;
//
//   // Initialize selections from a variant
//   void initializeSelections({
//     required String shape,
//     required String metalStamp,
//     required String metalType,
//     required String carat,
//   }) {
//     currentSelections['shape']?.value = shape;
//     currentSelections['metalStamp']?.value = metalStamp;
//     currentSelections['metalType']?.value = metalType;
//     currentSelections['carat']?.value = carat;
//     hasInitializedSelections.value = true;
//   }
//
//   // Update a specific selection
//   void updateSelection(String key, String value) {
//     if (currentSelections.containsKey(key)) {
//       currentSelections[key]?.value = value;
//     }
//   }
//
//   // Get current value of a selection
//   String getSelection(String key) {
//     return currentSelections[key]?.value ?? '';
//   }
//
//   // Update variant
//   void updateSelectedVariant(String slug) {
//     selectedVariantSlug.value = slug;
//   }
//
//   // Get all current selections as a map
//   Map<String, String> getAllSelections() {
//     return {
//       'shape': currentSelections['shape']?.value ?? '',
//       'metalStamp': currentSelections['metalStamp']?.value ?? '',
//       'metalType': currentSelections['metalType']?.value ?? '',
//       'carat': currentSelections['carat']?.value ?? '',
//     };
//   }
//
//   // Reset selections
//   void resetSelections() {
//     currentSelections.forEach((key, value) {
//       value.value = '';
//     });
//     hasInitializedSelections.value = false;
//   }
// }

class ProductDetailController extends GetxController {
  final productDetailAPI = Get.put(ProductdetailController());

  final selectedVariantSlug = RxString('');

  @override
  void onInit() {
    super.onInit();

    /// ⚠️ sirf FIRST TIME hi default slug set hoga
    ever(productDetailAPI.prdoctdetailData, (data) {
      if (selectedVariantSlug.value.isNotEmpty) return;

      if (data != null && data['data'] != null) {
        final childProducts = (data['data']['childProduct'] as List)
            .map((e) => Map<String, dynamic>.from(e))
            .toList();

        if (childProducts.isNotEmpty) {
          selectedVariantSlug.value = childProducts[0]['slug'];
        }
      }
    });
  }

  void updateSelectedVariant(String slug) {
    selectedVariantSlug.value = slug;
  }

  /// 🔥 COMBINATION MATCHING (MOST IMPORTANT)
  Map<String, dynamic> findMatchingVariant({
    required List<Map<String, dynamic>> childProducts,
    String? shape,
    String? metalStamp,
    String? metalType,
    String? carat,
  }) {
    return childProducts.firstWhere((product) {
      final pShape =
          product['productStoneDetails']?[0]?['shape']?['paraMtrName'];
      final pStamp = product['metalStamp']?[0]?['paraMtrName'];
      final pMetal = product['metalType']?[0]?['metal'];
      final pCarat = product['totalWgt']?.toString();

      return (shape == null || shape == pShape) &&
          (metalStamp == null || metalStamp == pStamp) &&
          (metalType == null || metalType == pMetal) &&
          (carat == null || carat == pCarat);
    }, orElse: () => childProducts.first);
  }
}

Widget imageContainer(ImageController imageController, image) {
  return Column(
    children: [
      imageViwe(imageController),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.009)),
      selectImage(imageController, image),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.009)),
    ],
  );
}

Widget imageViwe(ImageController imageController) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: AppColor.secondary)),
      color: AppColor.gray,
    ),
    child: InteractiveViewer(
      panEnabled: true,
      minScale: 1.0,
      maxScale: 4.0,
      child:
          (imageController.selectedImage == null ||
              imageController.selectedImage.isEmpty)
          ? Center(child: Icon(Icons.image_not_supported, color: Colors.grey))
          : Image.network(
              imageController.selectedImage,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(Icons.image_not_supported, color: Colors.grey),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
            ),
    ),
  );
}

Widget selectImage(ImageController imageController, image) {
  return horizontalPadding(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: Get.width),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(image.length, (index) {
              final img = image[index]['zoom'];
              return GestureDetector(
                onTap: () => imageController.changeImage(index),
                child: Container(
                  margin: EdgeInsets.only(right: Get.width * 0.015),
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.secondary),
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    ),
  );
}

Widget commonHorizontalList({
  required String title,
  required List<Map<String, dynamic>> list,
  required String textKey,
  EdgeInsets? margin,
  Function(Map<String, dynamic>)? onItemSelected,
  required String
  compareKey, // Key to compare for selection (e.g., 'paraMtrName', 'metal', etc.)
  required dynamic
  selectedValue, // Current selected value for this specific list
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.006),
    child: horizontalPadding(
      child: Row(
        children: [
          productDetailsubHedding('$title :- '),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(list.length, (index) {
                  final item = list[index];
                  final value = (item is Map && item.containsKey(textKey))
                      ? item[textKey]
                      : '';

                  // Check if this item is selected
                  bool isSelected = false;
                  if (compareKey == 'totalWgt') {
                    // For carat, we compare by totalWgt value
                    isSelected =
                        item[compareKey].toString() == selectedValue.toString();
                  } else {
                    isSelected = item[compareKey] == selectedValue;
                  }

                  return GestureDetector(
                    onTap: () {
                      if (onItemSelected != null) {
                        onItemSelected(item);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          borderradius.buttonboder,
                        ),
                        border: Border.all(
                          color: isSelected
                              ? AppColor.primary
                              : AppColor.secondary,
                          width: isSelected ? 1 : 1,
                        ),
                        color: isSelected
                            ? AppColor.secondary.withOpacity(0.3)
                            : Colors.transparent,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.025,
                        vertical: Get.height * 0.005,
                      ),
                      margin:
                          margin ??
                          EdgeInsets.symmetric(horizontal: Get.width * 0.009),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          color: isSelected ? AppColor.primary : Colors.black,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class ImageController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final List imageList;

  ImageController(this.imageList);

  String get selectedImage => imageList[selectedIndex.value]['zoom'];

  void changeImage(int index) {
    selectedIndex.value = index;
  }
}
