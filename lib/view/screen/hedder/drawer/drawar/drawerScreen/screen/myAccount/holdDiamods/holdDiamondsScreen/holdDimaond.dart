// ignore_for_file: file_names, invalid_use_of_protected_member
import 'package:classic/controller/user_Interface/hedder/myAccount/holdDiamonds/holdDiamodUI_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/holdDiamods/holdDiamondWidget/body/holdDiamondWidget.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Holddimaond extends StatelessWidget {
  const Holddimaond({super.key});
  @override
  Widget build(BuildContext context) {
    final holdDiamondUI = Get.put(HolddiamodUIController());
    return Fullscreen(
      appBar: allOtherScreen(AppString.holdDimaond, cart: true),
      floatingActionButton: floatingActionButton(),
      child: Obx(() {
        final api = holdDiamondUI;
        final apiData = api.getholdDiamond.getHoldDimaondData;
        final apidataList = apiData['data'] as List?;
        final data = apidataList ?? [];
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