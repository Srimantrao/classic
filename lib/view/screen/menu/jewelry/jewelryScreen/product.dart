import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/filter.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/productDetail.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/productImage.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productbody.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../utils/app_String.dart';

class Product extends StatelessWidget {
  final products = Lisofproduct();
  Product({super.key});
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Fullscreen(
      appBar: allOtherScreen(AppString.product, cart: true),
      child: Column(
        children: [
          search(searchController, filtertab: () => Get.to(() => Filter())),
          productList(
            list: products.product,
            onTapImagePath: (image) {
              Get.to(() => ProductImage(image: image));
            },
            onTapProductDetail: (image, name, price) {
              Get.to(
                () => ProductDetail(image: image, name: name, price: price),
              );
            },
          ),
        ],
      ),
    );
  }
}
