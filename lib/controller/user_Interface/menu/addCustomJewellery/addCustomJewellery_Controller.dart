// ignore_for_file: file_names, avoid_print

import 'package:classic/modal/menu/addCustomJewellery/addCustomJewellery.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class AddcustomjewelleryUIController extends GetxController {
  final yourCommentsController = TextEditingController();
  final addURlTextController = TextEditingController();
  final appxMetalWeightController = TextEditingController();
  final budgetController = TextEditingController();
  final engravingController = TextEditingController();

  //Dorop Down
  final addcustomjewelleryItems = Get.put(AddcustomjewelleryItems());
  var productType = ''.obs;
  var metalType = ''.obs;
  var metalStamp = ''.obs;
  var ringSize = ''.obs;

  //List
  List<DropdownMenuItem<String>> getProductTypeItems() {
    return addcustomjewelleryItems.productTypeItem.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }
  
  List<DropdownMenuItem<String>> getMetalTypeItems() {
    return addcustomjewelleryItems.metalTypeItem.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getMetalStampItems() {
    return addcustomjewelleryItems.metalStampItem.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getSelectRingSizeItems() {
    return addcustomjewelleryItems.selectRingSizeItem.entries.map((entry) {
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

  void metalTypeValueChange(String? newValue) {
    metalType.value = newValue!;
    print(
      'Selected value: ${addcustomjewelleryItems.metalTypeItem[newValue]}',
    );
  }

  void metalStampValueChange(String? newValue) {
    metalStamp.value = newValue!;
    print(
      'Selected value: ${addcustomjewelleryItems.metalStampItem[newValue]}',
    );
  }

  void selectRingSizeValueChange(String? newValue) {
    ringSize.value = newValue!;
    print(
      'Selected value: ${addcustomjewelleryItems.selectRingSizeItem[newValue]}',
    );
  }

  //Upload Your File
  var selectedImageType = true.obs;
  var selectedVideoType = false.obs;
  var selectedURLType = false.obs;
  var selectedFileName = ''.obs;
  var selectedFilePath = ''.obs;

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

  /// Open platform file picker for images and store file name/path
  Future<void> pickImageFile() async {
    try {
      final picker = ImagePicker();
      final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        final name = picked.name.isNotEmpty ? picked.name : picked.path.split('/').last;
        selectedFileName.value = name;
        selectedFilePath.value = picked.path;
      }
    } catch (e) {
      print('pickImageFile error: $e');
    }
  }

  /// Open platform file picker for videos and store file name/path
  Future<void> pickVideoFile() async {
    try {
      final picker = ImagePicker();
      final XFile? picked = await picker.pickVideo(source: ImageSource.gallery);
      if (picked != null) {
        final name = picked.name.isNotEmpty ? picked.name : picked.path.split('/').last;
        selectedFileName.value = name;
        selectedFilePath.value = picked.path;
      }
    } catch (e) {
      print('pickVideoFile error: $e');
    }
  }
}
