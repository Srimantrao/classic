// ignore_for_file: strict_top_level_inference, avoid_unnecessary_containers

import 'package:classic/view/screen/hedder/cart/cartWidget/extraWidget/extraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/address/addressExtraWidget/addressExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/address/addressScreen/address.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/checkbox.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget prdoctItem(void Function()? onTap, Widget? icon) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: AppColor.secondary
      ),
      padding: EdgeInsetsGeometry.symmetric(
        vertical: Get.height * 0.02,
      ),
      child: horizontalPadding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            checkoutHeddingText(
              AppString.prdoctItem,
              color: AppColor.primary,
            ),
            icon!,
          ],
        ),
      ),
    ),
  );
}

Widget shippingAddress() {
  return horizontalPadding(
    child: Column(
      children: [
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.02)),
        checkOutContainer(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkoutHeddingText(AppString.checkOut),
              GestureDetector(
                onTap: () => Get.to(() => Address()),
                child: chageBillingAddressText(AppString.changeBillingAddress),
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.01)),
      ],
    ),
  );
}

Widget billingAddress(value, Function(bool?)? onChanged) {
  return horizontalPadding(
    child: Column(
      children: [
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.01)),
        checkOutContainer(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkoutHeddingText(AppString.billing),
              checkBox(value, onChanged),
            ],
          ),
        ),
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.01)),
      ],
    ),
  );
}

Widget remarkInput() {
  return horizontalPadding(
    child: inputTyaping(
      text: AppString.remark,
      controller: TextEditingController(),
      color: AppColor.gray,
      maxLength: 100,
      expands: true,
      height: Get.height * 0.12,
    ),
  );
}

Widget priceDetail() {
  return horizontalPadding(
    child: checkOutContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          checkoutHeddingText(AppString.priceDetails),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.003)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkoutHeddingText(AppString.subTotal, color: AppColor.primary),
              checkoutHeddingText("₹ 0.00", color: AppColor.primary),
            ],
          ),
        ],
      ),
    ),
  );
}
