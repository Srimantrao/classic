// ignore_for_file: file_names, avoid_print, non_constant_identifier_names

import 'package:classic/controller/user_Interface/credentials/signupUI_Contoller.dart';
import 'package:classic/view/screen/credentials/businessInformation.dart';
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
                      fristnameColor: signupUi.fristnameColor.value ? AppColor.red : AppColor.white,
                      lastnameColor: signupUi.lastnameColor.value ? AppColor.red : AppColor.white,
                      emailIdColor: signupUi.emailIdColor.value ? AppColor.red : AppColor.white,
                      passwordColor: signupUi.passwordColor.value ? AppColor.red : AppColor.white,
                      confirmPasswordColor: signupUi.confirmPasswordColor.value ? AppColor.red : AppColor.white,
                      mobileNoColor: signupUi.mobileNoColor.value ? AppColor.red : AppColor.white,
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
                      onTapNext: () => signupUi.allDoneGotonextPage(Businessinformation()),
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

Widget singUpContainer({
  required TextEditingController fristnameController,
  required TextEditingController lastnameController,
  required TextEditingController emailIdController,
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
  required TextEditingController mobileController,
  required String valueIAM,
  required List<DropdownMenuItem<String>> listIAm,
  void Function(String?)? onChangedIAM,
  required String country,
  required List<DropdownMenuItem<String>> listcountry,
  void Function(String?)? onChangedcountry,
  required String valuehowdidyouhear,
  required List<DropdownMenuItem<String>> listhowdidyouhear,
  void Function(String?)? onChangedhowdidyouhear,
  required String valuememberof,
  required List<DropdownMenuItem<String>> listmemberof,
  void Function(String?)? onChangedmemberof,
  Color? fristnameColor,
  Color? lastnameColor,
  Color? emailIdColor,
  Color? passwordColor,
  Color? confirmPasswordColor,
  Color? mobileNoColor,
  void Function(String)? onChanged_fristname,
  void Function(String)? onChanged_lastname,
  void Function(String)? onChanged_emailId,
  void Function(String)? onChanged_password,
  void Function(String)? onChanged_confirmPassword,
  void Function(String)? onChanged_mobile,
}) {
  return cartConatiner(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        singUpInformationhedding(),
        inputtype(
          fristnameController: fristnameController,
          lastnameController: lastnameController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          emailIdController: emailIdController,
          mobileController: mobileController,
          valueIAM: valueIAM,
          listIAm: listIAm,
          onChangedIAM: onChangedIAM,
          valuehowdidyouhear: valuehowdidyouhear,
          listhowdidyouhear: listhowdidyouhear,
          onChangedhowdidyouhear: onChangedhowdidyouhear,
          valuememberof: valuememberof,
          listmemberof: listmemberof,
          onChangedmemberof: onChangedmemberof,
          country: country,
          listcountry: listcountry,
          onChangedcountry: onChangedcountry,
          fristnameColor: fristnameColor,
          lastnameColor: lastnameColor,
          emailIdColor: emailIdColor,
          confirmPasswordColor: confirmPasswordColor,
          mobileNoColor: mobileNoColor,
          passwordColor: passwordColor,
          onChanged_fristname: onChanged_fristname,
          onChanged_lastname: onChanged_lastname,
          onChanged_password: onChanged_password,
          onChanged_confirmPassword: onChanged_confirmPassword,
          onChanged_emailId: onChanged_emailId,
          onChanged_mobile: onChanged_mobile,
        ),
      ],
    ),
  );
}

Widget singUpInformationhedding() {
  return Column(
    children: [
      hedding(AppString.personalInformation),
      SizedBox(height: Get.height * 0.01),
    ],
  );
}

Widget inputtype({
  required TextEditingController fristnameController,
  required TextEditingController lastnameController,
  required TextEditingController emailIdController,
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
  required TextEditingController mobileController,
  required String valueIAM,
  required List<DropdownMenuItem<String>> listIAm,
  void Function(String?)? onChangedIAM,
  required String country,
  required List<DropdownMenuItem<String>> listcountry,
  void Function(String?)? onChangedcountry,
  required String valuehowdidyouhear,
  required List<DropdownMenuItem<String>> listhowdidyouhear,
  void Function(String?)? onChangedhowdidyouhear,
  required String valuememberof,
  required List<DropdownMenuItem<String>> listmemberof,
  void Function(String?)? onChangedmemberof,
  Color? fristnameColor,
  Color? lastnameColor,
  Color? emailIdColor,
  Color? passwordColor,
  Color? confirmPasswordColor,
  Color? mobileNoColor,
  void Function(String)? onChanged_fristname,
  void Function(String)? onChanged_lastname,
  void Function(String)? onChanged_emailId,
  void Function(String)? onChanged_password,
  void Function(String)? onChanged_confirmPassword,
  void Function(String)? onChanged_mobile,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      inputTyaping(
        text: AppString.fristname,
        controller: fristnameController,
        hinttext: AppString.fristname_hint,
        color: fristnameColor,
        onChanged: onChanged_fristname,
      ),
      inputTyaping(
        text: AppString.lastname,
        controller: lastnameController,
        hinttext: AppString.lastname_hint,
        color: lastnameColor,
        onChanged: onChanged_lastname,
      ),
      inputTyaping(
        text: AppString.emailId,
        controller: emailIdController,
        hinttext: AppString.emailId_hint,
        color: emailIdColor,
        onChanged: onChanged_emailId,
      ),
      inputTyaping(
        text: AppString.password,
        controller: passwordController,
        hinttext: AppString.password_hint,
        obscureText: true,
        color: passwordColor,
        onChanged: onChanged_password
      ),
      inputTyaping(
        text: AppString.confirmPassword,
        controller: confirmPasswordController,
        hinttext: AppString.confirmpassword_hint,
        obscureText: true,
        color: confirmPasswordColor,
        onChanged: onChanged_confirmPassword,
      ),
      Row(
        children: [
          Flexible(
            flex: 2,
            child: dropdowns(
              AppString.countryCode,
              value: country,
              list: listcountry,
              onChanged: onChangedcountry,
              hinttext: AppString.countryCode,
            ),
          ),
          SizedBox(width: Get.width * 0.02),
          Flexible(
            flex: 3,
            child: inputTyaping(
              text: AppString.mobileNo,
              controller: mobileController,
              hinttext: AppString.mobile_hint,
              color: mobileNoColor,
              onChanged: onChanged_mobile,
              maxLength: 10,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ]
            ),
          ),
        ],
      ),
      dropdowns(
        AppString.iam,
        value: valueIAM,
        list: listIAm,
        onChanged: onChangedIAM,
      ),
      dropdowns(
        AppString.howdidyouhear,
        value: valuehowdidyouhear,
        list: listhowdidyouhear,
        onChanged: onChangedhowdidyouhear,
      ),
      dropdowns(
        AppString.memberof,
        value: valuememberof,
        list: listmemberof,
        onChanged: onChangedmemberof,
      ),
    ],
  );
}



