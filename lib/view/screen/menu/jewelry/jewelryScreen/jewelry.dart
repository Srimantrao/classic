// ignore_for_file: use_key_in_widget_constructors, overridden_fields, annotate_overrides

import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/screen/hedder/cart/cartScreen/cart.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/drawer.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/jewelryBody.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/header/appbar.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Jewelry extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final product = ProductList();
  final jewellry = Get.put(JewelleryAPICall());
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
      child: Obx(() {
        final api = jewellry.categoryAPI;
        final apiData = api.catagoryData['data'];
        final listItem = apiData;
        if (listItem == null) {
          return Center(child: Lottie.asset(AppJson.noData));
        }
        return horizontalPadding(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(
                  bottom: Get.height / 40,
                ),
              ),
              listOfItem(list: listItem),
              Padding(
                padding: EdgeInsetsGeometry.only(
                  bottom: Get.height * 0.10,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
