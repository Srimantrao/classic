// ignore_for_file: file_names

import 'package:classic/controller/user_Interface/hedder/drawer/drawers_Controller.dart';
import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerExtraWidget/drawerExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/show/showScreen/show.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/jewelryBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../../../../controller/user_Interface/menu/diamondSearch/diamondSearch_Controller.dart';
import '../../../../../menu/jewelry/jewelryScreen/product.dart';

//Jewellery List
Widget jewelryList({required List list}) {
  var newList = list
      .where(
        (item) => item['subCategory'] != null && item['subCategory'].isNotEmpty,
      )
      .toList();
  return ListView.builder(
    shrinkWrap: true,
    itemCount: newList.length,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      return listColltion(
        index: index,
        datalist: newList[index]['categoryName'],
        onTap: () => callProductList(newList, index),
      );
    },
  );
}

//Shop By Metal
Widget shopByMetal({required List list}) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: list.length,
    itemBuilder: (BuildContext context, int index) {
      return listColltion(
        index: index,
        datalist: list[index]['caption'],
        onTap: () {
          Get.to(
            () => Product(
              categoryId: list[index]['_id'],
              categoryName: list[index]['caption'],
            ),
          );
        },
      );
    },
  );
}

//Product List
Widget showListValue({required List list}) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: list.length,
    itemBuilder: (BuildContext context, int index) {
      return listColltion(
        index: index,
        datalist: list[index]['venue'],
        onTap: () {
          Get.to(() => Show(imageShow: list[index]['descriptionImage']));
        },
      );
    },
  );
}

//Diamond List
Widget diamondList({required List list}) {
  final bottomController = Get.put(BottombarController());
  final diamondSearch = Get.put(DiamondSearchUIController());
  final drawerUI = Get.put(DrawersUIController());
  return ListView.builder(
    shrinkWrap: true,
    itemCount: list.length,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      return listColltion(
        index: index,
        datalist: list[index]['paraMtrName'],
        onTap: () {
          if (drawerUI.shape.value) {
            diamondSearch.selectedIndex.value = 0;
          }
          if (drawerUI.shape2.value) {
            diamondSearch.selectedIndex.value = 1;
          }
          bottomController.isDrawerOpen.value = false;
          bottomController.selectindex.value = 3;
          bottomController.changePage(3);
        },
      );
    },
  );
}
