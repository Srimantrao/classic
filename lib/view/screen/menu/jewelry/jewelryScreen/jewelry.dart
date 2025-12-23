// ignore_for_file: overridden_fields, annotate_overrides

import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/screen/hedder/cart/cartScreen/cart.dart';
import 'package:classic/view/screen/hedder/drawer/drawerScreen/drawer.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/product.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/header/appbar.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../jewelryWidget/body/jewelryBody.dart';

class Jewelry extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final product = ProductList();
  Jewelry({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      scaffoldKey: scaffoldKey,
      endDrawer: Drawers(),
      appBar: appBarCategory(
        prefixOnTap: () => Get.to(() => Cart()),
        suffixOnTap: () => scaffoldKey.currentState?.openEndDrawer(),
        prefixIcon: AppIcon.newcart,
        suffixIcon: AppIcon.drawer,
        hedding: AppString.category,
      ),
      child: horizontalPadding(
        child: Column(
          children: [
            SizedBox(height: Get.height / 40),
            listOfItem(
              list: product.list_product,
              onTap: () => Get.to(() => Product()),
            ),
            SizedBox(height: Get.height * 0.10),
          ],
        ),
      ),
    );
  }
}
