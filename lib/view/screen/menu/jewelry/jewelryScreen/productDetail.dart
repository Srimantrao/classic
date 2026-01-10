// ignore_for_file: file_names, avoid_print

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

          final image = childProducts[0]['images'];

          final imageController = Get.put(ImageController(image));

          final firstImage = childProducts[0]['images'][0]['zoom'];
          final name = childProducts[0]['productTitle'];
          final price = childProducts[0]['finalPrice'].toString();
          final itemCode = childProducts[0]['itemCode'];
          final shape = childProducts[0]['productStoneDetails'];
          final metalStamp = childProducts[0]['metalStamp'];

          final List<Map<String, dynamic>> allMetalStamp = childProducts
              .expand((product) => product['metalStamp'] ?? [])
              .map((e) => e as Map<String, dynamic>)
              .toList();

          final List<Map<String, dynamic>> uniqueMetalStamp = {
            for (var s in allMetalStamp)
              if (s['paraMtrName'] != null) s['paraMtrName']: s,
          }.values.toList();

          final List<Map<String, dynamic>> allMetalType = childProducts
              .expand((product) => product['metalType'] ?? [])
              .map((e) => e as Map<String, dynamic>)
              .toList();

          final List<Map<String, dynamic>> uniqueMetalType = {
            for (var m in allMetalType)
              if (m['metal'] != null) m['metal']: m,
          }.values.toList();

          final List<Map<String, dynamic>> shapeList =
              (childProducts[0]['productStoneDetails'] as List)
                  .map((e) => e['shape'] as Map<String, dynamic>)
                  .toList();

          final List<Map<String, dynamic>> uniqueShapeList = {
            for (var s in shapeList) s['paraMtrName']: s,
          }.values.toList();

          final List<Map<String, dynamic>> caratList = childProducts
              .map((e) => {'totalWgt': e['totalWgt']})
              .toList();

          final List<Map<String, dynamic>> uniqueCaratList = {
            for (var item in caratList) item['totalWgt']: item,
          }.values.toList();

          return Column(
            children: [
              // //Product Image
              imageContainer(imageController, image),

              //Details
              productDetailsPrice(name, price, itemCode),

              //Shape
              commonHorizontalList(
                title: AppString.shape,
                list: uniqueShapeList,
                textKey: 'paraMtrName',
              ),

              //MetalStamp
              commonHorizontalList(
                title: AppString.metalStamp,
                list: uniqueMetalStamp,
                textKey: 'paraMtrName',
              ),

              //Metal
              commonHorizontalList(
                title: AppString.metalType,
                list: uniqueMetalType,
                textKey: 'metal',
              ),

              //Carat
              commonHorizontalList(
                title: AppString.carat,
                list: uniqueCaratList,
                textKey: 'totalWgt',
              ),

              //Remark
              productDetailsRemark(productDetail.remarkController),

              //Bracelet Size
              braceletSize(productDetail),

              //Engraving
              engraving(productDetail, productDetail.engravingController),

              // Qty
              quantity(
                value: productDetail.qtyValue.value,
                onTapDecrimant: productDetail.decrementQty,
                onTapIncrimant: productDetail.incrementQty,
              ),

              //Metal & CenterStone Detail
              productmetalDetails(
                productCodeValue: 'SJBR20352',
                metalValue: '14 K White Gold',
                heightValue: '-',
                widthValue: '-',
                productWeightValue: '1.94 Gram',
                color: 'D',
                clarity: 'SI1',
                shape: 'Round',
                wgt: '1.94 Gram',
                pieces: '1',
                metalDetail: productDetail.metalDetail.value,
                stoneDetail: productDetail.stoneDetail.value,
                onTapMetal: productDetail.metalDetails,
                onTapStone: productDetail.stoneDetails,
              ),

              //Like
              listLike(product: products.product),
            ],
          );
        }),
      ),
    );
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
  return SingleChildScrollView(
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
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.009),
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
  );
}

Widget commonHorizontalList({
  required String title,
  required List list,
  required String textKey,
  EdgeInsets? margin,
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
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        borderradius.buttonboder,
                      ),
                      border: Border.all(color: AppColor.secondary),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.025,
                      vertical: Get.height * 0.005,
                    ),
                    margin:
                        margin ??
                        EdgeInsets.symmetric(horizontal: Get.width * 0.009),
                    child: Text(value.toString()),
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
