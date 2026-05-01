// ignore_for_file: avoid_print, strict_top_level_inference, unused_local_variable

import 'package:get/get.dart';
import '../../../application_Programing_interface/apiController/menu/jewellery/productList/productList_Controller.dart';

class BottomFilterUiController extends GetxController {
  final ProductlistController productListAPI =
      Get.find<ProductlistController>();

  var styleTab = false.obs;
  var stampsTab = false.obs;
  var metalTab = true.obs;
  var collectinTab = false.obs;
  var priceTab = false.obs;
  var tagTab = false.obs;

  RxInt selectedCategoryIndex = 0.obs;

  void styleOnTab() {
    styleTab.value = true;
    stampsTab.value = false;
    metalTab.value = false;
    collectinTab.value = false;
    priceTab.value = false;
    tagTab.value = false;
  }

  void stampsOnTab() {
    styleTab.value = false;
    stampsTab.value = true;
    metalTab.value = false;
    collectinTab.value = false;
    priceTab.value = false;
    tagTab.value = false;
  }

  void metalOnTab() {
    styleTab.value = false;
    stampsTab.value = false;
    metalTab.value = true;
    collectinTab.value = false;
    priceTab.value = false;
    tagTab.value = false;
  }

  void collectinOnTab() {
    styleTab.value = false;
    stampsTab.value = false;
    metalTab.value = false;
    collectinTab.value = true;
    priceTab.value = false;
    tagTab.value = false;
  }

  void priceOnTab() {
    styleTab.value = false;
    stampsTab.value = false;
    metalTab.value = false;
    collectinTab.value = false;
    priceTab.value = true;
    tagTab.value = false;
  }

  void tagOnTab() {
    styleTab.value = false;
    stampsTab.value = false;
    metalTab.value = false;
    collectinTab.value = false;
    priceTab.value = false;
    tagTab.value = true;
  }

  //bottom filter
  var selectedSubCategoryId = ''.obs;
  var selectedStampIds = ''.obs;
  var selectedMetalIds = ''.obs;
  var priceRange = ''.obs;
  var selectedCollectionIds = ''.obs;
  var selectedTagId = ''.obs;

  //_id
  var styleID = ''.obs;
  var stampID = ''.obs;
  var metalID = ''.obs;
  var collectionID = ''.obs;
  var priceID = ''.obs;
  var tagID = ''.obs;

  void applyFilter(categoryId) {
    productListAPI.fetchFirstPage(
      categoryId: categoryId,
      subCategoryId: styleID.value.isNotEmpty ? styleID.value : null,
      metalType: metalID.value.isNotEmpty ? metalID.value : null,
      metalStamp: stampID.value.isNotEmpty ? stampID.value : null,
      shape: collectionID.value.isNotEmpty ? collectionID.value : null,
      settingType: tagID.value.isNotEmpty ? tagID.value : null,
      minPrice: priceID.value.isNotEmpty ? priceID.value : null,
      priceShort: '1',
    );
    Get.back();

    print('Selected Style ID: ${styleID.value}');
    print('Selected Stamp ID: ${stampID.value}');
    print('Selected Metal ID: ${metalID.value}');
    print('Selected Collection ID: ${collectionID.value}');
    print('Selected Price Range ID: ${priceID.value}');
    print('Selected Tag ID: ${tagID.value}');
  }

  void reset(categoryId) {
    productListAPI.fetchFirstPage(
      categoryId: categoryId,
      subCategoryId: '',
      metalType: '',
      metalStamp: '',
      shape: '',
      settingType: '',
      minPrice: '',
      priceShort: '1',
    );
    Get.back();

    styleID.value = '';
    stampID.value = '';
    metalID.value = '';
    collectionID.value = '';
    priceID.value = '';
    tagID.value = '';

    selectedSubCategoryId.value = '';
    selectedStampIds.value = '';
    selectedMetalIds.value = '';
    selectedCollectionIds.value = '';
    priceRange.value = '';
    selectedTagId.value = '';
    selectedCategoryIndex.value = 0;
    styleTab.value = false;
    stampsTab.value = false;
    metalTab.value = true;
    collectinTab.value = false;
    priceTab.value = false;
    tagTab.value = false;

    print('Selected Style ID: ${styleID.value}');
    print('Selected Stamp ID: ${stampID.value}');
    print('Selected Metal ID: ${metalID.value}');
    print('Selected Collection ID: ${collectionID.value}');
    print('Selected Price Range ID: ${priceID.value}');
    print('Selected Tag ID: ${tagID.value}');
  }
}
