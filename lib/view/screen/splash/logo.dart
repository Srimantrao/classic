// ignore_for_file: sized_box_for_whitespace

import 'package:classic/view/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.spalsh_background),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

Widget showBackgound(){
  return Container(
    height: Get.height,
    width: Get.width,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppImage.spalsh_background),
        fit: BoxFit.fill,
      ),
    ),
  );
}