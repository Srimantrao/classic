import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/address/getAddress_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/address/removeAddress_Controller.dart';
import 'package:classic/controller/user_Interface/hedder/myAccount/address/showAddress.dart';
import 'package:classic/modal/headder/myAccount/address.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/address/addressScreen/addNewAddress.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/address/addressScreen/editAddress.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/address/addressWidget/body/addressWidget.dart';
import 'package:classic/view/utils/app_Constants.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/bottomNavigationButton.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  final stateUpdate = Get.put(ShowaddressUIController());
  final getAddress = Get.put(GetAddressController());
  final removeAddress = Get.put(RemoveAddressController());
  final address = AddressList();
  Address({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final api = getAddress.gerAddress;
      final appdata = api['data'];
      return Fullscreen(
        appBar: allOtherScreen(AppString.address),
        bottomNavigationBar: buttonNavigation(
          child: button(
            AppString.addNewAddress,
            bottomBottonFontSize: true,
            isLowercase: true,
            onTap: () => Get.to(() => Addnewaddress()),
          ),
        ),
        child: addressList(
          addressList: appdata,
          stateUpdate: stateUpdate,
          editAddresonTap: () => Get.to(() => Editaddress()),
        ),
      );
    });
  }
}
