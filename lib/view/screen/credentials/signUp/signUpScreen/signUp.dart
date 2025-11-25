// ignore_for_file: file_names, avoid_print, non_constant_identifier_names

import 'package:classic/controller/user_Interface/credentials/signupUI_Contoller.dart';
import 'package:classic/view/screen/credentials/businessInformation/businessInformationScreen/businessInformation.dart';
import 'package:classic/view/screen/credentials/signUp/singUpWidget/sinupWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/cartcontainer.dart';
import 'package:classic/view/utils/widget/dropdownSelected.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/heddingText.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:classic/view/utils/widget/logo.dart';
import 'package:classic/view/utils/widget/signupButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  final signupUi = Get.put(SignupuiContoller());

  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      image: AppImage.spalsh_background,
      child: horizontalPadding(
        child: SingleChildScrollView(
          child: Column(
            children: [
              image(height: Get.height * 0.050),
              Obx(() {
                return Column(
                  children: [
                    singUpContainer(
                      fristnameController: signupUi.firstNameController,
                      lastnameController: signupUi.lastNameController,
                      mobileController: signupUi.mobileController,
                      emailIdController: signupUi.emailIdController,
                      confirmPasswordController: signupUi.confirmPasswordController,
                      passwordController: signupUi.passwordController,
                      valueIAM: signupUi.selectedValueIAM.value,
                      listIAm: signupUi.getDropdownItems(),
                      onChangedIAM: signupUi.iamvalueChange,
                      valuehowdidyouhear: signupUi.selectedValueHowdidyourhear.value,
                      listhowdidyouhear: signupUi.getDropdownItems2(),
                      onChangedhowdidyouhear: signupUi.howdidyourhearvalueChange,
                      valuememberof: signupUi.selectedValueMemberof.value,
                      listmemberof: signupUi.getDropdownItems3(),
                      onChangedmemberof: signupUi.memberoflueChange,
                      country: signupUi.country.value,
                      listcountry: signupUi.getDropdownCountry(),
                      onChangedcountry: signupUi.countryValueChange,
                      fristnameColor: signupUi.fristnameColor.value
                          ? AppColor.red
                          : AppColor.white,
                      lastnameColor: signupUi.lastnameColor.value
                          ? AppColor.red
                          : AppColor.white,
                      emailIdColor: signupUi.emailIdColor.value
                          ? AppColor.red
                          : AppColor.white,
                      passwordColor: signupUi.passwordColor.value
                          ? AppColor.red
                          : AppColor.white,
                      confirmPasswordColor: signupUi.confirmPasswordColor.value
                          ? AppColor.red
                          : AppColor.white,
                      mobileNoColor: signupUi.mobileNoColor.value
                          ? AppColor.red
                          : AppColor.white,
                      onChanged_fristname: signupUi.onChanged_fristname,
                      onChanged_lastname: signupUi.onChanged_lastname,
                      onChanged_password: signupUi.onChanged_password,
                      onChanged_confirmPassword: signupUi.onChanged_confirmPassword,
                      onChanged_emailId: signupUi.onChanged_emailId,
                      onChanged_mobile: signupUi.onChanged_mobile,
                    ),
                    signupButton(
                      text: AppString.next,
                      onTapBack: Get.back,
                      onTapNext: () {
                        signupUi.allDoneGotonextPage(Businessinformation());
                      }
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}