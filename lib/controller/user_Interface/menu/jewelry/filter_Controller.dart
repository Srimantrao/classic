// ignore_for_file: file_names, strict_top_level_inference

import 'package:get/get.dart';

class FilterUIController extends GetxController {

  RxString selectedMetalType = ''.obs;
  RxString selectedMetalStamp = ''.obs;
  RxString selectedShapes = ''.obs;
  RxString selectedStoneTypes = ''.obs;

  selectMetalType(String value) => selectedMetalType.value = value;
  selectMetalStamp(String value) => selectedMetalStamp.value = value;
  selectShapes(String value) => selectedShapes.value = value;
  selectStoneTypes(String value) => selectedStoneTypes.value = value;

  //Reset
  void reset() {
    selectedMetalType.value = '';
    selectedMetalStamp.value = '';
    selectedShapes.value = '';
    selectedStoneTypes.value = '';
  }

  //Sort By
  var lowToHigh = false.obs;
  var highToLow = false.obs;

  void sortLowToHigh() {
    lowToHigh.value = true;
    highToLow.value = false;
    update();
  }

  void sortHighToLow() {
    lowToHigh.value = false;
    highToLow.value = true;
    update();
  }
}
