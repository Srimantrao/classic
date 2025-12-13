// ignore_for_file: file_names

import 'package:get/get.dart';

class FilterUIController extends GetxController {
  var whiteGold = false.obs;
  var roseGold = false.obs;
  var yellowGold = false.obs;
  var roseWhiteGold = false.obs;
  var yellowWhiteGold = false.obs;
  var whiteRoseGold = false.obs;

  var selectedIndex = (-1).obs;

  void selectStamp(int index) {
    selectedIndex.value = index;
  }

  void selectWhiteGold() {
    whiteGold.value = true;
    roseGold.value = false;
    yellowGold.value = false;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = false;
  }

  void selectRoseGold() {
    whiteGold.value = false;
    roseGold.value = true;
    yellowGold.value = false;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = false;
  }

  void selectYellowGold() {
    whiteGold.value = false;
    roseGold.value = false;
    yellowGold.value = true;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = false;
  }

  void selectRoseWhiteGold() {
    whiteGold.value = false;
    roseGold.value = false;
    yellowGold.value = false;
    roseWhiteGold.value = true;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = false;
  }

  void selectYellowWhiteGold() {
    whiteGold.value = false;
    roseGold.value = false;
    yellowGold.value = false;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = true;
    whiteRoseGold.value = false;
  }

  void selectWhiteRoseGold() {
    whiteGold.value = false;
    roseGold.value = false;
    yellowGold.value = false;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = true;
  }

  void reset() {
    whiteGold.value = false;
    roseGold.value = false;
    yellowGold.value = false;
    roseWhiteGold.value = false;
    yellowWhiteGold.value = false;
    whiteRoseGold.value = false;
  }
}
