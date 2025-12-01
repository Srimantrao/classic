import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget subheding(text,{FontWeight? fontWeight, String? fontFamily}) {
  return Text(
      text,
      style: TextStyle(
      fontFamily: fontFamily ?? 'Sans-Bold',
      fontSize: Get.width * 0.045,fontWeight: fontWeight,
    ),
  );
}
