import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget product({required String text, required String image}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColor.white,
      border: Border.all(color: AppColor.gray3),
    ),
    padding: EdgeInsets.all(5),
    child: Column(
      children: [
        Image(
          image: AssetImage(image),
          width: Get.width * 0.3,
          height: Get.width * 0.3,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'FuturaCyrillic',
          ),
        ),
      ],
    ),
  );
}
