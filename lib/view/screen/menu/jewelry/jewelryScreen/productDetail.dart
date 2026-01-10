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
          final loading = api.isLoading.value;

          if (loading) {
            return Center(child: CircularProgressIndicator());
          }

          final detailData = api.prdoctdetailData;
          final productData = detailData['data'];

          final List<Map<String, dynamic>> childProducts =
              (productData['childProduct'] as List)
                  .map((e) => Map<String, dynamic>.from(e))
                  .toList();

          // Get the currently selected variant
          final productDetail = Get.find<ProductDetailController>();
          final activeVariantSlug = productDetail.selectedVariantSlug.value;

          // Find active variant or use first one
          final activeVariant = childProducts.firstWhere(
            (product) => product['slug'] == activeVariantSlug,
            orElse: () => childProducts[0],
          );
          log(activeVariantSlug);

          // Prepare data for each section

          // 1. SHAPE - ALL variants से unique shapes
          final List<Map<String, dynamic>> allShapes = childProducts
              .expand(
                (product) => (product['productStoneDetails'] as List? ?? []),
              )
              .where((stoneDetail) => stoneDetail['shape'] != null)
              .map((e) => e['shape'] as Map<String, dynamic>)
              .where((shape) => shape['paraMtrName'] != null)
              .toList();

          final List<Map<String, dynamic>> uniqueShapes = {
            for (var shape in allShapes) shape['paraMtrName']: shape,
          }.values.toList();

          // CURRENT active variant का shape
          final currentShape =
              (activeVariant['productStoneDetails'] as List?)?.isNotEmpty ==
                  true
              ? ((activeVariant['productStoneDetails'] as List)[0]['shape']
                            as Map<String, dynamic>?) !=
                        null
                    ? ['paraMtrName'].toString() ?? ''
                    : ''
              : '';

          // 2. METAL STAMP - ALL variants से unique metal stamps
          final List<Map<String, dynamic>> allMetalStamp = childProducts
              .expand((product) => (product['metalStamp'] as List? ?? []))
              .where((stamp) => stamp['paraMtrName'] != null)
              .map((e) => e as Map<String, dynamic>)
              .toList();

          final List<Map<String, dynamic>> uniqueMetalStamp = {
            for (var s in allMetalStamp) s['paraMtrName']: s,
          }.values.toList();

          // CURRENT active variant का metal stamp
          final currentMetalStamp =
              (activeVariant['metalStamp'] as List?)?.isNotEmpty == true
              ? (activeVariant['metalStamp'] as List)[0]['paraMtrName']
                        ?.toString() ??
                    ''
              : '';

          // 3. METAL TYPE - ALL variants से unique metal types
          final List<Map<String, dynamic>> allMetalType = childProducts
              .expand((product) => (product['metalType'] as List? ?? []))
              .where((metal) => metal['metal'] != null)
              .map((e) => e as Map<String, dynamic>)
              .toList();

          final List<Map<String, dynamic>> uniqueMetalType = {
            for (var m in allMetalType) m['metal']: m,
          }.values.toList();

          // CURRENT active variant का metal type
          final currentMetalType =
              (activeVariant['metalType'] as List?)?.isNotEmpty == true
              ? (activeVariant['metalType'] as List)[0]['metal']?.toString() ??
                    ''
              : '';

          // 4. CARAT - यहाँ CHANGE किया है: सिर्फ CURRENT variant का carat show करें
          // (लेकिन selection के लिए सभी carat options दिखाएं)
          final List<Map<String, dynamic>> allCarats = childProducts
              .where((product) => product['totalWgt'] != null)
              .map(
                (e) => {
                  'totalWgt': e['totalWgt'],
                  'slug': e['slug'], // साथ में slug भी store करें
                },
              )
              .toList();

          // Unique carats for selection (duplicates remove)
          final List<Map<String, dynamic>> uniqueCaratList = {
            for (var item in allCarats) item['totalWgt'].toString(): item,
          }.values.toList();

          // CURRENT active variant का carat
          final currentCarat = activeVariant['totalWgt']?.toString() ?? '';

          // Functions to find matching variants
          findVariantByShape(Map<String, dynamic> selectedShape) {
            return childProducts.firstWhere((product) {
              final shapes = (product['productStoneDetails'] as List)
                  .map((e) => e['shape'] as Map<String, dynamic>)
                  .toList();
              return shapes.any(
                (shape) => shape['paraMtrName'] == selectedShape['paraMtrName'],
              );
            }, orElse: () => childProducts[0]);
          }

          findVariantByMetalStamp(Map<String, dynamic> selectedStamp) {
            return childProducts.firstWhere((product) {
              final stamps = product['metalStamp'] ?? [];
              return stamps.any(
                (stamp) => stamp['paraMtrName'] == selectedStamp['paraMtrName'],
              );
            }, orElse: () => childProducts[0]);
          }

          findVariantByMetalType(Map<String, dynamic> selectedMetal) {
            return childProducts.firstWhere((product) {
              final metals = product['metalType'] ?? [];
              return metals.any(
                (metal) => metal['metal'] == selectedMetal['metal'],
              );
            }, orElse: () => childProducts[0]);
          }

          findVariantByCarat(Map<String, dynamic> selectedCarat) {
            // Carat के लिए specific variant ढूंढें जिसका totalWgt match करे
            return childProducts.firstWhere(
              (product) =>
                  product['totalWgt'].toString() ==
                  selectedCarat['totalWgt'].toString(),
              orElse: () => childProducts[0],
            );
          }

          // Update image controller with active variant images
          Get.put(ImageController(activeVariant['images']));

          return Column(
            children: [
              // Product Image
              imageContainer(
                Get.find<ImageController>(),
                activeVariant['images'],
              ),

              // Details - Price, Title, etc.
              productDetailsPrice(
                activeVariant['productTitle'],
                activeVariant['finalPrice'].toString(),
                activeVariant['itemCode'],
              ),

              // Shape - Now shows ALL shapes from ALL variants
              if (uniqueShapes.isNotEmpty)
                commonHorizontalList(
                  title: AppString.shape,
                  list: uniqueShapes,
                  textKey: 'paraMtrName',
                  compareKey: 'paraMtrName',
                  selectedValue: currentShape,
                  onItemSelected: (selectedShape) {
                    final variant = findVariantByShape(selectedShape);
                    productDetail.updateSelectedVariant(variant['slug']);
                    // Update image controller
                    Get.delete<ImageController>();
                    Get.put(ImageController(variant['images']));
                  },
                ),

              // MetalStamp
              if (uniqueMetalStamp.isNotEmpty)
                commonHorizontalList(
                  title: AppString.metalStamp,
                  list: uniqueMetalStamp,
                  textKey: 'paraMtrName',
                  compareKey: 'paraMtrName',
                  selectedValue: currentMetalStamp,
                  onItemSelected: (selectedStamp) {
                    final variant = findVariantByMetalStamp(selectedStamp);
                    productDetail.updateSelectedVariant(variant['slug']);
                    // Update image controller
                    Get.delete<ImageController>();
                    Get.put(ImageController(variant['images']));
                  },
                ),

              // Metal Type
              if (uniqueMetalType.isNotEmpty)
                commonHorizontalList(
                  title: AppString.metalType,
                  list: uniqueMetalType,
                  textKey: 'metal',
                  compareKey: 'metal',
                  selectedValue: currentMetalType,
                  onItemSelected: (selectedMetal) {
                    final variant = findVariantByMetalType(selectedMetal);
                    productDetail.updateSelectedVariant(variant['slug']);
                    // Update image controller
                    Get.delete<ImageController>();
                    Get.put(ImageController(variant['images']));
                  },
                ),

              // Carat
              if (uniqueCaratList.isNotEmpty)
                commonHorizontalList(
                  title: AppString.carat,
                  list: uniqueCaratList,
                  textKey: 'totalWgt',
                  compareKey: 'totalWgt',
                  selectedValue: currentCarat,
                  onItemSelected: (selectedCarat) {
                    final variant = findVariantByCarat(selectedCarat);
                    productDetail.updateSelectedVariant(variant['slug']);
                    // Update image controller
                    Get.delete<ImageController>();
                    Get.put(ImageController(variant['images']));
                  },
                ),

              // Remark
              // productDetailsRemark(productDetail.remarkController),
              //
              // // Bracelet Size
              // braceletSize(productDetail),
              //
              // // Engraving
              // engraving(productDetail, productDetail.engravingController),
              //
              // // Quantity
              // quantity(
              //   value: productDetail.qtyValue.value,
              //   onTapDecrimant: productDetail.decrementQty,
              //   onTapIncrimant: productDetail.incrementQty,
              // ),
              //
              // // Metal & CenterStone Detail
              // productmetalDetails(
              //   productCodeValue: activeVariant['itemCode'] ?? 'N/A',
              //   metalValue: currentMetalType.isNotEmpty ? currentMetalType : 'N/A',
              //   heightValue: '-',
              //   widthValue: '-',
              //   productWeightValue: '${currentCarat} Gram',
              //   color: 'D', // You should extract this from your data
              //   clarity: 'SI1', // You should extract this from your data
              //   shape: currentShape.isNotEmpty ? currentShape : 'N/A',
              //   wgt: '${currentCarat} Gram',
              //   pieces: '1', // You should extract this from your data
              //   metalDetail: productDetail.metalDetail.value,
              //   stoneDetail: productDetail.stoneDetail.value,
              //   onTapMetal: productDetail.metalDetails,
              //   onTapStone: productDetail.stoneDetails,
              // ),

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
    // Initialize with first variant slug when data loads
    ever(productDetailAPI.prdoctdetailData, (data) {
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
                          width: isSelected ? 2 : 1,
                        ),
                        color: isSelected
                            ? AppColor.primary.withOpacity(0.1)
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
                              ? FontWeight.bold
                              : FontWeight.normal,
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
