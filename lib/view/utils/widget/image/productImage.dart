// ignore_for_file: file_names, strict_top_level_inference, must_be_immutable

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_Color.dart';

class ProductImage extends StatelessWidget {
  final String images;
  String? tilte;
  ProductImage({super.key, required this.images, this.tilte});
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
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.broken_image, size: 40, color: Colors.grey);
      },
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
