// ignore_for_file: file_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget buttonNavigation({required Widget child}) {
  return SizedBox(
    height: Get.height * 0.10,
    child: Container(
      decoration: BoxDecoration(color: AppColor.white),
      child: Column(
        children: [
          horizontalPadding(child: child),
          SizedBox(height: Get.height * 0.007),
        ],
      ),
    ),
  );
}
