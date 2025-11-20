// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:classic/controller/user_Interface/credentials/businessInformationUI_Controller.dart';
import 'package:classic/view/screen/credentials/login.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/cartcontainer.dart';
import 'package:classic/view/utils/widget/checkbox.dart';
import 'package:classic/view/utils/widget/dontHaveAndyouHave.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/heddingText.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:classic/view/utils/widget/logo.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/widget/dropdownSelected.dart';
import '../../utils/widget/signupButtons.dart';

class Businessinformation extends StatelessWidget {
  final businessinUI = Get.put(BusinessinformationuiController());
  Businessinformation({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        businessinUI.resetvalues().then((value) {
          Get.off(() => Login());
        });
      },
      child: Fullscreen(
        image: AppImage.spalsh_background,
        child: horizontalPadding(
          child: SingleChildScrollView(
            child: Column(
              children: [
                image(height: Get.height * 0.050),
                Obx(() {
                  return Column(
                    children: [
                      businessContainerOne(
                        companyController: businessinUI.companyController,
                        valueCountry: businessinUI.country.value,
                        listCountry: businessinUI.getDropdownCountry(),
                        onChangedcountry: businessinUI.countryValueChange,
                        stateController: businessinUI.stateController,
                        cityController: businessinUI.cityController,
                        zipController: businessinUI.zipController,
                        addressController: businessinUI.addressController,
                        cityColor: businessinUI.cityColor.value
                            ? AppColor.red
                            : AppColor.white,
                        stateColor: businessinUI.stateColor.value
                            ? AppColor.red
                            : AppColor.white,
                        companyColor: businessinUI.companyColor.value
                            ? AppColor.red
                            : AppColor.white,
                        onChangedComapny: businessinUI.comapnyColor,
                        onChangedState: businessinUI.stateColors,
                        onChangedCity: businessinUI.cityColors,
                      ),
                      businessContainerSecond(
                        valueReadAndAgree: businessinUI.readandAgree.value,
                        onChangedReadAndAgree: businessinUI.readandAgreeValueChange,
                        valuestockupdate: businessinUI.stock.value,
                        onChangedstockupdate: businessinUI.stockupdateValueChange,
                      ),
                      imNotaRobat(
                        businessinUI.isCheck.value,
                        businessinUI.isCheckValue,
                      ),
                      signupButton(
                        text: AppString.signUp,
                        text2: AppString.reset,
                        onTapBack: () {
                          businessinUI.resetvalues().then((value) {
                            Get.off(() => Login());
                          });
                        },
                        onTapNext: () => businessinUI.okLetsGetSignUP(Text('Ok Get Login')),
                      ),
                      have(
                        have: AppString.haveanAccount,
                        tab: AppString.signIn,
                        onTap: () => Get.offAll(() => Login()),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
