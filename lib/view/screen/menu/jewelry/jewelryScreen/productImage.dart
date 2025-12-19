// ignore_for_file: file_names

import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String image;
  const ProductImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      child: Image(image: AssetImage(image)),
    );
  }
}
