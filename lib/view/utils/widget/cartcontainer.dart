// ignore_for_file: unnecessary_import

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cartConatiner({required Widget child, double? vertical = 0.0}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: vertical ?? 20),
    decoration: BoxDecoration(
      boxShadow: kElevationToShadow[3],
      borderRadius: BorderRadius.circular(borderradius.boder),
      color: AppColor.cardBg,
    ),
    child: child,
  );
}
