// ignore_for_file: file_names

import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productDetail.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import '../../../../utils/widget/bottomNavigationButton.dart';

class ProductDetail extends StatelessWidget {
  final productdetail = Get.put(ProductdetailuiController());
  final products = Lisofproduct();
  final String image;
  final String name;
  final String price;
  ProductDetail({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.productDetail, cart: true),
      bottomNavigationBar: buttonNavigation(
        child: button('Add To Cart', isLowercase: true),
      ),
      child: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              SizedBox(height: Get.height * 0.02),

              //Product Image
              productDetailImage(image),

              //Details
              productDetailsPrice(name, price),

              //Shape
              productShape(),

              //Metal Stamp
              productStamp(productdetail),

              //Metal Type
              productmetalType(productdetail),

              //Carat
              selectCarat(productdetail),

              //Remark
              productDetailsRemark(productdetail.remarkController),

              //Bracelet Size
              braceletSize(productdetail),

              //Engraving
              engraving(productdetail, productdetail.engravingController),

              // Qty
              quantity(
                value: productdetail.qtyValue.value,
                onTapDecrimant: productdetail.decrementQty,
                onTapIncrimant: productdetail.incrementQty,
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
                metalDetail: productdetail.metalDetail.value,
                stoneDetail: productdetail.stoneDetail.value,
                onTapMetal: productdetail.metalDetails,
                onTapStone: productdetail.stoneDetails,
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
