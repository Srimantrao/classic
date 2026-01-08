// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/screen/menu/jewelry/jewelryScreen/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../application_Programing_interface/apiController/menu/jewellery/productList_Controller.dart';

class FilterUIController extends GetxController {
  RxString selectedMetalType = ''.obs;
  RxString selectedMetalStamp = ''.obs;
  RxString selectedShapes = ''.obs;
  RxString selectedStoneTypes = ''.obs;
  RxString priceSort = '1'.obs;

  /// UI state
  var lowToHigh = true.obs;
  var highToLow = false.obs;

  selectMetalType(String value) => selectedMetalType.value = value;
  selectMetalStamp(String value) => selectedMetalStamp.value = value;
  selectShapes(String value) => selectedShapes.value = value;
  selectStoneTypes(String value) => selectedStoneTypes.value = value;

  //Reset
  void reset(categoryId,categoryName) {
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
      metalType: '',
      metalStamp: '',
      shape: '',
      settingType: '',
      priceShort: '',
    );
    final product = Product(
      categoryId: categoryId,
      categoryName: categoryName,
      metalType: '',
      metalStamp: '',
      shape: '',
      settingType: '',
      priceShort: '',
    );
    Get.back(result: product);
    debugPrint('categoryID :- $categoryId');
    debugPrint('categoryName :- $categoryName');
    debugPrint('metalType :- ${selectedMetalType.value}');
    debugPrint('metalStamp :- ${selectedMetalStamp.value}');
    debugPrint('shape :- ${selectedShapes.value}');
    debugPrint('settingType :- ${selectedStoneTypes.value}');
    debugPrint('priceShort :- ${priceSort.value}');
  }

  // Sort By
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

  void savePerametter(categoryId, categoryName) {
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
    debugPrint('categoryID :- $categoryId');
    debugPrint('categoryName :- $categoryName');
    debugPrint('metalType :- ${selectedMetalType.value}');
    debugPrint('metalStamp :- ${selectedMetalStamp.value}');
    debugPrint('shape :- ${selectedShapes.value}');
    debugPrint('settingType :- ${selectedStoneTypes.value}');
    debugPrint('priceShort :- ${priceSort.value}');
  }
}


