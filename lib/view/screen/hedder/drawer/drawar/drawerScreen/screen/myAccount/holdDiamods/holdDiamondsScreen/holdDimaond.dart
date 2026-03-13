// ignore_for_file: file_names, invalid_use_of_protected_member
import 'package:classic/controller/user_Interface/hedder/myAccount/holdDiamonds/holdDiamodUI_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/holdDiamods/holdDiamondWidget/body/holdDiamondWidget.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Holddimaond extends StatelessWidget {
  const Holddimaond({super.key});
  @override
  Widget build(BuildContext context) {
    final holdDiamondUI = Get.put(HolddiamodUIController());
    return Fullscreen(
      appBar: allOtherScreen(AppString.holdDimaond, cart: true),
      floatingActionButton: floatingActionButton(
        removeToHoldonPress: holdDiamondUI.removeHoldDiamond,
        addToCart: holdDiamondUI.addToCart,
        addToWishList: holdDiamondUI.addToWishListCart,
      ),
      child: Obx(() {
        final api = holdDiamondUI.getholdDiamond;
        final apiData = api.getHoldDimaondData;
        final apidataList = apiData['data'] as List? ?? [];
        if (apidataList.isEmpty) {
          return Center(
            child: Lottie.asset(AppJson.noData),
          );
        }
        final data = apidataList;
        return Column(
          children: [
            if (holdDiamondUI.holdDiamondList.contains(true))
              chekhValueeadder(holdDiamondUI, data),
            holdDiamondListViwe(jewelryList: data),
          ],
        );
      }),
    );
  }
}
