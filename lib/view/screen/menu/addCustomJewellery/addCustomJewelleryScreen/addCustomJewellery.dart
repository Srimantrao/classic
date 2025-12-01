// ignore_for_file: file_names

import 'package:classic/controller/user_Interface/menu/addCustomJewellery/addCustomJewellery_Controller.dart';
import 'package:classic/view/screen/menu/addCustomJewellery/addCustomJewelleryWidget/body/addCustomJewelleryWidget.dart';
import 'package:classic/view/screen/menu/addCustomJewellery/addCustomJewelleryWidget/headder/appbar.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomJewellery extends StatelessWidget {
  final addCustomJewellery = Get.put(AddcustomjewelleryController());
  AddCustomJewellery({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: appBarAddCustomJewellery(
        prefixIcon: AppIcon.newcart,
        suffixIcon: AppIcon.drawer,
        hedding: AppString.addCustomJewellery,
      ),
      child: SingleChildScrollView(
        child: horizontalPadding(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.02),
              Obx(() {
                return Column(
                  children: [
                    //Product Type Dropdown
                    productType(
                      list: addCustomJewellery.getProductTypeItems(),
                      value: addCustomJewellery.productType.value,
                      onChanged: addCustomJewellery.productTypeValueChange,
                    ),

                    //Upload Your File
                    uploadYourFile(
                      imageColor: addCustomJewellery.selectedImageType.value
                          ? AppColor.primary
                          : AppColor.gray,
                      videoColor: addCustomJewellery.selectedVideoType.value
                          ? AppColor.primary
                          : AppColor.gray3,
                      urlColor: addCustomJewellery.selectedURLType.value
                          ? AppColor.primary
                          : AppColor.gray3,
                      videoOnTap: () => addCustomJewellery.selectVideoType(),
                      imageOnTap: () => addCustomJewellery.selectImageType(),
                      urlOnTap: () => addCustomJewellery.selectURLType(),
                    ),
                  ],
                );
              }),
              SizedBox(height: Get.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
