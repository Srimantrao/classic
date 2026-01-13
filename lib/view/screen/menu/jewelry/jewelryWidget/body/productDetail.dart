// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/cartcontainer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../../controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import '../../../../../../modal/menu/jewelry/productDetail.dart';
import '../../../../../utils/app_Borderradius.dart';
import '../../../../../utils/widget/horizontalpaddind.dart';
import '../../../../../utils/widget/inputfield.dart';
import '../../jewelryExtraWidget/productDetail.dart';

Widget productDetailsPrice(name, price, itemCode) {
  return horizontalPadding(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: Textsize.samiHedding,
            fontWeight: FontWeight.w500,
          ),
        ),
        // SizedBox(height: Get.height * 0.003),
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.003)),
        Text(
          'SKU : $itemCode',
          style: TextStyle(
            fontSize: Get.width * 0.03,
            fontWeight: FontWeight.w500,
            color: AppColor.gray3,
          ),
        ),
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.009)),
        Row(
          children: [
            Text(
              "\$${double.parse(price).toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: Get.width * 0.04,
                fontWeight: FontWeight.w500,
                color: AppColor.primary,
              ),
            ),
            SizedBox(width: Get.width * 0.015),
            Text(
              '(Inclusive Of All Taxes)',
              style: TextStyle(
                fontSize: Get.width * 0.04,
                fontWeight: FontWeight.w500,
                color: AppColor.gray3,
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.009)),
      ],
    ),
  );
}

