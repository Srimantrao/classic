// ignore_for_file: file_names

import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/hedder/myAccount/chnagePassword/changePasswordUI_Controller.dart';
import 'package:classic/controller/user_Interface/widget/logOut/logOut_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/address/addressScreen/address.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/customProduct/customProductScreen/customProduct.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/editProfile/editProfileScreen/editProfile.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/holdDiamods/holdDiamondsScreen/holdDimaond.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/myAccount/myAccountExtraWidget/myAccountExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/myAccount/myAccountWidget/body/myAccontWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryScreen/orderHistory.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/wishlist/wishlistScreen/wishlistScreen.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Myaccount extends StatelessWidget {
  final hedder = Get.put(CartAPICall());
  final logOutUI = Get.put(LogoutController());
  Myaccount({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.myAccount),
      child: Column(
        children: [
          //Edit Profile
          Obx(() {
            final api = hedder.profileDetail.profileDetailData;
            final apiData = api['data'];
            return editNameEmail(
              name: apiData['firstName'],
              email: apiData['email'],
              onTap: () => Get.to(() => Editprofile()),
            );
          }),

          //Show Your  Activity
          showActivity(
            orderhistory: () => Get.to(() => Orderhistory()),
            wishlist: () => Get.to(() => Wishlist()),
            holdDiamond: () => Get.to(() => Holddimaond()),
            customProduct: () => Get.to(() => Customproduct()),
            address: () => Get.to(() => Address()),
            changePassword: () => passwordChange(context),
            logout: logOutUI.logout,
          ),
        ],
      ),
    );
  }
}

void passwordChange(BuildContext context) {
  final changePasswordUI = Get.put(ChangePasswordUiController());
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return horizontalPadding(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderradius.boder),
          ),
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          titlePadding: EdgeInsets.fromLTRB(
            Get.width * 0.05,
            20,
            Get.width * 0.05,
            0,
          ),
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
                    submitOnTap: () {
                      changePasswordUI.changePassword(
                        currentPassword: oldPasswordController.text,
                        newPassword: newPasswordController.text,
                        passwordChange: confirmPasswordController.text,
                      );
                      Get.back();
                    },
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
