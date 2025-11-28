import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/header/appbar.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../jewelryWidget/body/jewelryBody.dart';

class Jewelry extends StatelessWidget {
  final product = ProductList();
  Jewelry({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: appBarCategory(
        prefixOnTap: () {},
        suffixOnTap: () {},
        prefixIcon: AppIcon.newcart,
        suffixIcon: AppIcon.drawer,
        hedding: AppString.category,
      ),
      child: horizontalPadding(
        child: Column(
          children: [
            SizedBox(height: Get.height / 40),
            listOfItem(list: product.list_product),
          ],
        ),
      ),
    );
  }
}
