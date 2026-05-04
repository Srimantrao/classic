// ignore_for_file: non_constant_identifier_names, file_names, strict_top_level_inference, avoid_print

import 'package:classic/view/screen/menu/jewelry/jewelryScreen/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../application_Programing_interface/apiController/menu/jewellery/productList/filter/filter_Controller.dart';
import '../../../application_Programing_interface/apiController/menu/jewellery/productList/filter/getAllParameter_Controller.dart';
import '../../../application_Programing_interface/apiController/menu/jewellery/productList/productList_Controller.dart';

class FilterUIController extends GetxController {
  // API controllers
  final filterAPI = Get.put(FilterController());
  final getAllPeraMeter = Get.put(GetallparameterController());
  final productListAPI = Get.put(ProductlistController(), permanent: true);

  // Selected filters
  RxString selectedMetalType = ''.obs;
  RxString selectedMetalStamp = ''.obs;
  RxString selectedShapes = ''.obs;
  RxString selectedStoneTypes = ''.obs;
  RxString priceSort = '1'.obs;

  // UI state
  var lowToHigh = true.obs;
  var highToLow = false.obs;

  // Combined metal list
  RxList<Map<String, dynamic>> combinedMetal = <Map<String, dynamic>>[].obs;

  // Select methods
  void selectMetalType(String value) => selectedMetalType.value = value;

  void selectMetalStamp(String value) => selectedMetalStamp.value = value;

  void selectShapes(String value) => selectedShapes.value = value;

  void selectStoneTypes(String value) => selectedStoneTypes.value = value;

  // Compute combinedMetal from API data
  void computeCombinedMetal(Map<String, dynamic> filterData) {
    final metalStampsList = (filterData['metalStamp'] as List? ?? [])
        .cast<Map<String, dynamic>>();
    final metalTypesList = (filterData['metalType'] as List? ?? [])
        .cast<Map<String, dynamic>>();

    final List<Map<String, dynamic>> temp = [];
    for (final stamp in metalStampsList) {
      for (final metal in metalTypesList) {
        final stampName = stamp['paraMtrName'] ?? '';
        final metalName = metal['metal'] ?? '';
        temp.add({
          'metalStampId': stamp['_id'] ?? '',
          'metalTypeId': metal['_id'] ?? '',
          'combinedMetalName': [
            stampName,
            metalName,
          ].where((e) => e.isNotEmpty).join(' '),
          'stampSlug': stamp['slug'] ?? '',
          'param': stampName,
        });
      }
    }
    combinedMetal.value = temp;
  }

  void selectMetalCombination({
    required String metalStampId,
    required String metalTypeId,
  }) {
    selectedMetalStamp.value = metalStampId;
    selectedMetalType.value = metalTypeId;
    debugPrint(
      'Selected Combination => MetalStamp: $metalStampId, MetalType: $metalTypeId',
    );
  }

  // Reset all filters
  void reset(String categoryId, String categoryName) {
    selectedMetalType.value = '';
    selectedMetalStamp.value = '';
    selectedShapes.value = '';
    selectedStoneTypes.value = '';
    lowToHigh.value = true;
    highToLow.value = false;
    priceSort.value = '1';

    final productListAPI = Get.put(ProductlistController(), permanent: true);
    productListAPI.fetchFirstPage(
      categoryId: categoryId,
      metalType: selectedMetalType.value,
      metalStamp: selectedMetalStamp.value,
      shape: selectedShapes.value,
      settingType: '',
      priceShort: priceSort.value,
    );

    final product = Product(
      categoryId: categoryId,
      categoryName: categoryName,
      metalType: selectedMetalType.value,
      metalStamp: selectedMetalStamp.value,
      shape: selectedShapes.value,
      settingType: '',
      priceShort: priceSort.value,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.back(result: product);
    });

    debugPrint('Reset filters');
    print("category :- $categoryId");
    print("categoryName :- $categoryName");
    print("metalType :- ${selectedMetalType.value}");
    print("metalStamp :- ${selectedMetalStamp.value}");
    print("shape :- ${selectedShapes.value}");
    print("settingType :- ${selectedStoneTypes.value}");
    print("priceShort :- ${priceSort.value}");
  }

  // Sorting
  void sortLowToHigh() {
    lowToHigh.value = true;
    highToLow.value = false;
    priceSort.value = '1';
  }

  void sortHighToLow() {
    lowToHigh.value = false;
    highToLow.value = true;
    priceSort.value = '-1';
  }

  //Bottom Filters
  var lowTohigh_val = false.obs;
  var highTolow_val = false.obs;

  void lowTohigh_valfun(categoryId) {
    lowTohigh_val.value = true;
    if (lowTohigh_val.value == true) {
      productListAPI.fetchFirstPage(
        categoryId: categoryId,
        priceShort: '1',
        metalType: selectedMetalType.value,
        metalStamp: selectedMetalStamp.value,
        shape: selectedShapes.value,
        settingType: selectedStoneTypes.value,
      );
    }
    highTolow_val.value = false;
  }

  void highTolow_valfun(categoryId) {
    highTolow_val.value = true;
    if (highTolow_val.value == true) {
      productListAPI.fetchFirstPage(
        categoryId: categoryId,
        priceShort: '-1',
        metalType: selectedMetalType.value,
        metalStamp: selectedMetalStamp.value,
        shape: selectedShapes.value,
        settingType: selectedStoneTypes.value,
      );
    }
    lowTohigh_val.value = false;
  }

  // Save filters and fetch API
  void savePerametter(String categoryId, String categoryName) {
    final productListAPI = Get.put(ProductlistController(), permanent: true);
    productListAPI.fetchFirstPage(
      categoryId: categoryId,
      metalType: selectedMetalType.value,
      metalStamp: selectedMetalStamp.value,
      shape: selectedShapes.value,
      settingType: selectedStoneTypes.value,
      priceShort: priceSort.value,
    );

    final product = Product(
      categoryId: categoryId,
      categoryName: categoryName,
      metalType: selectedMetalType.value,
      metalStamp: selectedMetalStamp.value,
      shape: selectedShapes.value,
      settingType: selectedStoneTypes.value,
      priceShort: priceSort.value,
    );

    Get.back(result: product);
    debugPrint('Saved filters');
    print("category :- $categoryId");
    print("categoryName :- $categoryName");
    print("metalType :- ${selectedMetalType.value}");
    print("metalStamp :- ${selectedMetalStamp.value}");
    print("shape :- ${selectedShapes.value}");
    print("settingType :- ${selectedStoneTypes.value}");
    print("priceShort :- ${priceSort.value}");
  }
}
