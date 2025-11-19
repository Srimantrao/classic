import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget horizontalPadding({required Widget child}){
  return Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: Get.width / 30),child: child);
}