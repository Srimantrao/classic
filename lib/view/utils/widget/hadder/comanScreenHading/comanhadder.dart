
// ignore_for_file: avoid_unnecessary_containers

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/hadder/comanHadingWidget/comanHadingWidget.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget comanAppBar({
  required String prefix,
  required String suffix,
  required String hedding,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 0.15),
    child: Container(
      decoration: BoxDecoration(color: AppColor.primary),
      child: horizontalPadding(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: Get.height * 0.015),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [icon(prefix), appbarheddingText(hedding), icon(suffix)],
          ),
        ),
      ),
    ),
  );
}
