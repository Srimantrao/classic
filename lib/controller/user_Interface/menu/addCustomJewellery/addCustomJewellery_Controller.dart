// ignore_for_file: file_names, avoid_print, strict_top_level_inference

import 'package:classic/modal/menu/addCustomJewellery/addCustomJewellery.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class AddcustomjewelleryUIController extends GetxController {
  final yourCommentsController = TextEditingController();
  final addURlTextController = TextEditingController();
  final appxMetalWeightController = TextEditingController();
  final budgetController = TextEditingController();
  final engravingController = TextEditingController();
  final piecessController = TextEditingController();
  final weightController = TextEditingController();

  //Contact Information
  final fristNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final referredController = TextEditingController();

  //Dorop Down
  final addcustomjewelleryItems = AddcustomjewelleryItems();

  var productType = ''.obs;
  var metalType = ''.obs;
  var metalStamp = ''.obs;
  var ringSize = ''.obs;
  var shape = ''.obs;
  var color = ''.obs;
  var clarity = ''.obs;
  var size = ''.obs;

  var allSelectdata = [];

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

  List<DropdownMenuItem<String>> getShape() {
    return addcustomjewelleryItems.shape.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getColor() {
    return addcustomjewelleryItems.color.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getClarity() {
    return addcustomjewelleryItems.clarity.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getSize() {
    return addcustomjewelleryItems.size.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  String getShapeKeyFromDisplayText(String displayText) {
    return addcustomjewelleryItems.shape.entries
        .firstWhere(
          (entry) => entry.value == displayText,
          orElse: () => MapEntry('', ''),
        )
        .key;
  }

  String getColorKeyFromDisplayText(String displayText) {
    return addcustomjewelleryItems.color.entries
        .firstWhere(
          (entry) => entry.value == displayText,
          orElse: () => MapEntry('', ''),
        )
        .key;
  }

  String getClarityKeyFromDisplayText(String displayText) {
    return addcustomjewelleryItems.clarity.entries
        .firstWhere(
          (entry) => entry.value == displayText,
          orElse: () => MapEntry('', ''),
        )
        .key;
  }

  String getSizeKeyFromDisplayText(String displayText) {
    return addcustomjewelleryItems.size.entries
        .firstWhere(
          (entry) => entry.value == displayText,
          orElse: () => MapEntry('', ''),
        )
        .key;
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
    print('Selected value: ${addcustomjewelleryItems.metalTypeItem[newValue]}');
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

  void selectShapeDrop(String? newValue) {
    shape.value = newValue!;
    print('Selected value: ${addcustomjewelleryItems.shape[newValue]}');
    update();
  }

  void selectColorDrop(String? newValue) {
    color.value = newValue!;
    print('Selected value: ${addcustomjewelleryItems.color[newValue]}');
    update();
  }

  void selectClarityDrop(String? newValue) {
    clarity.value = newValue!;
    print('Selected value: ${addcustomjewelleryItems.clarity[newValue]}');
    update();
  }

  void selectSizeDrop(String? newValue) {
    size.value = newValue!;
    print('Selected value: ${addcustomjewelleryItems.size[newValue]}');
    update();
  }

  int? editingIndex;
  Future<void> updateingValue(index) async {
    editingIndex = index;
    final data = allSelectdata[index];
    print('Editing data: $data');

    isGemValue.value = data['gemType'];

    // Convert display text to keys
    final shapeKey = getShapeKeyFromDisplayText(data['shape']);
    final colorKey = getColorKeyFromDisplayText(data['color']);
    final clarityKey = getClarityKeyFromDisplayText(data['clarity']);
    final sizeKey = getSizeKeyFromDisplayText(data['size']);

    shape.value = shapeKey;
    color.value = colorKey;
    clarity.value = clarityKey;
    size.value = sizeKey;

    piecessController.text = data['pieces'];
    weightController.text = data['weight'];

    update();
  }

  Future<void> selectAllData() async {
    // allSelectdata.clear();
    final stoneData = {
      'gemType': isGemValue.value,
      'shape': addcustomjewelleryItems.shape[shape.value],
      'color': addcustomjewelleryItems.color[color.value],
      'clarity': addcustomjewelleryItems.clarity[clarity.value],
      'size': addcustomjewelleryItems.size[size.value],
      'pieces': piecessController.text,
      'weight': weightController.text,
    };

    // UPDATE EXISTING
    if (editingIndex != null) {
      allSelectdata[editingIndex!] = stoneData;
      editingIndex = null; // reset editing mode
    }
    // ADD NEW
    else {
      allSelectdata.add(stoneData);
    }

    update();
  }

  void removeStone(int index) {
    if (index >= 0 && index < allSelectdata.length) {
      allSelectdata.removeAt(index);
      update();
    }
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
        final name = picked.name.isNotEmpty
            ? picked.name
            : picked.path.split('/').last;
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
        final name = picked.name.isNotEmpty
            ? picked.name
            : picked.path.split('/').last;
        selectedFileName.value = name;
        selectedFilePath.value = picked.path;
      }
    } catch (e) {
      print('pickVideoFile error: $e');
    }
  }

  //Chekk Box
  var isCenterStone = false.obs;
  var isSideStone = false.obs;
  var isColor = false.obs;
  var isGemValue = false.obs;

  void toggleCenterStone(bool? value) {
    isCenterStone.value = value ?? false;
  }

  void toggleSideStone(bool? value) {
    isSideStone.value = value ?? false;
  }

  void toggleIsColor(bool? value) {
    isColor.value = value ?? false;
  }

  void toggleIsGam(bool? value) {
    isGemValue.value = value ?? false;
    update();
  }

  //Center Stone
  List<int> selectedShapes = [];
  List<int> selectWhiteColor = [];
  List<int> selectedClarity = [];

  //Multiple selection Shape
  void toggleShapeSelection(int index) {
    if (selectedShapes.contains(index)) {
      selectedShapes.remove(index);
    } else {
      selectedShapes.add(index);
    }
    update();
  }

  //Multiple selection Shape
  void toggleColorSelection(int index) {
    if (selectWhiteColor.contains(index)) {
      selectWhiteColor.remove(index);
    } else {
      selectWhiteColor.add(index);
    }
    update();
  }

  //Multiple selection clarity
  void toggleClaritySelection(int index) {
    if (selectedClarity.contains(index)) {
      selectedClarity.remove(index);
    } else {
      selectedClarity.add(index);
    }
    update();
  }

  // For single selection (if you prefer) Clarity
  void selectClarity(int index) {
    selectedClarity.clear();
    selectedClarity.add(index);
    update();
  }

  // For single selection (if you prefer) Shape
  void selectShape(int index) {
    selectedShapes.clear();
    selectedShapes.add(index);
    update();
  }

  void selectColor(int index) {
    selectWhiteColor.clear();
    selectWhiteColor.add(index);
    update();
  }

  void clearSelections() {
    selectedShapes.clear();
    selectWhiteColor.clear();
    update();
  }
}
