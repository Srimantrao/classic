// ignore_for_file: file_names, avoid_print

import 'package:classic/view/screen/menu/addCustomJewellery/addCustomJewelleryExtraWidget/addCustomJewelleryExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/dropdownSelected.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget productType({
  required List<DropdownMenuItem<String>> list,
  required String value,
  required ValueChanged<String?> onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      addCustomJewelleryHeddingText(AppString.productType),
      dropdowns(
        '',
        hinttext: AppString.productType,
        list: list,
        value: value,
        onChanged: onChanged,
        border: Border.all(color: AppColor.gray5),
        fontWeight: FontWeight.w500,
      ),
    ],
  );
}

Widget uploadYourFile({
  required Color imageColor,
  required Color videoColor,
  required Color urlColor,
  required void Function() videoOnTap,
  required void Function() imageOnTap,
  required void Function() urlOnTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      addCustomJewelleryHeddingText(AppString.uploadYourImage),
      addCustomJewellerySubHeddingText(AppString.youmay),
      SizedBox(height: Get.height * 0.02),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          roundCircleSelector(
            imageText: AppString.image,
            videoText: AppString.video,
            urlText: AppString.url,
            imageOnTap: imageOnTap,
            videoOnTap: videoOnTap,
            urlOnTap: urlOnTap,
            imageColor: imageColor,
            videoColor: videoColor,
            urlColor: urlColor,
          ),
        ],
      ),
    ],
  );
}

