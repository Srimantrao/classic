// ignore_for_file: file_names, non_constant_identifier_names, strict_top_level_inference

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/cartcontainer.dart';
import 'package:classic/view/utils/widget/checkbox.dart';
import 'package:classic/view/utils/widget/dropdownSelected.dart';
import 'package:classic/view/utils/widget/heddingText.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget hedings(text) {
  return Column(
    children: [
      hedding(text),
      SizedBox(height: Get.height * 0.01),
    ],
  );
}

Widget businessContainerOne({
  required TextEditingController companyController,
  required TextEditingController stateController,
  required TextEditingController cityController,
  required TextEditingController zipController,
  required TextEditingController addressController,
  required String valueCountry,
  required List<DropdownMenuItem<String>> listCountry,
  void Function(String?)? onChangedcountry,
  Color? companyColor,
  Color? stateColor,
  Color? cityColor,
  void Function(String?)? onChangedComapny,
  void Function(String?)? onChangedState,
  void Function(String?)? onChangedCity,
}) {
  return cartConatiner(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hedings(AppString.businessInformation),
        inputTyaping(
          text: AppString.compamnyname,
          hinttext: AppString.companyname_hint,
          controller: companyController,
          color: companyColor,
          onChanged: onChangedComapny,
        ),
        dropdowns(
          AppString.country,
          value: valueCountry,
          list: listCountry,
          onChanged: onChangedcountry,
        ),
        inputTyaping(
          text: AppString.state,
          hinttext: AppString.state_hint,
          controller: stateController,
          color: stateColor,
          onChanged: onChangedState,
        ),
        inputTyaping(
          text: AppString.city,
          hinttext: AppString.city_hint,
          controller: cityController,
          color: cityColor,
          onChanged: onChangedCity,
        ),
        inputTyaping(
          text: AppString.zipCode,
          hinttext: AppString.zipCode_hint,
          controller: zipController,
        ),
        inputTyaping(
          height: Get.height * 0.15,
          expands: true,
          text: AppString.address,
          hinttext: '${AppString.address}......',
          controller: addressController,
          textAlignVertical: TextAlignVertical.top,
        ),
      ],
    ),
  );
}

Widget businessContainerSecond({
  bool? valueReadAndAgree,
  void Function(bool?)? onChangedReadAndAgree,
  bool? valuestockupdate,
  void Function(bool?)? onChangedstockupdate,
}) {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.03),
      cartConatiner(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hedings(AppString.terms),
            checkvalue(
              text: AppString.readAndAgree,
              value: valueReadAndAgree!,
              onChanged: onChangedReadAndAgree,
            ),
            SizedBox(height: Get.height * 0.01),
            checkvalue(
              text: AppString.stockupdate,
              value: valuestockupdate!,
              onChanged: onChangedstockupdate,
            ),
            SizedBox(height: Get.height * 0.02),
            KYC(),
          ],
        ),
      ),
      SizedBox(height: Get.height * 0.02),
    ],
  );
}

Widget KYC() {
  return Container(
    margin: EdgeInsets.only(right: Get.width * 0.25),
    child: DottedBorder(
      color: AppColor.primary,
      strokeWidth: 1,
      dashPattern: [6, 6],
      borderType: BorderType.RRect,
      radius: Radius.circular(borderradius.buttonboder),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            AppString.downloadKYCformant,
            style: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.w600,
              fontSize: Textsize.subheding,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget imNotaRobat(value, onChanged) {
  return Column(
    children: [
      Row(
        children: [
          checkBox(value, onChanged),
          SizedBox(width: Get.width * 0.03),
          Text(
            AppString.robot,
            style: TextStyle(
              fontSize: Textsize.normal,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      SizedBox(height: Get.height * 0.01),
      Divider(color: AppColor.secondary, thickness: 2),
      SizedBox(height: Get.height * 0.01),
    ],
  );
}

Widget checkvalue({
  required String text,
  required bool value,
  void Function(bool?)? onChanged,
}) {
  return Row(
    children: [
      checkBox(value, onChanged),
      SizedBox(width: Get.width * 0.03),
      SizedBox(
        width: Get.width * 0.75,
        child: Text(text, style: TextStyle(fontSize: Textsize.normal)),
      ),
    ],
  );
}
