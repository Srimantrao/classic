// ignore_for_file: file_names

import 'package:classic/view/screen/menu/jewelry/jewelryExtraWidget/jewellry.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget listOfItem({required List list, void Function()? onTap}) {
  return Expanded(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: Get.height * 0.22,
        mainAxisSpacing: Get.height * 0.03,
        crossAxisSpacing: Get.width * 0.06,
      ),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return product(
          onTap: onTap,
          text: list[index]['name'],
          image: list[index]['image'],
        );
      },
    ),
  );
}
