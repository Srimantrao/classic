import 'package:classic/controller/user_Interface/hedder/myAccount/address/showAddress.dart';
import 'package:classic/modal/headder/myAccount/address.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/address/addressScreen/addNewAddress.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/address/addressScreen/editAddress.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/address/addressWidget/body/addressWidget.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/bottomNavigationButton.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  final stateUpdate = Get.put(ShowaddressUIController());
  final address = AddressList();

  Address({super.key});

  @override
  Widget build(BuildContext context) {
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
        addressList: address.addressList,
        stateUpdate: stateUpdate,
        editAddresonTap: () => Get.to(() => Editaddress()),
      ),
    );
  }
}
