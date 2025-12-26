// ignore_for_file: strict_top_level_inference, file_names

import 'package:classic/view/screen/hedder/drawer/myAccount/address/addressExtraWidget/addressExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/checkbox.dart';
import 'package:classic/view/utils/widget/dropdownSelected.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget editAdress({
  required TextEditingController firstnameController,
  required TextEditingController lastnameController,
  required TextEditingController addressnameController,
  required TextEditingController stateController,
  required TextEditingController cityController,
  required TextEditingController zipCodeController,
  required TextEditingController emailController,
  required TextEditingController phoneController,
  required List<DropdownMenuItem<String>> countryList,
  required String countryValue,
  void Function(String?)? countryOnChanged,
}) {
  return horizontalPadding(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.02),
        typeInputEdit(
          controller: firstnameController,
          text: AppString.fristname,
          hinttext: AppString.fristname_hint,
        ),
        typeInputEdit(
          controller: lastnameController,
          text: AppString.lastname,
          hinttext: AppString.lastname_hint,
        ),
        typeInputEdit(
          controller: addressnameController,
          text: AppString.address,
          hinttext: AppString.address,
        ),
        dropdowns(
          AppString.country,
          hinttext: AppString.select,
          value: countryValue,
          border: Border.all(color: AppColor.gray),
          list: countryList,
          onChanged: countryOnChanged,
        ),
        typeInputEdit(
          controller: addressnameController,
          text: AppString.address,
          hinttext: AppString.address,
        ),
        typeInputEdit(
          controller: cityController,
          text: AppString.city,
          hinttext: AppString.city,
        ),
        typeInputEdit(
          controller: stateController,
          text: AppString.state,
          hinttext: AppString.state,
        ),
        typeInputEdit(
          controller: zipCodeController,
          text: AppString.zipCode,
          hinttext: AppString.zipCode,
        ),
        typeInputEdit(
          controller: emailController,
          text: AppString.emailId,
          hinttext: AppString.emailId_hint,
        ),
        typeInputEdit(
          controller: phoneController,
          text: AppString.mobileNo,
          hinttext: AppString.mobile_hint,
        ),
        SizedBox(height: Get.height * 0.02),
      ],
    ),
  );
}

Widget setDefultButton(editaddressUI) {
  return horizontalPadding(
    child: Row(
      children: [
        checkBox(
          boderColor: AppColor.primary,
          editaddressUI.isDefaultAddress.value,
          (value) {
            editaddressUI.isDefaultAddressChange(value);
          },
        ),
        SizedBox(width: Get.width * 0.02),
        Text(AppString.setasDefault),
      ],
    ),
  );
}
