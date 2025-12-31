// ignore_for_file: overridden_fields, annotate_overrides

import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/screen/hedder/cart/cartScreen/cart.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/drawer.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/jewelryBody.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/header/appbar.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Jewelry extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final product = ProductList();
  final jewellry = Get.put(JewelleryAPICall());
  Jewelry({super.key});
  @override
  Widget build(BuildContext context) {
    final listItem = jewellry.categoryAPI.catagoryData['data'];
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
            listOfItem(list: listItem),
            SizedBox(height: Get.height * 0.10),
          ],
        ),
      ),
    );
  }
}
