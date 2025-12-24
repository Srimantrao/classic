// ignore_for_file: file_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/indexButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget indexButtons({
  required bool isSelectDiamond,
  required bool isSelectJewellwery,
  void Function()? onTapDiamond,
  void Function()? onTapJewellwery,
}) {
  return horizontalPadding(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: indexButton(
            onTap: onTapJewellwery,
            text: AppString.jewellwery,
            color: (isSelectJewellwery) ? AppColor.primary : AppColor.white,
            textColor: (isSelectJewellwery) ? AppColor.white : AppColor.black,
            borderColor: (isSelectJewellwery)
                ? AppColor.primary
                : AppColor.gray3,
          ),
        ),
        SizedBox(width: Get.width * 0.04),
        Expanded(
          child: indexButton(
            onTap: onTapDiamond,
            text: AppString.diamond,
            color: (isSelectDiamond) ? AppColor.primary : AppColor.white,
            textColor: (isSelectDiamond) ? AppColor.white : AppColor.black,
            borderColor: (isSelectDiamond) ? AppColor.primary : AppColor.gray3,
          ),
        ),
      ],
    ),
  );
}
