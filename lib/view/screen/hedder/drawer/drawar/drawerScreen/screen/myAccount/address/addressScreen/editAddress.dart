// ignore_for_file: file_names, unnecessary_import

import 'package:classic/controller/user_Interface/hedder/myAccount/address/editAddress.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/address/addressWidget/body/editAddressWidget.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/bottomNavigationButton.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class Editaddress extends StatelessWidget {
  final editaddressUI = Get.put(EditaddressUIController());
  Editaddress({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.editAddress),
      bottomNavigationBar: buttonNavigation(
        child: button(
          AppString.editAddress,
          bottomBottonFontSize: true,
          isLowercase: true,
        ),
      ),
      child: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              editAdress(
                firstnameController: editaddressUI.firstnameController,
                lastnameController: editaddressUI.lastnameController,
                addressnameController: editaddressUI.addressnameController,
                stateController: editaddressUI.stateController,
                cityController: editaddressUI.cityController,
                zipCodeController: editaddressUI.zipCodeController,
                emailController: editaddressUI.emailController,
                phoneController: editaddressUI.phoneController,
                countryValue: editaddressUI.country.value,
                countryList: editaddressUI.getDropdownCountry(),
                countryOnChanged: editaddressUI.countryValueChange,
              ),
              setDefultButton(editaddressUI),
            ],
          ),
        );
      }),
    );
  }
}
