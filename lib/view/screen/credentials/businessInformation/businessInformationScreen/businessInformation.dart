// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:classic/controller/user_Interface/credentials/businessInformationUI_Controller.dart';
import 'package:classic/view/screen/credentials/businessInformation/businessInformationWidget/businessInformationWidget.dart';
import 'package:classic/view/screen/credentials/login/loginScreen/login.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/dontHaveAndyouHave.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/widget/signupButtons.dart';

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
                        onTapNext: () => (businessinUI.signUpAIP.isLoading.value)
                            ? CircularProgressIndicator()
                            : businessinUI.signUp(Login()),
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