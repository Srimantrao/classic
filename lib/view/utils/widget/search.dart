// ignore_for_file: strict_top_level_inference

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:flutter/material.dart';

Widget searchBar(searchController,
    {String? hinttext, void Function(String)? onChanged}) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Inputfield(
      onChanged: onChanged,
      controller: searchController,
      prefixIcon: Icon(Icons.search_sharp, color: AppColor.gray3, size: 28),
      color: AppColor.gray,
      hinttext: hinttext ?? AppString.search,
      hintStyle: TextStyle(color: AppColor.gray3, fontWeight: FontWeight.w500),
    ),
  );
}
