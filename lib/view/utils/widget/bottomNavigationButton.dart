// ignore_for_file: file_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget buttonNavigation({required Widget child}) {
  return Container(
    color: AppColor.white,
    child: SafeArea(
      child: SizedBox(
        height: Get.height * 0.06,
        child: Container(
          decoration: BoxDecoration(color: AppColor.white),
          child: horizontalPadding(child: child),
        ),
      ),
    ),
  );
}
