// ignore_for_file: file_names

import 'package:get/get.dart';

class WishlistUIController extends GetxController{
  var selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  bool get isSelectDiamond => selectedIndex.value == 0;
  bool get isSelectJewellwery => selectedIndex.value == 1;
}