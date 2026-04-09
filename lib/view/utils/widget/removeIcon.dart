import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';

Widget removeIcon() {
  return Container(
    padding: EdgeInsetsGeometry.only(left: 20, right: 0, top: 2, bottom: 2),
    decoration: BoxDecoration(color: AppColor.white),
    child: Icon(Icons.delete_outline, color: AppColor.red, size: 18),
  );
}
