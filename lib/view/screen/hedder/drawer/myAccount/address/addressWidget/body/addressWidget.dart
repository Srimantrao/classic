// ignore_for_file: file_names, unused_import

import 'package:classic/controller/user_Interface/hedder/myAccount/address/showAddress.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/address/addressExtraWidget/addressExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/address/addressScreen/editAddress.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget addressList({
  required List addressList,
  void Function()? onTap,
  required ShowaddressUIController stateUpdate,
  void Function()? editAddresonTap,
}) {
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
                      onTap: editAddresonTap,
                      child: chageBillingAddressText(
                        AppString.changeBillingAddress,
                      ),
                    ),
                  ],
                ),
                addressListText(show['name']),
                addressListText(show['address']),
                addressListText(show['city']),
                Row(
                  children: [
                    addressListText('Mobile No : '),
                    addressListText('${'+91'}${show['mobile']}'),
                  ],
                ),
                SizedBox(height: Get.height * 0.025),
                Obx(
                  () => (stateUpdate.selectedDefaultAddressIndex.value == index)
                      ? removeAccountButton()
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
