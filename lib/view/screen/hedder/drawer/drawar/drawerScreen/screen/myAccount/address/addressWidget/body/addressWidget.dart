// ignore_for_file: file_names, unused_import

import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/address/getAddress_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/address/removeAddress_Controller.dart';
import 'package:classic/controller/user_Interface/hedder/myAccount/address/showAddress.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/address/addressExtraWidget/addressExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/address/addressScreen/editAddress.dart';
import 'package:classic/view/utils/app_Constants.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget addressList({
  required List addressList,
  void Function()? onTap,
  required ShowaddressUIController stateUpdate,
  void Function()? editAddresonTap,
  void Function()? removeAddresonTap,
}) {
  final getAddress = Get.put(GetAddressController());
  final removeAddress = Get.put(RemoveAddressController());
  return horizontalPadding(
    child: ListView.builder(
      itemCount: addressList.length,
      itemBuilder: (BuildContext context, int index) {
        final show = addressList[index];
        return GestureDetector(
          onTap: () => stateUpdate.selectDefaultAddress(index),
          child: Container(
            margin: EdgeInsetsGeometry.symmetric(vertical: Get.height * 0.01),
            decoration: listDecoration(),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => Editaddress(index: index),
                          arguments: index,
                        );
                      },
                      child: chageBillingAddressText(
                        AppString.changeBillingAddress,
                      ),
                    ),
                  ],
                ),
                addressListText(show['firstName']),
                addressListText(show['address']),
                addressListText(show['city']),
                Row(
                  children: [
                    addressListText('Mobile No : '),
                    addressListText('${'+91'}${show['phone'].toString()}'),
                  ],
                ),
                SizedBox(height: Get.height * 0.025),
                Obx(
                  () => (stateUpdate.selectedDefaultAddressIndex.value == index)
                      ? removeAccountButton(() async {
                          await removeAddress.removeAddressPost(show['_id']);
                          getAddress.getAddress(userID);
                        })
                      : SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
