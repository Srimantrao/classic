// ignore_for_file: file_names

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
      bottomNavigationBar: buttonNavigation(child: button('Add To Cart')),
      child: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              SizedBox(height: Get.height * 0.02),
              productDetailImage(image), //Product Image
              productDetailsPrice(name, price), //Details
              productStamp(productdetail), //Stamp
              productmetalType(productdetail), //Metal Type
              selectCarat(productdetail), //Carat
              productDetailsRemark(productdetail.remarkController), //Remark
              braceletSize(productdetail), //Bracelet Size
            ],
          );
        }),
      ),
    );
  }
}
