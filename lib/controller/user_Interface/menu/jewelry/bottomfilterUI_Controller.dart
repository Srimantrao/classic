import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/catagory/category_Controller.dart';
import 'package:get/get.dart';

class BottomFilterUiController extends GetxController {
  final categoryAPI = Get.put(CategoryController());

  var styleTab = false.obs;
  var stampsTab = false.obs;
  var metalTab = true.obs;
  var collectinTab = false.obs;
  var priceTab = false.obs;
  var tagTab = false.obs;

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
}
