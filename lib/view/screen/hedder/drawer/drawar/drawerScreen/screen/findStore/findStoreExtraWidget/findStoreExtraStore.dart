// ignore_for_file: file_names, strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget findStoreListText(text) {
  return Text(text, style: TextStyle(fontFamily: 'FuturaCyrillic'));
}

Widget address({
  required String aria,
  required String city,
  required String distance,
}) {
  return Row(
    children: [
      findStoreListText(aria),
      SizedBox(width: Get.width * 0.02),
      findStoreListText('|'),
      SizedBox(width: Get.width * 0.02),
      findStoreListText(city),
      SizedBox(width: Get.width * 0.02),
      findStoreListText('|'),
      SizedBox(width: Get.width * 0.02),
      findStoreListText(distance),
    ],
  );
}
