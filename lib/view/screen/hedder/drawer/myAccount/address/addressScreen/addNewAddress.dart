// ignore_for_file: file_names, non_constant_identifier_names

import 'package:classic/controller/user_Interface/hedder/myAccount/address/addNewAddress.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/address/addressWidget/body/editAddressWidget.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/bottomNavigationButton.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addnewaddress extends StatelessWidget {
  final AddnewaddressUI = Get.put(AddnewaddressUIController());
  Addnewaddress({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.addAddress),
      bottomNavigationBar: buttonNavigation(
        child: button(
          AppString.addNewAddress,
          bottomBottonFontSize: true,
          isLowercase: true,
        ),
      ),
      child: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              editAdress(
                firstnameController: AddnewaddressUI.firstnameController,
                lastnameController: AddnewaddressUI.lastnameController,
                addressnameController: AddnewaddressUI.addressnameController,
                stateController: AddnewaddressUI.stateController,
                cityController: AddnewaddressUI.cityController,
                zipCodeController: AddnewaddressUI.zipCodeController,
                emailController: AddnewaddressUI.emailController,
                phoneController: AddnewaddressUI.phoneController,
                countryValue: AddnewaddressUI.country.value,
                countryList: AddnewaddressUI.getDropdownCountry(),
                countryOnChanged: AddnewaddressUI.countryValueChange,
              ),
              setDefultButton(AddnewaddressUI),
            ],
          ),
        );
      }),
    );
  }
}
