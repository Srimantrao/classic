import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fullscreen extends StatelessWidget {
  final Widget? child;
  final String? image;
  const Fullscreen({super.key, this.child, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image!),
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
    );
  }
}
