import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget horizontalPadding({required Widget child, double? padding}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: padding ?? Get.width / 30,
    ),
    child: child,
  );
}