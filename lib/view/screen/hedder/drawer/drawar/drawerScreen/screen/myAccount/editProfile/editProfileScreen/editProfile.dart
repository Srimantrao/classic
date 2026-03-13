// ignore_for_file: file_names

import 'package:classic/controller/user_Interface/hedder/myAccount/editProfile/editProfile_Controller.dart';
import 'package:classic/view/screen/credentials/businessInformation/businessInformationWidget/businessInformationWidget.dart';
import 'package:classic/view/screen/credentials/signUp/singUpWidget/sinupWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_cricularProgrssIndicator.dart';
import 'package:classic/view/utils/widget/bottomNavigationButton.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Editprofile extends StatelessWidget {
  final editProfileUI = Get.put(EditprofileUIController());
  Editprofile({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.editProfile),
      bottomNavigationBar: buttonNavigation(
        child: Obx(() {
          final api = editProfileUI.editprofileButton;
          final apiLoading = api.isLoading.value;
          return button(
            loadingWait: (apiLoading) ? customCircular() : null,
            onTap: editProfileUI.editProfile_edit,
            AppString.saveAddress,
            isLowercase: true,
            bottomBottonFontSize: true,
          );
        }),
      ),
      child: SingleChildScrollView(
        child: horizontalPadding(
          child: Obx(() {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.02),
                ),

                //personal Information
                singUpContainer(
                  fristnameController: editProfileUI.firstNameController,
                  lastnameController: editProfileUI.lastNameController,
                  mobileController: editProfileUI.mobileController,
                  emailIdController: editProfileUI.emailIdController,
                  valueIAM: editProfileUI.selectedValueIAM.value,
                  listIAm: editProfileUI.getDropdownItems(),
                  onChangedIAM: editProfileUI.iamvalueChange,
                  valuehowdidyouhear:
                      editProfileUI.selectedValueHowdidyourhear.value,
                  listhowdidyouhear: editProfileUI.getDropdownItems2(),
                  onChangedhowdidyouhear:
                      editProfileUI.howdidyourhearvalueChange,
                  valuememberof: editProfileUI.selectedValueMemberof.value,
                  listmemberof: editProfileUI.getDropdownItems3(),
                  onChangedmemberof: editProfileUI.memberoflueChange,
                  country: editProfileUI.country.value,
                  listcountry: editProfileUI.getDropdownCountry(),
                  onChangedcountry: editProfileUI.countryValueChange,
                  fristnameColor: editProfileUI.fristnameColor.value
                      ? AppColor.red
                      : AppColor.white,
                  lastnameColor: editProfileUI.lastnameColor.value
                      ? AppColor.red
                      : AppColor.white,
                  emailIdColor: editProfileUI.emailIdColor.value
                      ? AppColor.red
                      : AppColor.white,
                  mobileNoColor: editProfileUI.mobileNoColor.value
                      ? AppColor.red
                      : AppColor.white,
                  onChanged_fristname: editProfileUI.onChanged_fristname,
                  onChanged_lastname: editProfileUI.onChanged_lastname,
                  onChanged_emailId: editProfileUI.onChanged_emailId,
                  onChanged_mobile: editProfileUI.onChanged_mobile,
                ),

                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.03),
                ),

                //Business Information
                businessContainerOne(
                  companyController: editProfileUI.companyController,
                  valueCountry: editProfileUI.country_BusinessInformation.value,
                  listCountry: editProfileUI.getDropdownCountry(),
                  onChangedcountry:
                      editProfileUI.countryValueChangeBusinessInformation,
                  stateController: editProfileUI.stateController,
                  cityController: editProfileUI.cityController,
                  zipController: editProfileUI.zipController,
                  addressController: editProfileUI.addressController,
                  cityColor: editProfileUI.cityColor.value
                      ? AppColor.red
                      : AppColor.white,
                  stateColor: editProfileUI.stateColor.value
                      ? AppColor.red
                      : AppColor.white,
                  companyColor: editProfileUI.companyColor.value
                      ? AppColor.red
                      : AppColor.white,
                  onChangedComapny: editProfileUI.comapnyColor,
                  onChangedState: editProfileUI.stateColors,
                  onChangedCity: editProfileUI.cityColors,
                ),

                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.03),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