Widget productDetailsRemark(TextEditingController? controller) {
  return horizontalPadding(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            productDetailsubHedding('${AppString.remark} :- '),
            Expanded(
              child: Inputfield(
                controller: controller,
                color: AppColor.secondary,
                height: Get.height * 0.09,
                hinttext: AppString.enterRemark,
                hintStyle: TextStyle(fontFamily: 'FuturaCyrillic'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//Bracelet Size
Widget productSize(ProductDetailUIController productdetail, String name) {
  final isRing = name == AppString.ringSize;

  final sizes = isRing
      ? ProductDetailList().braceletSizes
      : ProductDetailList().braceletSizes;

  return Obx(() {
    final selectedValue = isRing
        ? productdetail.selectedRingSize.value
        : productdetail.selectedBraceletSize.value;

    return horizontalPadding(
      child: Padding(
        padding: EdgeInsets.only(bottom: Get.height * 0.02),
        child: Row(
          children: [
            productDetailsubHedding('$name :- '),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.secondary),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  iconStyleData: const IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    iconSize: 22,
                  ),
                  buttonStyleData: ButtonStyleData(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.height * 0.005,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        borderradius.buttonboder,
                      ),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 100,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        borderradius.buttonboder,
                      ),
                    ),
                  ),
                  hint: Text(
                    AppString.select,
                    style: TextStyle(fontSize: Get.height * 0.015),
                  ),

                  /// 🔥 VERY IMPORTANT FIX
                  value: selectedValue.isEmpty ? null : selectedValue,

                  items: sizes
                      .map(
                        (size) => DropdownMenuItem<String>(
                          value: size,
                          child: Text(size),
                        ),
                      )
                      .toList(),

                  onChanged: (value) {
                    if (value == null) return;

                    if (isRing) {
                      productdetail.selectedRingSize.value = value;
                    } else {
                      productdetail.selectedBraceletSize.value = value;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}

Widget engraving(productdetail, controller) {
  return horizontalPadding(
    child: Column(
      children: [
        Row(
          children: [
            productDetailsubHedding('${AppString.engraving} :- '),
            Expanded(
              child: Inputfield(
                controller: controller,
                color: AppColor.secondary,
                height: Get.height * 0.05,
                hinttext: AppString.enterRemark,
                hintStyle: TextStyle(fontFamily: 'FuturaCyrillic'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//Qty
Widget quantity({
  void Function()? onTapIncrimant,
  void Function()? onTapDecrimant,
  int? value,
}) {
  return horizontalPadding(
    child: Column(
      children: [
        Row(
          children: [
            productDetailsubHedding('${AppString.qty}:- '),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.gray5),
                borderRadius: BorderRadius.circular(borderradius.buttonboder),
              ),
              child: Row(
                children: [
                  changvalue('-', onTap: onTapDecrimant),
                  editValue(value.toString()),
                  changvalue('+', onTap: onTapIncrimant),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget productDetailList(productDetail, categoryId, youMayLikeControllerAPI) {
  return Column(
    children: [
      imageContainer(
        Get.find<ImageController>(),
        productDetail.activeVariant['images'],
      ),

      productDetailsPrice(
        productDetail.activeVariant['productTitle'],
        productDetail.activeVariant['finalPrice'].toString(),
        productDetail.activeVariant['itemCode'],
      ),

      /// SHAPE
      (productDetail.currentShape.value.isNotEmpty)
          ? commonHorizontalList(
              title: AppString.shape,
              list: productDetail.uniqueShapes,
              textKey: 'paraMtrName',
              compareKey: 'paraMtrName',
              selectedValue: productDetail.currentShape.value,
              onItemSelected: (s) {
                final v = productDetail.findMatchingVariant(
                  childProducts: productDetail.childProducts,
                  shape: s['paraMtrName'],
                  metalStamp: productDetail.currentMetalStamp.value,
                  metalType: productDetail.currentMetalType.value,
                  carat: productDetail.currentCarat.value,
                );
                productDetail.updateSelectedVariant(v['slug']);
              },
            )
          : SizedBox(),

      /// METAL STAMP
      (productDetail.currentMetalStamp.value.isNotEmpty)
          ? commonHorizontalList(
              title: AppString.metalStamp,
              list: productDetail.uniqueMetalStamp,
              textKey: 'paraMtrName',
              compareKey: 'paraMtrName',
              selectedValue: productDetail.currentMetalStamp.value,
              onItemSelected: (s) {
                final v = productDetail.findMatchingVariant(
                  childProducts: productDetail.childProducts,
                  shape: productDetail.currentShape.value,
                  metalStamp: s['paraMtrName'],
                  metalType: productDetail.currentMetalType.value,
                  carat: productDetail.currentCarat.value,
                );
                productDetail.updateSelectedVariant(v['slug']);
              },
            )
          : SizedBox(),

      /// METAL TYPE
      (productDetail.currentMetalType.value.isNotEmpty)
          ? commonHorizontalList(
              title: AppString.metalType,
              list: productDetail.uniqueMetalType,
              textKey: 'metal',
              compareKey: 'metal',
              selectedValue: productDetail.currentMetalType.value,
              onItemSelected: (s) {
                final v = productDetail.findMatchingVariant(
                  childProducts: productDetail.childProducts,
                  shape: productDetail.currentShape.value,
                  metalStamp: productDetail.currentMetalStamp.value,
                  metalType: s['metal'],
                  carat: productDetail.currentCarat.value,
                );
                productDetail.updateSelectedVariant(v['slug']);
              },
            )
          : SizedBox(),

      /// CARAT
      (productDetail.currentCarat.value.isNotEmpty)
          ? commonHorizontalList(
              title: AppString.carat,
              list: productDetail.uniqueCaratList,
              textKey: 'totalWgt',
              compareKey: 'totalWgt',
              selectedValue: productDetail.currentCarat.value,
              onItemSelected: (s) {
                final v = productDetail.findMatchingVariant(
                  childProducts: productDetail.childProducts,
                  shape: productDetail.currentShape.value,
                  metalStamp: productDetail.currentMetalStamp.value,
                  metalType: productDetail.currentMetalType.value,
                  carat: s['totalWgt'].toString(),
                );
                productDetail.updateSelectedVariant(v['slug']);
              },
            )
          : SizedBox(),

      // Remark
      productDetailsRemark(productDetail.remarkController),

      //Rings
      (categoryId == '67ee85d43c2ae60318a28998')
          ? productSize(productDetail, AppString.ringSize)
          : SizedBox(),

      // Bracelet Size
      (categoryId == '67f3a6e10d01f3f9f578083b')
          ? productSize(productDetail, AppString.braceletSize)
          : SizedBox(),

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
        productCodeValue: productDetail.activeVariant['itemCode'] ?? 'N/A',
        metalValue: productDetail.currentMetalType.value.isNotEmpty
            ? productDetail.currentMetalType.value
            : 'N/A',
        heightValue: '-',
        widthValue: '-',
        productWeightValue: '$productDetail.currentCarat Gram',
        color: 'D',
        // You should extract this from your data
        clarity: 'SI1',
        // You should extract this from your data
        shape: productDetail.currentShape.value.isNotEmpty
            ? productDetail.currentShape.value
            : 'N/A',
        wgt: '$productDetail.currentCarat Gram',
        pieces: '1',
        // You should extract this from your data
        metalDetail: productDetail.metalDetail.value,
        stoneDetail: productDetail.stoneDetail.value,
        onTapMetal: productDetail.metalDetails,
        onTapStone: productDetail.stoneDetails,
      ),

      // Like
      listLike(product: youMayLikeControllerAPI.youmaylikeData['data']),
    ],
  );
}

Widget productmetalDetails({
  String? productCodeValue,
  String? metalValue,
  String? heightValue,
  String? widthValue,
  String? productWeightValue,
  String? color,
  String? clarity,
  String? shape,
  String? wgt,
  String? pieces,
  void Function()? onTapMetal,
  void Function()? onTapStone,
  bool metalDetail = false,
  bool stoneDetail = false,
}) {
  return horizontalPadding(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.02),
        cartConatiner(
          child: Column(
            children: [
              GestureDetector(
                onTap: onTapMetal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    metalHedding(AppString.productAndMetalDetails),
                    (metalDetail) ? toggleIcon('-') : toggleIcon('+'),
                  ],
                ),
              ),
              Divider(color: AppColor.editColor),
              SizedBox(height: Get.height * 0.01),
              (metalDetail)
                  ? Column(
                      children: [
                        metalDetailPadding(
                          title: '${AppString.productCode} :- ',
                          value: productCodeValue,
                        ),
                        metalDetailPadding(
                          title: '${AppString.metal} :- ',
                          value: metalValue,
                        ),
                        metalDetailPadding(
                          title: '${AppString.height} :- ',
                          value: heightValue,
                        ),
                        metalDetailPadding(
                          title: '${AppString.width} :- ',
                          value: widthValue,
                        ),
                        metalDetailPadding(
                          title: '${AppString.productWeight} :- ',
                          value: productWeightValue,
                        ),
                      ],
                    )
                  : SizedBox(),
              GestureDetector(
                onTap: onTapStone,
                child: Column(
                  children: [
                    (metalDetail)
                        ? SizedBox(height: Get.height * 0.02)
                        : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        metalHedding(AppString.centerStoneDetails),
                        (stoneDetail) ? toggleIcon('-') : toggleIcon('+'),
                      ],
                    ),
                    Divider(color: AppColor.editColor),
                    SizedBox(height: Get.height * 0.01),
                    (stoneDetail)
                        ? Column(
                            children: [
                              metalDetailPadding(
                                title: '${AppString.color} :- ',
                                value: color,
                              ),
                              metalDetailPadding(
                                title: '${AppString.clarity} :- ',
                                value: clarity,
                              ),
                              metalDetailPadding(
                                title: '${AppString.shape} :- ',
                                value: shape,
                              ),
                              metalDetailPadding(
                                title: '${AppString.wgt} :- ',
                                value: wgt,
                              ),
                              metalDetailPadding(
                                title: '${AppString.pieces} :- ',
                                value: pieces,
                              ),
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//Like
Widget listLike({required List product}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          AppString.youMay,
          style: TextStyle(
            fontSize: Get.width * 0.04,
            fontWeight: FontWeight.w500,
            color: AppColor.primary,
          ),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
        child: Row(
          children: product.map((item) {
            return like(
              image: item['images'][0]['zoom'],
              name: item['productTitle'],
              price: item['finalPrice'].toStringAsFixed(2),
            );
          }).toList(),
        ),
      ),
    ],
  );
}
