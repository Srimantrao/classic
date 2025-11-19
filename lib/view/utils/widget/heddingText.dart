// ignore_for_file: file_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/cupertino.dart';

Widget hedding(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.heading,
      fontFamily: 'Sans-Bold',
      fontWeight: FontWeight.w500,
      color: AppColor.primary,
    ),
  );
}
