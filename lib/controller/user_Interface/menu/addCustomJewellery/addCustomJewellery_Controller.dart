// ignore_for_file: file_names, avoid_print, strict_top_level_inference

import 'package:classic/modal/menu/addCustomJewellery/addCustomJewellery.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import '../../../application_Programing_interface/apiController/menu/addCustomJewellery/getAllStoneGroupList_Controller.dart';
import '../../../application_Programing_interface/apiController/menu/jewellery/productList/filter/getAllParameter_Controller.dart';
import '../../../application_Programing_interface/callApi/callAPI.dart';

class AddcustomjewelleryUIController extends GetxController {
  final jewellry = Get.put(JewelleryAPICall());
  final getAllPeraMeter = Get.put(GetallparameterController());
  final stoneGroupList = Get.put(GetAllStoneGroupListController());

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

  //Side Stone BottemValue
  var shapValue = false.obs;
  var colorValue = false.obs;
  var clarityValue = false.obs;
  var sizeValue = false.obs;

  var shapValueID = ''.obs;
  var colorVlaueID = ''.obs;
  var clarityValueID = ''.obs;
  var sizeValueID = ''.obs;

  List clariyNewValue = [];

  List<DropdownMenuItem<String>> getProductTypeItems() {
    final List<dynamic> categories =
        jewellry.categoryAPI.catagoryData['data'] ?? [];
    final List<DropdownMenuItem<String>> items = [];
    for (final dynamic category in categories) {
      if (category is Map<String, dynamic>) {
        final hasSubCategories =
            category['subCategory'] != null &&
            category['subCategory'] is List &&
            (category['subCategory'] as List).isNotEmpty;
        if (hasSubCategories) {
          final categoryId = category['_id']?.toString() ?? '';
          final categoryName = category['categoryName']?.toString() ?? '';
          items.add(
            DropdownMenuItem<String>(
              value: categoryId,
              child: Text(
                categoryName,
                style: TextStyle(color: AppColor.black),
              ),
            ),
          );
        }
      }
    }
    return items;
  }

