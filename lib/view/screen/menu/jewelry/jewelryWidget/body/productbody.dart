// ignore_for_file: avoid_print, avoid_unnecessary_containers, non_constant_identifier_names, strict_top_level_inference, deprecated_member_use

import 'package:classic/controller/user_Interface/menu/jewelry/bottomfilterUI_Controller.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryExtraWidget/product.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/productDetail.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/image/productImage.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../controller/user_Interface/menu/jewelry/productUI_Controller.dart';

Widget search(
  searchController, {
  void Function()? filtertab,
  void Function(String)? onChanged,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.018),
    child: Row(
      children: [
        Expanded(
          flex: 9,
          child: searchBar(searchController, onChanged: onChanged),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: filtertab,
              child: Icon(
                Icons.filter_alt_outlined,
                color: AppColor.gray3,
                size: 30,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
          ],
        ),
      ],
    ),
  );
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

// List controller
Widget listController(
  String categoryId,
  List productList,
  ScrollController controller, {
  required bool isLoadMore,
}) {
  return Expanded(
    child: Stack(
      children: [
        //List Controller
        GridView.builder(
          controller: controller,
          itemCount: productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.48,
          ),
          itemBuilder: (context, index) {
            final product = productList[index];
            final List<Map<String, dynamic>> childProducts =
                List<Map<String, dynamic>>.from(product['childProduct'] ?? []);
            final String productId = product['_id'] ?? 'product_$index';
            final slug = product['slug'];
            final productControllerUI = Get.put(
              ProductuiController(
                productId: productId,
                initialChildProducts: childProducts,
              ),
              tag: productId,
              permanent: false,
            );
            return productShowList(
              productControllerUI,
              detailonTap: () => callproductDetail(slug, categoryId),
            );
          },
        ),

        // 🔹 Footer loader
        if (isLoadMore)
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // optional
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            ),
          ),
      ],
    ),
  );
}

void callproductDetail(slug, categoryId) {
  Get.to(() => ProductDetail(slug: slug, categoryId: categoryId));
}

