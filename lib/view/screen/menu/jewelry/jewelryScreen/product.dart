import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productbody.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
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
          search(searchController),
          productList(list: products.product),
        ],
      ),
    );
  }
}
