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
  var shapeName = ''.obs;
  var color = ''.obs;
  var clarity = ''.obs;
  var size = ''.obs;

  var allSelectdata = [];

  //Side Stone BottemValue
  var shapValue = false.obs;
  var colorValue = false.obs;
  var clarityValue = false.obs;
  var sizeValue = false.obs;
  var isGemValue = false.obs;

  var shapValueID = ''.obs;
  var colorVlaueID = ''.obs;
  var clarityValueID = ''.obs;
  var sizeValueID = ''.obs;

  List clariyNewValue = [];
  List colorNewValue = [];
  List newSIZEValue = [];

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
    final List data = colorNewValue;
    final Set<String> seenValues = {};
    final items = <DropdownMenuItem<String>>[];
    
    // Add current color to seen if not empty to prevent crash
    if (color.value.isNotEmpty) {
      seenValues.add(color.value);
      items.add(
        DropdownMenuItem<String>(
          value: color.value,
          child: Text(color.value, style: TextStyle(color: AppColor.black)),
        ),
      );
    }

    for (int i = 0; i < data.length; i++) {
      final String value = data[i]?.toString() ?? '';
      if (value.isEmpty || seenValues.contains(value)) continue;
      seenValues.add(value);
      items.add(
        DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: AppColor.black)),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> getClarity() {
    final List data = clariyNewValue;
    final Set<String> seenValues = {};
    final items = <DropdownMenuItem<String>>[];

    if (clarity.value.isNotEmpty) {
      seenValues.add(clarity.value);
      items.add(
        DropdownMenuItem<String>(
          value: clarity.value,
          child: Text(clarity.value, style: TextStyle(color: AppColor.black)),
        ),
      );
    }

    for (int i = 0; i < data.length; i++) {
      final String value = data[i]?.toString() ?? '';
      if (value.isEmpty || seenValues.contains(value)) continue;
      seenValues.add(value);
      items.add(
        DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: AppColor.black),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> getSize() {
    final List data = newSIZEValue;
    final Set<String> seenValues = {};
    final items = <DropdownMenuItem<String>>[];

    if (size.value.isNotEmpty) {
      seenValues.add(size.value);
      items.add(
        DropdownMenuItem<String>(
          value: size.value,
          child: Text(size.value, style: TextStyle(color: AppColor.black)),
        ),
      );
    }

    for (int i = 0; i < data.length; i++) {
      final String value = data[i]?.toString() ?? '';
      if (value.isEmpty || seenValues.contains(value)) continue;
      seenValues.add(value);
      items.add(
        DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: AppColor.black),
          ),
        ),
      );
    }
    return items;
  }

  String getShapeKeyFromDisplayText(String displayText) {
    // Try to find in hardcoded list first
    final key = addcustomjewelleryItems.shape.entries
        .firstWhere(
          (entry) => entry.value == displayText,
          orElse: () => MapEntry('', ''),
        )
        .key;
    if (key.isNotEmpty) return key;

    // Try to find in API data
    final List<dynamic> shapeList =
        getAllPeraMeter.getAllParameterData['shape'] ?? [];
    for (var item in shapeList) {
      if (item["paraMtrName"]?.toString() == displayText) {
        return item["paraMtrId"]?.toString() ?? '';
      }
    }
    return '';
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

  Future<void> selectShapeDrop(String? newValue) async {
    if (newValue == null) return;
    shape.value = newValue;
    color.value = '';
    clarity.value = '';
    size.value = '';
    colorValue.value = false;
    clarityValue.value = false;
    sizeValue.value = false;
    
    final List<dynamic> shapeList =
        getAllPeraMeter.getAllParameterData['shape'] ?? [];
    final selectedItem = shapeList.firstWhere(
      (item) => item["paraMtrId"]?.toString() == newValue,
      orElse: () => null,
    );
    if (selectedItem != null) {
      print('Selected paraMtrId: ${selectedItem["paraMtrId"]}');
      print('Selected paraMtrName: ${selectedItem["paraMtrName"]}');
      shapeName.value = selectedItem["paraMtrName"]?.toString() ?? '';
    }
    shapValue.value = true;
    shapValueID.value = newValue;
    
    update(); // Update immediately to show selected shape
    
    await stoneGroupList.getAllStoneGroupListSelect(
      shape: shapValueID.value,
      isGem: isGemValue.value,
    );
    colorNewValue = stoneGroupList.getAllStoneGroupList['data'] ?? [];
    stoneGroupList.update();
    update();
  }

  Future<void> selectColorDrop(String? newValue) async {
    if (newValue == null || newValue.isEmpty) return;
    color.value = newValue;
    clarity.value = '';
    size.value = '';
    clarityValue.value = false;
    sizeValue.value = false;
    
    colorValue.value = true;
    colorVlaueID.value = newValue;
    
    update(); // Update immediately to show selected color
    
    await stoneGroupList.getAllStoneGroupListSelect(
      shape: shapValueID.value,
      color: colorVlaueID.value,
      isGem: isGemValue.value,
    );
    final List newClarity = stoneGroupList.getAllStoneGroupList['data'] ?? [];
    clariyNewValue = newClarity;
    print("Updated clariyNewValue: $clariyNewValue");
    stoneGroupList.update();
    update();
  }

  Future<void>  selectClarityDrop(String? newValue) async{
    if (newValue == null || newValue.isEmpty) return;
    clarity.value = newValue;
    clarityValue.value = true;
    size.value = '';
    sizeValue.value = false;
    
    clarityValueID.value = newValue;

    update();

    await stoneGroupList.getAllStoneGroupListSelect(
      shape: shapValueID.value,
      color: colorVlaueID.value,
      clarity: clarityValueID.value,
      isGem: isGemValue.value,
    );
    final List newSIZE = stoneGroupList.getAllStoneGroupList['data'] ?? [];
    newSIZEValue = newSIZE;
    print('Selected newSIZE: $newSIZEValue');
    stoneGroupList.update();
    update();
  }

  void selectSizeDrop(String? newValue) {
    if (newValue == null || newValue.isEmpty) return;
    size.value = newValue;
    sizeValue.value = true;
    sizeValueID.value = newValue;
    print('Selected size ID: $newValue');
    update();
  }

  int? editingIndex;

  Future<void> updateingValue(index) async {
    editingIndex = index;
    final data = allSelectdata[index];
    print('Editing data: $data');

    // Synchronously update initial state so UI can show it immediately
    isGemValue.value = data['gemType'] ?? false;
    shapeName.value = data['shape'] ?? '';

    // Priority: data['shapeId'] (if saved) > getShapeKeyFromDisplayText
    final shapeKey = data['shapeId'] ?? getShapeKeyFromDisplayText(data['shape'] ?? '');
    
    shape.value = shapeKey;
    shapValueID.value = shapeKey;
    shapValue.value = shapeKey.isNotEmpty;

    // Reset and set IDs for color/clarity/size if they are stored as names
    colorVlaueID.value = data['color'] ?? '';
    clarityValueID.value = data['clarity'] ?? '';
    sizeValueID.value = data['size'] ?? '';

    // Notify UI immediately to show Is Gem and Shape correctly in the BottomSheet
    update();

    // Fetch colors for this shape
    if (shapValueID.value.isNotEmpty) {
      await stoneGroupList.getAllStoneGroupListSelect(
        shape: shapValueID.value,
        isGem: isGemValue.value,
      );
      colorNewValue = stoneGroupList.getAllStoneGroupList['data'] ?? [];
    }
    
    color.value = data['color'] ?? ''; 
    colorValue.value = color.value.isNotEmpty;
    update();

    // Fetch clarities for this shape and color
    if (shapValueID.value.isNotEmpty && colorVlaueID.value.isNotEmpty) {
      await stoneGroupList.getAllStoneGroupListSelect(
        shape: shapValueID.value,
        color: colorVlaueID.value,
        isGem: isGemValue.value,
      );
      clariyNewValue = stoneGroupList.getAllStoneGroupList['data'] ?? [];
    }

    clarity.value = data['clarity'] ?? '';
    clarityValue.value = clarity.value.isNotEmpty;
    update();

    // Fetch sizes for this shape, color and clarity
    if (shapValueID.value.isNotEmpty && colorVlaueID.value.isNotEmpty && clarityValueID.value.isNotEmpty) {
      await stoneGroupList.getAllStoneGroupListSelect(
        shape: shapValueID.value,
        color: colorVlaueID.value,
        clarity: clarityValueID.value,
        isGem: isGemValue.value,
      );
      newSIZEValue = stoneGroupList.getAllStoneGroupList['data'] ?? [];
    }

    size.value = data['size'] ?? '';
    sizeValue.value = size.value.isNotEmpty;

    piecessController.text = data['pieces']?.toString() ?? '';
    weightController.text = data['weight']?.toString() ?? '';

    update();
  }

  void resetStoneForm() {
    shape.value = '';
    shapeName.value = '';
    color.value = '';
    clarity.value = '';
    size.value = '';
    isGemValue.value = false;
    shapValue.value = false;
    colorValue.value = false;
    clarityValue.value = false;
    sizeValue.value = false;
    shapValueID.value = '';
    colorVlaueID.value = '';
    clarityValueID.value = '';
    sizeValueID.value = '';
    colorNewValue = [];
    clariyNewValue = [];
    newSIZEValue = [];
    piecessController.clear();
    weightController.clear();
    editingIndex = null;
    update();
  }

  Future<void> selectAllData() async {
    // allSelectdata.clear();
    final stoneData = {
      'gemType': isGemValue.value,
      'shapeId': shape.value,        // ✅ ID (optional but recommended)
      'shape': shapeName.value,      // ✅ Name show karne ke liye
      'color': color.value,
      'clarity': clarity.value,
      'size': size.value,
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
