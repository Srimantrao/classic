// ignore_for_file: strict_top_level_inference

import 'package:classic/view/screen/credentials/businessInformation/businessInformationWidget/businessInformationWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/cartcontainer.dart';
import 'package:classic/view/utils/widget/dropdownSelected.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget showImage(String imageShow) {
  if (imageShow.isEmpty) {
    return const SizedBox();
  }
  return Image.network(
    imageShow,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
    errorBuilder: (context, error, stackTrace) {
      return const Center(
        child: Icon(
          Icons.broken_image,
          size: 80,
          color: Colors.grey,
        ),
      );
    },
  );
}

Widget height() {
  return Padding(
    padding: EdgeInsetsGeometry.only(
      bottom: Get.height * 0.080,
    ),
  );
}

Widget fillTheForm(showUI) {
  return horizontalPadding(
    child: cartConatiner(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.pleaseFillTheForm,
            style: TextStyle(
              color: AppColor.primary,
              fontSize: Get.width * 0.050,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.020)),
          inputTyaping(
            text: '${AppString.fullname} *',
            hinttext: AppString.fullname_hint,
            controller: TextEditingController(),
          ),
          inputTyaping(
            text: '${AppString.emailId} *',
            hinttext: AppString.emailId_hint,
            controller: TextEditingController(),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: dropdowns(
                  AppString.mobileNo,
                  value: showUI.country.value,
                  list: showUI.getDropdownCountry(),
                  onChanged: showUI.countryValueChange,
                  hinttext: AppString.countryCode,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(right: Get.width * 0.02),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Text(''),
                    Padding(
                      padding: EdgeInsetsGeometry.only(
                        bottom: Get.height * 0.01,
                      ),
                    ),
                    Inputfield(
                      hinttext: AppString.mobile_hint,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ],
                ),
              ),
            ],
          ),
          inputTyaping(
            maxLength: 100,
            text: '${AppString.message} *',
            hinttext: AppString.message_hint,
            controller: TextEditingController(),
            height: Get.height * 0.09,
          ),
          imNotaRobat(showUI.isCheck.value, showUI.isCheckValue),
          button(AppString.submit, bottomBottonFontSize: true),
        ],
      ),
    ),
  );
}
