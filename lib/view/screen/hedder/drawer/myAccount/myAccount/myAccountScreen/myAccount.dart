// ignore_for_file: file_names

import 'package:classic/view/screen/hedder/drawer/myAccount/address/addressScreen/address.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/customProduct/customProductScreen/customProduct.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/editProfile/editProfileScreen/editProfile.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/holdDiamods/holdDiamondsScreen/holdDimaond.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/myAccount/myAccountExtraWidget/myAccountExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/myAccount/myAccountWidget/body/myAccontWidget.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/orderHistory/orderHistoryScreen/orderHistory.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/wishlist/wishlistScreen/wishlistScreen.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Myaccount extends StatelessWidget {
  const Myaccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.myAccount),
      child: Column(
        children: [
          //Edit Profile
          editNameEmail(
            name: 'Khushraaj Soni',
            email: 'Khageshsoni98@gmail.com',
            onTap: () => Get.to(() => Editprofile()),
          ),

          //Show Your  Activity
          showActivity(
            orderhistory: () => Get.to(() => Orderhistory()),
            wishlist: () => Get.to(() => Wishlist()),
            holdDiamond: () => Get.to(() => Holddimaond()),
            customProduct: () => Get.to(() => Customproduct()),
            address: () => Get.to(() => Address()),
            changePassword: () => passwordChange(context),
          ),
        ],
      ),
    );
  }
}

void passwordChange(BuildContext context) {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return horizontalPadding(
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderradius.boder)),
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          titlePadding: EdgeInsets.fromLTRB(Get.width * 0.05, 20, Get.width * 0.05, 0),
          actionsPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          elevation: 0,
          backgroundColor: AppColor.white,
          title: chnagePasswordTitle(),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  changePasswordInput(
                    oldPasswordController: oldPasswordController,
                    newPasswordController: newPasswordController,
                    confirmPasswordController: confirmPasswordController,
                  ),
                  SizedBox(height: Get.height * 0.01),
                  changePasswordButton(
                    canalOnTap: () => Get.back(),
                    submitOnTap: () => Get.back(),
                  ),
                  SizedBox(height: Get.height * 0.01),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