  List<DropdownMenuItem<String>> getMetalTypeItems() {
    final List<dynamic> metalTypes =
        getAllPeraMeter.getAllParameterData['metalType'] ?? [];

    return metalTypes.whereType<Map<String, dynamic>>().map((metal) {
      return DropdownMenuItem<String>(
        value: (metal['paraMtrId'] ?? metal['_id'] ?? '').toString(),
        child: Text(
          metal['paraMtrName']?.toString() ?? '',
          style: TextStyle(color: AppColor.black),
        ),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getMetalStampItems() {
    final List<dynamic> metalTypes =
        getAllPeraMeter.getAllParameterData['metalStamp'] ?? [];
    return metalTypes.whereType<Map<String, dynamic>>().map((metal) {
      return DropdownMenuItem<String>(
        value: (metal['paraMtrId'] ?? metal['_id'] ?? '').toString(),
        child: Text(
          metal['paraMtrName']?.toString() ?? '',
          style: TextStyle(color: AppColor.black),
        ),
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
    final List<dynamic> shapeList =
        getAllPeraMeter.getAllParameterData['shape'] ?? [];
    return shapeList.map<DropdownMenuItem<String>>((item) {
      return DropdownMenuItem<String>(
        value: item["paraMtrId"]?.toString(),
        child: Text(
          item["paraMtrName"]?.toString() ?? '',
          style: TextStyle(color: AppColor.black),
        ),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getColor() {
    final List data = stoneGroupList.getAllStoneGroupList['data'] ?? [];

    return data.map<DropdownMenuItem<String>>((entry) {
      return DropdownMenuItem<String>(
        value: entry.toString(),
        child: Text(entry.toString(), style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getClarity() {
    final List data = stoneGroupList.getAllStoneGroupList['data'] ?? [];

    return data.map<DropdownMenuItem<String>>((entry) {
      return DropdownMenuItem<String>(
        value: entry.toString(),
        child: Text(
          entry.toString(),
          style: TextStyle(color: AppColor.black),
        ),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getSize() {
    final List<dynamic> metalTypes =
        getAllPeraMeter.getAllParameterData['ringSize'] ?? [];
    return metalTypes.whereType<Map<String, dynamic>>().map((metal) {
      return DropdownMenuItem<String>(
        value: (metal['paraMtrId'] ?? metal['_id'] ?? '').toString(),
        child: Text(
          metal['paraMtrName']?.toString() ?? '',
          style: TextStyle(color: AppColor.black),
        ),
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

  //onChange Value of Dropdown
  void productTypeValueChange(String? newValue) {
    if (newValue != null) {
      productType.value = newValue;
      final List<dynamic> categories =
          jewellry.categoryAPI.catagoryData['data'] ?? [];
      for (final dynamic category in categories) {
        if (category is Map<String, dynamic>) {
          final categoryId = category['_id']?.toString() ?? '';

          if (categoryId == newValue) {
            final categoryName = category['categoryName']?.toString() ?? '';
            print('Selected ID: $newValue');
            print('Selected Name: $categoryName');
            break;
          }
          if (category['subCategory'] != null &&
              category['subCategory'] is List) {
            final List subCategories = category['subCategory'];
            for (final dynamic subCategory in subCategories) {
              if (subCategory is Map<String, dynamic>) {
                final subCategoryId = subCategory['_id']?.toString() ?? '';
                if (subCategoryId == newValue) {
                  final subCategoryName =
                      subCategory['categoryName']?.toString() ?? '';
                  print('Selected Subcategory ID: $newValue');
                  print('Selected Subcategory Name: $subCategoryName');
                  break;
                }
              }
            }
          }
        }
      }
    }
  }

  void metalTypeValueChange(String? newValue) {
    if (newValue != null) {
      metalType.value = newValue;
      print('Selected paraMtrId: $newValue');
      final metalTypes = getAllPeraMeter.getAllParameterData['metalType'];
      for (final metal in metalTypes) {
        if (metal is Map<String, dynamic>) {
          final metalId =
              metal['paraMtrId']?.toString() ?? metal['_id']?.toString() ?? '';

          if (metalId == newValue) {
            final metalName = metal['paraMtrName']?.toString() ?? '';
            print('Selected paraMtrName: $metalName');
            print('Selected Metal Type: $metalName (ID: $newValue)');
            break;
          }
        }
      }
    }
  }

  void metalStampValueChange(String? newValue) {
    if (newValue != null) {
      metalStamp.value = newValue;
      print('Selected paraMtrId: $newValue');
      final metalStamps = getAllPeraMeter.getAllParameterData['metalStamp'];
      for (final metal in metalStamps) {
        if (metal is Map<String, dynamic>) {
          final metalId =
              metal['paraMtrId']?.toString() ?? metal['_id']?.toString() ?? '';
          if (metalId == newValue) {
            final metalStamps = metal['paraMtrName']?.toString() ?? '';
            print('Selected paraMtrName: $metalStamps');
            print('Selected metalStamp Type: $metalStamps (ID: $newValue)');
            break;
          }
        }
      }
    }
  }

  void selectRingSizeValueChange(String? newValue) {
    if (newValue == null) return;
    ringSize.value = newValue;
    print('Selected paraMtrId: $newValue');
    final List ringSizeList =
        getAllPeraMeter.getAllParameterData['ringSize'] ?? [];
    final selectedRing = ringSizeList.firstWhere(
      (element) =>
          (element['paraMtrId']?.toString() ?? element['_id']?.toString()) ==
          newValue,
      orElse: () => null,
    );
    if (selectedRing != null) {
      final selectedName = selectedRing['paraMtrName']?.toString() ?? '';
      print('Selected paraMtrName: $selectedName');
      print('Selected ringSize Type: $selectedName (ID: $newValue)');
    }
  }

  void selectShapeDrop(String? newValue) {
    if (newValue == null) return;
    shape.value = newValue;
    final List<dynamic> shapeList =
        getAllPeraMeter.getAllParameterData['shape'] ?? [];
    final selectedItem = shapeList.firstWhere(
      (item) => item["paraMtrId"]?.toString() == newValue,
      orElse: () => null,
    );
    if (selectedItem != null) {
      print('Selected paraMtrId: ${selectedItem["paraMtrId"]}');
      print('Selected paraMtrName: ${selectedItem["paraMtrName"]}');
    }
    shapValue.value = true;
    shapValueID.value = newValue!;
    stoneGroupList.getAllStoneGroupListSelect(shape: shapValueID.value);
    stoneGroupList.update();
    update();
  }

  void selectColorDrop(String? newValue) {
    if (newValue == null) return;
    color.value = newValue;
    final List data = stoneGroupList.getAllStoneGroupList['data'] ?? [];
    final selectedItem = data.firstWhere((item) => item.toString() == newValue,
      orElse: () => null,
    );
    colorValue.value = true;
    colorVlaueID.value = newValue;
    stoneGroupList.getAllStoneGroupListSelect(
      shape: shapValueID.value,
      color: colorVlaueID.value,
    );
    if (selectedItem != null) {
      print('Selected color: ${selectedItem}');
    }
    stoneGroupList.update();
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
    stoneGroupList.getAllStoneGroupListSelect(
      isGem: isGemValue.value = value ?? false,
    );
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

  @override
  void onClose() {
    yourCommentsController.dispose();
    addURlTextController.dispose();
    appxMetalWeightController.dispose();
    budgetController.dispose();
    engravingController.dispose();
    piecessController.dispose();
    weightController.dispose();
    fristNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    referredController.dispose();
    super.onClose();
  }
}
