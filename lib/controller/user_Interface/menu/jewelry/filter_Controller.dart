// ignore_for_file: file_names

import 'package:get/get.dart';

class FilterUIController extends GetxController {
  //Metal Type
  var whiteGold = false.obs;
  var roseGold = false.obs;
  var yellowGold = false.obs;
  var roseWhiteGold = false.obs;
  var yellowWhiteGold = false.obs;
  var whiteRoseGold = false.obs;

  //Metal Stamp
  var selectedIndex = (-1).obs;

  //Shape
  var selectedShape = (-1).obs;

  //Stone Type
  var selectedStoneType = (-1).obs;

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

  //Metal Type
  void selectStamp(int index) {
    selectedIndex.value = index;
  }

  //Stone Type
  void selectStoneType(int index) {
    selectedStoneType.value = index;
    update();
  }

  //Shape
  void selectShape(int index) {
    selectedShape.value = index;
    update();
  }

  //Metal Type
  //White Gold
  void selectWhiteGold() {
    whiteGold.value = true;
    roseGold.value = false;
    yellowGold.value = false;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = false;
  }

  //Rose Gold
  void selectRoseGold() {
    whiteGold.value = false;
    roseGold.value = true;
    yellowGold.value = false;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = false;
  }

  //Yellow Gold
  void selectYellowGold() {
    whiteGold.value = false;
    roseGold.value = false;
    yellowGold.value = true;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = false;
  }

  //Rose White Gold
  void selectRoseWhiteGold() {
    whiteGold.value = false;
    roseGold.value = false;
    yellowGold.value = false;
    roseWhiteGold.value = true;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = false;
  }

  //Yellow White Gold
  void selectYellowWhiteGold() {
    whiteGold.value = false;
    roseGold.value = false;
    yellowGold.value = false;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = true;
    whiteRoseGold.value = false;
  }

  //White Rose Gold
  void selectWhiteRoseGold() {
    whiteGold.value = false;
    roseGold.value = false;
    yellowGold.value = false;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = true;
  }

  //Reset
  void reset() {
    whiteGold.value = false;
    roseGold.value = false;
    yellowGold.value = false;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = false;
  }
}
