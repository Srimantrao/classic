// ignore_for_file: unnecessary_import, strict_top_level_inference

import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget checkBox(value, onChanged) {
  return Transform.scale(
    scale: 1.2,
    child: Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      overlayColor: WidgetStateColor.transparent,
      hoverColor: WidgetStateColor.transparent,
      focusColor: Colors.transparent,
      checkColor: AppColor.white,
      activeColor: AppColor.primary,
      side: BorderSide(width: 1, color: AppColor.gray),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.primary;
        }
        return AppColor.white;
      }),
      value: value,
      onChanged: onChanged,
    ),
  );
}
