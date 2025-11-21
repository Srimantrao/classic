// ignore_for_file: file_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fullscreen extends StatelessWidget {
  final Widget? child;
  final String? image;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? floatingActionButton;

  const Fullscreen({
    super.key,
    this.child,
    this.image,
    this.appBar,
    this.bottomNavigationBar,
    this.drawer,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColor.white,
          image: (image != null)
              ? DecorationImage(image: AssetImage(image!), fit: BoxFit.fill)
              : null,
        ),
        child: SafeArea(child: child ?? SizedBox()),
      ),
    );
  }
}
