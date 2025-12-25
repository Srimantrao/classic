// ignore_for_file: file_names

import 'package:classic/view/screen/hedder/drawer/myAccount/editProfile/editProfileScreen/editProfile.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/holdDiamods/holdDiamondsScreen/holdDimaond.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/myAccount/myAccountWidget/body/myAccontWidget.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/orderHistory/orderHistoryScreen/orderHistory.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/wishlist/wishlistScreen/wishlistScreen.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
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
          ),
        ],
      ),
    );
  }
}
