
// ignore_for_file: file_names

import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/customProduct/customProduct_Controller.dart';
import 'package:classic/modal/headder/myAccount/customProduct.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/customProduct/customProductWidget/body/customProduct.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/orderHistory/orderHistoryExtraWidget/orderHistroryExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customproduct extends StatelessWidget {
  final customList = CustomproductList();
  final customProduct = Get.put(CustomProductController());
  Customproduct({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen('Custom Product'),
      child: horizontalPadding(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.02),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: orderHistoyDecoration(),
                child: Column(
                  children: [
                    custumProduct(),
                    Divider(color: AppColor.secondary),
                    customProductValue(customProduct.customProductData['data']),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



