// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_Color.dart';

class ProductImage extends StatelessWidget {
  final String images;
  final String tilte;
  const ProductImage({super.key, required this.images, required this.tilte});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      child: horizontalPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [backButton(), image(images), SizedBox()],
        ),
      ),
    );
  }
}

Widget image(String imageUrl) {
  return InteractiveViewer(
    panEnabled: true,
    minScale: 1.0,
    maxScale: 4.0,
    child: Image.network(
      imageUrl,
      fit: BoxFit.contain,
    ),
  );
}

Widget backButton() {
  return GestureDetector(
    onTap: () => Get.back(),
    child: Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.01),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderradius.buttonboder),
              color: AppColor.gray,
            ),
            child: Icon(Icons.chevron_left),
          ),
        ],
      ),
    ),
  );
}
