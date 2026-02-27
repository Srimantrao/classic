// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:classic/controller/user_Interface/hedder/myAccount/holdDiamonds/holdDiamodUI_Controller.dart';
import 'package:classic/modal/headder/myAccount/holdDiamonds.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/holdDiamods/holdDiamondWidget/body/holdDiamondWidget.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Holddimaond extends StatelessWidget {
  final value = HolddiamondsListViwe();
  final holdDiamondUI = Get.put(HolddiamodUIController());
  Holddimaond({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen('Hold Diamonds', cart: true),
      floatingActionButton: floatingActionButton(),
      child: Obx(() {
        return Column(
          children: [
            (holdDiamondUI.selectedIndices.isNotEmpty)
                ? chekhValueeadder(value: value, holdDiamondUI: holdDiamondUI)
                : SizedBox(),
            holdDiamondListViwe(
              selectedIndices: holdDiamondUI.selectedIndices.value,
              jewelryList: value.holdDiamond,
              onChanged: (index) => holdDiamondUI.toggleSelection(index),
            ),
          ],
        );
      }),
    );
  }
}

