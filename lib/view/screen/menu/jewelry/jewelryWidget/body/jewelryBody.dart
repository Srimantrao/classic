// ignore_for_file: file_names, avoid_print, strict_top_level_inference

import 'package:classic/view/screen/menu/jewelry/jewelryExtraWidget/jewellry.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryExtraWidget/product.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../jewelryScreen/product.dart';

Widget listOfItem({required List list}) {
  var newList = list
      .where(
        (item) =>
            item['isMenu'] == true &&
            item['slug'] != 'engagement-rings' &&
            item['slug'] != 'wedding-bands' &&
            item['subCategory'] != null &&
            item['subCategory'].any(
              (sub) => sub['isMenu'] == true || sub['isMenu'] == null,
            ),
      )
      .toList();
  // var newList = list
  //     .where(
  //       (item) => item['subCategory'] != null && item['subCategory'].isNotEmpty,
  //     )
  //     .toList();
  return Expanded(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Get.width < 350 ? 1 : 2,
        childAspectRatio: Get.width < 350 ? 2 : 0.85,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      shrinkWrap: true,
      itemCount: newList.length,
      itemBuilder: (BuildContext context, int index) {
        return product(
          onTap: () => callProductList(newList, index),
          text: newList[index]['categoryName'],
          image: newList[index]['image'],
        );
      },
    ),
  );
}

Widget filterBottom({
  void Function()? sortOnTap,
  void Function()? filtersOnTap,
}) {
  return Container(
    decoration: BoxDecoration(color: AppColor.secondary),
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: sortOnTap,
            child: filterSelectButton(
              image: AppIcon.custom,
              text: AppString.sortBy,
            ),
          ),
        ),
        VerticalDivider(color: AppColor.gray3, thickness: 2),
        Expanded(
          child: GestureDetector(
            onTap: filtersOnTap,
            child: filterSelectButton(
              image: AppIcon.filter,
              text: AppString.filter,
            ),
          ),
        ),
      ],
    ),
  );
}

void callProductList(newList, index) {
  final categoryId = newList[index]['_id'];
  final categoryName = newList[index]['categoryName'];
  Get.to(() => Product(categoryId: categoryId, categoryName: categoryName));
  print("categoryId :- $categoryId");
  print("categoryId :- $categoryName");
}

//  crossAxisCount: 2,
//         mainAxisExtent: Get.height * 0.30,
//         mainAxisSpacing: Get.height * 0.015,
//         crossAxisSpacing: Get.width * 0.03,  //
