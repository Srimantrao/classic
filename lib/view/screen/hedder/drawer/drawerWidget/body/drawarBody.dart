// ignore_for_file: file_names

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';

Widget allDrawersBody({required Widget child}){
  return Container(
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(borderradius.boder),
        topLeft: Radius.circular(borderradius.boder),
      ),
    ),
    child: SafeArea(child: child),
  );
}