// ignore_for_file: file_names

import 'package:classic/view/screen/hedder/drawer/drawar/drawerExtraWidget/drawerExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/show/showScreen/show.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/jewelryBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
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
        onTap: () => Get.to(() => Show()),
      );
    },
  );
}
