// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget buttonNavigation({required Widget child}) {
  return Container(
    color: AppColor.white,
    child: SafeArea(
      child: Container(
        height: Get.height * 0.07,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppColor.white),
                    child: horizontalPadding(child: child),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