// Product show list widget
Widget productShowList(
  ProductuiController productControllerUI, {
  void Function()? detailonTap,
}) {
  return Obx(() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.gray),
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with loading and error handling
          if (productControllerUI.images.isNotEmpty &&
              (productControllerUI.images.first['zoom'] ?? '').isNotEmpty)
            GestureDetector(
              onTap: () {
                Get.to(
                  () => ProductImage(
                    images: productControllerUI.images.first['zoom'],
                    tilte: productControllerUI.productTitle,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.network(
                  productControllerUI.images.first['zoom'],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
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
              ),
            )
          else
            const SizedBox(),

          GestureDetector(
            onTap: detailonTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product title
                if (productControllerUI.productTitle.isNotEmpty)
                  productName(productControllerUI.productTitle),

                // Price
                if (productControllerUI.formattedPrice.isNotEmpty)
                  price(productControllerUI.formattedPrice),

                // Shape
                if (productControllerUI.uniqueShapeList.isNotEmpty)
                  Row(
                    children: [
                      information('Shape'),
                      Expanded(child: buildShape(productControllerUI)),
                    ],
                  ),

                // Metal stamps (now interactive)
                if (productControllerUI.combinedMetal.isNotEmpty)
                  Row(
                    children: [
                      information('Metal'),
                      Expanded(child: buildMetalStamps(productControllerUI)),
                    ],
                  ),

                // Carat/Weight options (now interactive)
                if (productControllerUI.caratOptions.isNotEmpty)
                  Row(
                    children: [
                      information('Carat'),
                      Expanded(child: buildTotalWgt(productControllerUI)),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  });
}

// Shape widget
Widget buildShape(ProductuiController productControllerUI) {
  final shapeList = productControllerUI.uniqueShapeList;
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: shapeList.map((shape) {
        final name = shape['shapeName'] ?? '';
        final shapeId =
            shape['shapeId'] ?? ''; // Changed from 'shape' to 'shapeId'

        if (name.isEmpty) return const SizedBox();

        final isSelected = productControllerUI.isShapeSelected(shapeId);

        return GestureDetector(
          onTap: () {
            productControllerUI.selectShape(shapeId);
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
}

// Build metal stamps with tap functionality
Widget buildMetalStamps(ProductuiController productControllerUI) {
  final metalStamps = productControllerUI.combinedMetal;
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: metalStamps.map((stamp) {
        final name = (stamp['param'] ?? '').toString();
        final variantSlug = stamp['slug'] ?? '';
        final metalName = stamp['combinedMetalName'] ?? '';
        final isSelected = productControllerUI.isVariantSelected(variantSlug);
        final bgColor = productControllerUI.getMetalBackgroundColor(metalName);
        return showContainer(
          onTap: () => productControllerUI.selectVariant(variantSlug),
          name: name,
          bgColor: bgColor,
          selectColor: isSelected ? bgColor : null,
        );
      }).toList(),
    ),
  );
}

// Build total weight options widget
Widget buildTotalWgt(ProductuiController productControllerUI) {
  return Obx(() {
    final sortedWeights = productControllerUI.sortedWeightList;
    if (sortedWeights.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          'No weight options',
          style: TextStyle(color: Colors.grey.shade500),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: sortedWeights.map<Widget>((weight) {
          final isSelected = productControllerUI.isWeightSelected(weight);
          return showContainer(
            onTap: () => productControllerUI.selectByWeight(weight),
            name: weight,
            bgColor: AppColor.gray,
            selectColor: isSelected ? AppColor.gray : null,
          );
        }).toList(),
      ),
    );
  });
}

Widget shortBy({
  void Function()? lowToHighonTap,
  void Function()? highToLowonTap,
  bool lowTohigh_val = false,
  bool highTolow_val = false,
}) {
  double colsesize = 11;
  return Container(
    width: Get.width,
    height: Get.height * 0.30,
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(borderradius.boder),
    ),
    child: Center(
      child: Column(
        children: [
          horizontalPadding(
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColor.gray3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: Get.width * 0.020,
                    ),
                    child: Text(
                      AppString.sortBy,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  cencelIcon(colsesize),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.020)),
          GestureDetector(
            onTap: lowToHighonTap,
            child: shortWidgetText(
              text: "${AppString.prices}: ${AppString.lowTohigh}",
              boderColor: (lowTohigh_val) ? AppColor.primary : AppColor.gray3,
              textColor: (lowTohigh_val) ? AppColor.primary : AppColor.black,
            ),
          ),
          GestureDetector(
            onTap: highToLowonTap,
            child: shortWidgetText(
              text: "${AppString.prices}: ${AppString.highTolow}",
              boderColor: (highTolow_val) ? AppColor.primary : AppColor.gray3,
              textColor: (highTolow_val) ? AppColor.primary : AppColor.black,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget filterfun({dynamic styleSubCatagory, dynamic stampData}) {
  final bottomfilter = Get.put(BottomFilterUiController());
  double colsesize = 11;
  print("styleSubCatagory :- $styleSubCatagory");
  print("Stamp :- $stampData");
  return Container(
    width: Get.width,
    height: Get.height * 0.70,
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(borderradius.boder),
    ),
    child: Column(
      children: [
        Expanded(
          flex: 9,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: Get.height * 0.015),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColor.secondary)),
                ),
                child: horizontalPadding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.filters,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Get.height * 0.02,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            AppString.reset,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Get.width * 0.040,
                              color: AppColor.primary,
                            ),
                          ),
                          SizedBox(width: Get.width * 0.025),
                          cencelIcon(colsesize),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: filterData(
                  styleonTap: bottomfilter.styleOnTab,
                  stamponTap: bottomfilter.stampsOnTab,
                  metalonTap: bottomfilter.metalOnTab,
                  collectiononTap: bottomfilter.collectinOnTab,
                  priceonTap: bottomfilter.priceOnTab,
                  tagsonTap: bottomfilter.tagOnTab,
                  styleSubCatagory: styleSubCatagory,
                  stampData: stampData,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              border: Border(top: BorderSide(color: AppColor.secondary)),
            ),
            padding: EdgeInsets.only(top: Get.height * 0.008),
            child: Column(
              children: [
                horizontalPadding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: button(
                          AppString.cancel,
                          backgroundColor: AppColor.white,
                          textColor: AppColor.black,
                          borderColor: AppColor.gray3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(
                          right: Get.width * 0.025,
                        ),
                      ),
                      Expanded(flex: 2, child: button(AppString.apply)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget shortWidgetText({
  required String text,
  Color? boderColor,
  Color? textColor,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.070),
    child: Container(
      padding: EdgeInsetsGeometry.all(10),
      width: Get.width,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: boderColor!)),
      ),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
      ),
    ),
  );
}

Widget cencelIcon(colsesize) {
  return GestureDetector(
    onTap: () => Get.back(),
    child: Container(
      color: AppColor.white,
      padding: EdgeInsetsGeometry.all(5),
      child: Image(
        image: AssetImage(AppIcon.close),
        width: colsesize,
        height: colsesize,
      ),
    ),
  );
}

Widget filterData({
  void Function()? styleonTap,
  void Function()? stamponTap,
  void Function()? metalonTap,
  void Function()? collectiononTap,
  void Function()? priceonTap,
  void Function()? tagsonTap,
  dynamic styleSubCatagory,
  dynamic stampData,
}) {
  final bottomfilter = Get.put(BottomFilterUiController());
  return Obx(() {
    bool style = bottomfilter.styleTab.value;
    bool stamps = bottomfilter.stampsTab.value;
    bool metal = bottomfilter.metalTab.value;
    bool collection = bottomfilter.collectinTab.value;
    bool price = bottomfilter.priceTab.value;
    bool tags = bottomfilter.tagTab.value;
    List subCategoryList = [];
    List stampList = [];
    List metalList = [];
    if (styleSubCatagory is Map && styleSubCatagory.isNotEmpty) {
      if (styleSubCatagory['subCategory'] is List) {
        subCategoryList = styleSubCatagory['subCategory'] as List;
      }
    }
    if (stampData is Map) {
      if (stampData['stamp'] is List) {
        stampList = stampData['stamp'];
      }
      if (stampData['metaltype'] is List) {
        metalList = stampData['metaltype'];
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.gray2,
              border: Border(right: BorderSide(color: AppColor.secondary)),
            ),
            child: Column(
              children: [
                filterText(
                  Bodercolor: style ? AppColor.primary : Colors.transparent,
                  textcolor: style ? AppColor.primary : AppColor.black,
                  color: style ? AppColor.white : AppColor.gray2,
                  onTap: styleonTap,
                  AppString.style,
                ),
                filterText(
                  Bodercolor: stamps ? AppColor.primary : Colors.transparent,
                  textcolor: stamps ? AppColor.primary : AppColor.black,
                  color: stamps ? AppColor.white : AppColor.gray2,
                  onTap: stamponTap,
                  AppString.stamps,
                ),
                filterText(
                  Bodercolor: metal ? AppColor.primary : Colors.transparent,
                  textcolor: metal ? AppColor.primary : AppColor.black,
                  color: metal ? AppColor.white : AppColor.gray2,
                  onTap: metalonTap,
                  AppString.metal,
                ),
                filterText(
                  Bodercolor: collection
                      ? AppColor.primary
                      : Colors.transparent,
                  color: collection ? AppColor.white : AppColor.gray2,
                  textcolor: collection ? AppColor.primary : AppColor.black,
                  onTap: collectiononTap,
                  AppString.collection,
                ),
                filterText(
                  Bodercolor: price ? AppColor.primary : Colors.transparent,
                  textcolor: price ? AppColor.primary : AppColor.black,
                  color: price ? AppColor.white : AppColor.gray2,
                  onTap: priceonTap,
                  AppString.price,
                ),
                filterText(
                  Bodercolor: tags ? AppColor.primary : Colors.transparent,
                  textcolor: tags ? AppColor.primary : AppColor.black,
                  color: tags ? AppColor.white : AppColor.gray2,
                  onTap: tagsonTap,
                  AppString.tags,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Style
                Visibility(
                  visible: style,
                  child: subCategoryList.isEmpty
                      ? Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'No subcategories available',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        )
                      : bottomStylefilter(
                          subCategoryList,
                          bottomfilter.selectedSubCategoryId,
                          onTap: (id) {
                            bottomfilter.styleID.value = id.toString();
                            print("Selected ID: $id");
                          },
                        ),
                ),
                Visibility(
                  visible: stamps,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: bottomStampsfilter(
                      stampList,
                      bottomfilter.selectedStampIds,
                      nameKey: 'paraMtrName',
                      onChanged: (selectedIds) {
                        print("Selected Stamp IDs: $selectedIds");
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: metal,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: bottomStampsfilter(
                      metalList,
                      bottomfilter.selectedMetalIds,
                      nameKey: 'metal',
                      onChanged: (selectedIds) {
                        print("Selected Metal IDs: $selectedIds");
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: collection,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Collection filter coming soon...'),
                  ),
                ),
                Visibility(
                  visible: price,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Price filter coming soon...'),
                  ),
                ),
                Visibility(
                  visible: tags,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Tags filter coming soon...'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  });
}

Widget filterText(
  text, {
  void Function()? onTap,
  Color? color,
  Color? Bodercolor,
  Color? textcolor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
      decoration: BoxDecoration(
        color: color,
        border: Border(
          left: BorderSide(color: Bodercolor!, width: 3),
          bottom: BorderSide(color: AppColor.secondary),
        ),
      ),
      child: horizontalPadding(
        child: Text(
          text,
          style: TextStyle(
            color: textcolor,
            fontSize: Get.width * 0.040,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

//bottom Style Filter
Widget bottomStylefilter(
  List subCategoryList,
  RxString selectedId, {
  void Function(String id)? onTap,
}) {
  final menuList = subCategoryList.where((item) {
    final data = item as Map<String, dynamic>;
    return data['isMenu'] == true;
  }).toList();
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: menuList.map<Widget>((item) {
        final data = item as Map<String, dynamic>;
        final categoryName = data['categoryName'] ?? 'Unknown';
        final id = data['_id'];
        final isSelected = selectedId.value == id;
        return fillterShowContainer(
          isSelected: isSelected,
          onTap: () {
            selectedId.value = id;
            onTap?.call(id);
          },
          text: categoryName.toString(),
        );
      }).toList(),
    ),
  );
}

Widget bottomStampsfilter(
  List list,
    RxString selectedIds, {
  required String nameKey,
      void Function(String)? onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: list.map<Widget>((item) {
        final data = item as Map<String, dynamic>;
        final id = data['_id'];
        final name = data[nameKey] ?? 'Unknown';
        final isSelected = selectedIds.contains(id);
        return fillterShowContainer(
          isSelected: isSelected,
          onTap: () {
            selectedIds.value = id;
            onChanged?.call(id);
          },
          text: name.toString(),
        );
      }).toList(),
    ),
  );
}

Widget fillterShowContainer({
  required bool isSelected,
  required void Function() onTap,
  required String text,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? AppColor.primary : AppColor.gray,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        color: isSelected
            ? AppColor.primary.withOpacity(0.1)
            : Colors.transparent,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: Textsize.samisubHedding,
          color: isSelected ? AppColor.primary : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
