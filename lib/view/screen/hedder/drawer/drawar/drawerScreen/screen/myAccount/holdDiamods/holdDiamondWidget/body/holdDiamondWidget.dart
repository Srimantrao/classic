// ignore_for_file: invalid_null_aware_operator, unnecessary_null_comparison, file_names, avoid_unnecessary_containers, avoid_print, deprecated_member_use

import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/diamondSection.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/checkbox.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../controller/user_Interface/hedder/drawer/myAccount/holdDiamonds/holdDiamodUI_Controller.dart';
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
        final holdDiamondUI = Get.find<HolddiamodUIController>();
        final jewelry = jewelryList[index];
        return cartViwe(
          imageURL: jewelry['imageurl1'] ?? '',
          stockId: jewelry['stockId'] ?? '',
          shape: jewelry['shape'] ?? '',
          color: jewelry['color'] ?? '',
          clarity: jewelry['clarity'] ?? '',
          carat: jewelry['carat']?.toString() ?? '',
          cut: jewelry['cut'] ?? '',
          lab: jewelry['lab'] ?? '',
          parcarat: jewelry['parcarat']?.toString() ?? '',
          customeJewellerDiscountAmount:
              jewelry['CustomeJewellerDiscountAmount']?.toString() ?? '',
          finalamount: jewelry['finalamount']?.toString() ?? '',
          checkBoxWidget: checkBox(
            boderColor: AppColor.primary,
            index < holdDiamondUI.holdDiamondList.length
                ? holdDiamondUI.holdDiamondList[index]
                : false,
            (value) {
              if (index < holdDiamondUI.holdDiamondList.length) {
                holdDiamondUI.holdDiamondValue(index, value!);
              }
            },
          ),
        );
      },
    ),
  );
}

Widget cartViwe({
  required String imageURL,
  required String stockId,
  required String shape,
  required String color,
  required String clarity,
  required String carat,
  required String cut,
  required String lab,
  required String parcarat,
  required String customeJewellerDiscountAmount,
  required String finalamount,
  Widget? checkBoxWidget,
}) {
  return horizontalPadding(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.009),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.gray3),
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
              child: (imageURL != null && imageURL.toString().isNotEmpty)
                  ? Image.network(
                      imageURL,
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
            Padding(padding: EdgeInsetsGeometry.only(left: Get.width * 0.03)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        stockId,
                        style: TextStyle(
                          fontSize: Textsize.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      checkBoxWidget ?? SizedBox(),
                    ],
                  ),
                  Row(
                    children: [
                      valueShow(AppString.shape, shape),
                      SizedBox(width: 8),
                      valueShow(AppString.amount, finalamount?.toString() ?? ''),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        valueShow(AppString.color, color),
                        Padding(
                          padding: EdgeInsetsGeometry.only(
                            left: Get.width * 0.015,
                          ),
                        ),
                        valueShow(AppString.clarity, clarity),
                        Padding(
                          padding: EdgeInsetsGeometry.only(
                            left: Get.width * 0.015,
                          ),
                        ),
                        valueShow(AppString.carat, carat),
                        Padding(
                          padding: EdgeInsetsGeometry.only(
                            left: Get.width * 0.015,
                          ),
                        ),
                        valueShow(AppString.cut, cut),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        valueShow(AppString.lab, lab),
                        SizedBox(width: 8),
                        valueShow(
                          AppString.parcarat,
                          parcarat?.toString() ?? '',
                        ),
                        SizedBox(width: 8),
                        valueShow(
                          AppString.discount,
                          customeJewellerDiscountAmount?.toString() ?? '',
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
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
      return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: AnimatedBuilder(
              animation: c.animationController,
              builder: (context, child) {
                return Visibility(
                  visible: c.animationController.value > 0,
                  child: GestureDetector(
                    onTap: c.toggle,
                    child: Container(
                      width: Get.width * 2, // Large enough to cover screen
                      height: Get.height * 2,
                      color: Colors.black.withOpacity(
                        c.animationController.value * 0.5,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedBuilder(
                animation: c.animationController,
                builder: (context, child) {
                  return Visibility(
                    visible: c.animationController.value > 0.01,
                    child: Opacity(
                      opacity: c.animationController.value,
                      child: Transform.translate(
                        offset: Offset(
                          0,
                          (1 - c.animationController.value) * 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _customBubble(
                              title: AppString.download,
                              icon: Icons.download,
                              onTap: () {
                                // Add download logic
                                c.toggle();
                              },
                            ),
                            _customBubble(
                              title: AppString.addtoCart,
                              icon: Icons.shopping_cart,
                              onTap: () {
                                addToCart?.call();
                                c.toggle();
                              },
                            ),
                            if (addHold)
                              _customBubble(
                                title: AppString.addtohold,
                                icon: Icons.pause_circle_filled,
                                onTap: () {
                                  addToHoldonPress?.call();
                                  c.toggle();
                                },
                              ),
                            if (removeToHold)
                              _customBubble(
                                title: AppString.removetohold,
                                icon: Icons.remove_circle,
                                onTap: () {
                                  removeToHoldonPress?.call();
                                  c.toggle();
                                },
                              ),
                            _customBubble(
                              title: "Add to Wishlist",
                              icon: Icons.favorite,
                              onTap: () {
                                addToWishList?.call();
                                c.toggle();
                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Main Toggle FAB
              FloatingActionButton(
                heroTag: "main_fab_diamond",
                backgroundColor: AppColor.primary,
                onPressed: c.toggle,
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: c.animation,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Widget _customBubble({
  required String title,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: Get.width * 0.32,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(borderradius.buttonboder),
          ),
          child: Text(
            textAlign: TextAlign.end,
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: Textsize.samisubHedding,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: Get.width * 0.02),
        FloatingActionButton(
          heroTag: "fab_$title",
          backgroundColor: AppColor.white,
          onPressed: onTap,
          child: Icon(icon, color: AppColor.primary, size: 35),
        ),
      ],
    ),
  );
}
