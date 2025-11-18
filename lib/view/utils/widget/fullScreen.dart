import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fullscreen extends StatelessWidget {
  final Widget child;
  const Fullscreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.amber,
        child: child,
      ),
    );
  }
}
