// ignore_for_file: file_names, avoid_unnecessary_containers, avoid_print

import 'package:classic/controller/user_Interface/hedder/myAccount/holdDiamonds/holdDiamodUI_Controller.dart';
import 'package:classic/modal/headder/myAccount/holdDiamonds.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/holdDiamods/holdDiamodsExtraWidget/holdDiamodsExtraWidget.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/diamondSection.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/checkbox.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget chekhValueeadder({
  required HolddiamondsListViwe value,
  required HolddiamodUIController holdDiamondUI,
}) {
  final double totalCarats = holdDiamondUI.calculateTotalCarats(
    value.holdDiamond,
  );
  final double totalTotalAmount = holdDiamondUI.calculateTotalTotalAmount(
    value.holdDiamond,
  );
  final double pricePerCarat = holdDiamondUI.calculateRapTotalAmount(
    value.holdDiamond,
  );
  return Container(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.020),
    decoration: BoxDecoration(color: AppColor.secondary),
    child: horizontalPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              chakhedding('PCS'),
              chakValue(holdDiamondUI.selectedIndices.length.toString()),
            ],
          ),
          Column(
            children: [
              chakhedding('CTS'),
              chakValue(totalCarats.toStringAsFixed(2)),
            ],
          ),
          Column(
            children: [
              chakhedding('PRICE/CT'),
              chakValue(pricePerCarat.toStringAsFixed(2)),
            ],
          ),
          Column(
            children: [
              chakhedding('AMOUNT'),
              chakValue(totalTotalAmount.toStringAsFixed(2)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget holdDiamondListViwe({
  required List jewelryList,
  required List<int> selectedIndices,
  required void Function(int) onChanged,
}) {
  return Expanded(
    child: ListView.builder(
      itemCount: jewelryList.length,
      itemBuilder: (BuildContext context, int index) {
        final bool isSelected = selectedIndices.contains(index);
        final jewelry = jewelryList[index];
        return horizontalPadding(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.009),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.gray5),
              borderRadius: BorderRadius.circular(borderradius.buttonboder),
            ),
            child: Padding(
              padding: EdgeInsets.all(Get.width * 0.03),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImage.pandant1, scale: 25),
                  SizedBox(width: Get.width * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '# LLA276A-31',
                              style: TextStyle(
                                fontSize: Textsize.normal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            checkBox(isSelected, (newValue) {
                              onChanged(index);
                            }),
                          ],
                        ),
                        valueShow('Shape: ', jewelry['shape']),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            valueShow('color: ', jewelry['color']),
                            valueShow('clarity: ', jewelry['clarity']),
                            valueShow('Carat: ', jewelry['Carat']),
                            valueShow('cut: ', jewelry['cut']),
                          ],
                        ),
                        valueShow('Lab: ', jewelry['Lab']),
                        Row(
                          children: [
                            valueShow('Rap Price: ', jewelry['Rap Price']),
                            SizedBox(width: Get.width * 0.02),
                            valueShow('Desc: ', jewelry['Desc']),
                          ],
                        ),
                        valueShow('Amount: ', jewelry['price']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget floatingActionButton() {
  return GetBuilder<HolddiamodUIController>(
    init: HolddiamodUIController(),
    builder: (c) {
      return FloatingActionBubble(
        animation: c.animation,
        onPress: c.toggle,
        animatedIconData: AnimatedIcons.menu_close,
        iconColor: AppColor.white,
        backGroundColor: AppColor.primary,
        items: [

          //Download
          Bubble(
            title: AppString.diamond,
            iconColor: Colors.white,
            bubbleColor: AppColor.primary,
            icon: Icons.add,
            titleStyle: TextStyle(
              fontSize: Get.width * 0.028,
              color: Colors.white,
            ),
            onPress: () {
              print("Add pressed");
              c.toggle();
            },
          ),

          //Add to Cart
          Bubble(
            title: AppString.addtoCart,
            iconColor: Colors.white,
            bubbleColor: AppColor.primary,
            icon: Icons.car_crash,
            titleStyle: TextStyle(
              fontSize: Get.width * 0.028,
              color: Colors.white,
            ),
            onPress: () {
              print("Edit pressed");
              c.toggle();
            },
          ),

          //Remove to Hold
          Bubble(
            title: AppString.removetohold,
            iconColor: Colors.white,
            bubbleColor: AppColor.primary,
            icon: Icons.card_travel_rounded,
            titleStyle: TextStyle(
              fontSize: Get.width * 0.028,
              color: Colors.white,
            ),
            onPress: () {
              print("Edit pressed");
              c.toggle();
            },
          ),

          //Add to Whishlist
          Bubble(
            title: "Add to Whishlist",
            iconColor: Colors.white,
            bubbleColor: AppColor.primary,
            icon: Icons.waterfall_chart,
            titleStyle: TextStyle(
              fontSize: Get.width * 0.028,
              color: Colors.white,
            ),
            onPress: () {
              print("Edit pressed");
              c.toggle();
            },
          ),
        ],
      );
    },
  );
}
