// ignore_for_file: file_names, avoid_unnecessary_containers, avoid_print

import 'package:classic/controller/user_Interface/hedder/myAccount/holdDiamonds/holdDiamodUI_Controller.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/diamondSection.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/checkbox.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../menu/diamondSearch/diamondWidget/body/searchResultWidget.dart';

Widget chekhValueeadder(HolddiamodUIController holdcontroller, List valueList) {
  return holdDiamondValueList(
    pcs: holdcontroller.selectedDiamondCount.toString(),
    cts: holdcontroller.getTotalCts(valueList).toStringAsFixed(2),
    price: holdcontroller.getTotalCarat(valueList).toStringAsFixed(2),
    amount: holdcontroller.getTotalAmount(valueList).toStringAsFixed(2),
  );
}

Widget holdDiamondListViwe({required List<dynamic> jewelryList}) {
  final holdDiamondUI = Get.find<HolddiamodUIController>();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (holdDiamondUI.holdDiamondList.length != jewelryList.length) {
      holdDiamondUI.initializeHoldDiamondList(jewelryList.length);
    }
  });
  return Expanded(
    child: ListView.builder(
      itemCount: jewelryList.length,
      itemBuilder: (BuildContext context, int index) {
        final holdDiamondUI = Get.put(HolddiamodUIController());
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * 0.12,
                    height: Get.width * 0.12,
                    child:
                        (jewelry['imageurl1'] != null &&
                            jewelry['imageurl1'].toString().isNotEmpty)
                        ? Image.network(
                            jewelry['imageurl1'],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: Icon(
                                  Icons.broken_image,
                                  color: Colors.grey[600],
                                ),
                              );
                            },
                          )
                        : Container(
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey[600],
                            ),
                          ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: Get.width * 0.03),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              jewelry['stockId'],
                              style: TextStyle(
                                fontSize: Textsize.normal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            checkBox(
                              boderColor: AppColor.primary,
                              index < holdDiamondUI.holdDiamondList.length
                                  ? holdDiamondUI.holdDiamondList[index]
                                  : false,
                              (value) {
                                if (index <
                                    holdDiamondUI.holdDiamondList.length) {
                                  holdDiamondUI.holdDiamondValue(index, value!);
                                }
                              },
                            ),
                          ],
                        ),
                        valueShow(AppString.shape, jewelry['shape'] ?? ''),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              valueShow(
                                AppString.color,
                                jewelry['color'] ?? '',
                              ),
                              Padding(
                                padding: EdgeInsetsGeometry.only(
                                  left: Get.width * 0.015,
                                ),
                              ),
                              valueShow(
                                AppString.clarity,
                                jewelry['clarity'] ?? '',
                              ),
                              Padding(
                                padding: EdgeInsetsGeometry.only(
                                  left: Get.width * 0.015,
                                ),
                              ),
                              valueShow(
                                AppString.carat,
                                jewelry['carat'] ?? '',
                              ),
                              Padding(
                                padding: EdgeInsetsGeometry.only(
                                  left: Get.width * 0.015,
                                ),
                              ),
                              valueShow(AppString.cut, jewelry['cut'] ?? ''),
                            ],
                          ),
                        ),
                        valueShow(AppString.lab, jewelry['lab'] ?? ''),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              valueShow(
                                AppString.parcarat,
                                jewelry['parcarat']?.toString() ?? '',
                              ),
                              SizedBox(width: 8),
                              valueShow(
                                AppString.discount,
                                jewelry['CustomeJewellerDiscountAmount']
                                        ?.toString() ??
                                    '',
                              ),
                            ],
                          ),
                        ),
                        valueShow(
                          AppString.amount,
                          jewelry['finalamount']?.toString() ?? '',
                        ),
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

Widget floatingActionButton({
  bool addHold = false,
  bool removeToHold = false,
  void Function()? addToHoldonPress,
  void Function()? removeToHoldonPress,
  void Function()? addToCart,
  void Function()? addToWishList,
}) {
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
              addToCart?.call();
              c.toggle();
            },
          ),

          //Add To Hold
          if (addHold)
            Bubble(
              title: AppString.addtohold,
              iconColor: Colors.white,
              bubbleColor: AppColor.primary,
              icon: Icons.card_travel_rounded,
              titleStyle: TextStyle(
                fontSize: Get.width * 0.028,
                color: Colors.white,
              ),
              onPress: () {
                addToHoldonPress?.call();
                c.toggle();
              },
            ),

          //Remove to Hold
          if(removeToHold)
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
              removeToHoldonPress?.call();
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
              addToWishList?.call();
              c.toggle();
            },
          ),
        ],
      );
    },
  );
}
