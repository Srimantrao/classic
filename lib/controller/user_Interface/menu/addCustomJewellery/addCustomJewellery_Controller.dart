// ignore_for_file: file_names, avoid_print

import 'package:classic/modal/menu/addCustomJewellery/addCustomJewellery.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddcustomjewelleryController extends GetxController {
  //Dorop Down
  final addcustomjewelleryItems = Get.put(AddcustomjewelleryItems());
  var productType = ''.obs;

  //List
  List<DropdownMenuItem<String>> getProductTypeItems() {
    return addcustomjewelleryItems.productTypeItem.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  //onChnage Value of Dropdown
  void productTypeValueChange(String? newValue) {
    productType.value = newValue!;
    print(
      'Selected value: ${addcustomjewelleryItems.productTypeItem[newValue]}',
    );
  }

  //Upload Your File
  var selectedImageType = false.obs;
  var selectedVideoType = false.obs;
  var selectedURLType = false.obs;

  void selectImageType() {
    selectedImageType.value = true;
    selectedVideoType.value = false;
    selectedURLType.value = false;
  }

  void selectVideoType() {
    selectedImageType.value = false;
    selectedVideoType.value = true;
    selectedURLType.value = false;
  }

  void selectURLType() {
    selectedImageType.value = false;
    selectedVideoType.value = false;
    selectedURLType.value = true;
  }
}
