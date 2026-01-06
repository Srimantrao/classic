// ignore_for_file: file_names, avoid_print

import 'package:classic/view/screen/menu/jewelry/jewelryExtraWidget/jewellry.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../jewelryScreen/product.dart';

Widget listOfItem({required List list}) {
  var newList = list
      .where(
        (item) => item['subCategory'] != null && item['subCategory'].isNotEmpty,
      )
      .toList();
  return Expanded(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: Get.height * 0.25,
        mainAxisSpacing: Get.height * 0.015,
        crossAxisSpacing: Get.width * 0.03,
      ),
      shrinkWrap: true,
      itemCount: newList.length,
      itemBuilder: (BuildContext context, int index) {
        return product(
          onTap: () {
            final categoryId = newList[index]['_id'];
            final categoryName = newList[index]['categoryName'];
            Get.to(
              () => Product(categoryId: categoryId, categoryName: categoryName),
            );
            print("categoryId :- $categoryId");
            print("categoryId :- $categoryName");
          },
          text: newList[index]['categoryName'],
          image: newList[index]['image'],
        );
      },
    ),
  );
}
