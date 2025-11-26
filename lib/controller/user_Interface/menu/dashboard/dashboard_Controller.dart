// ignore_for_file: file_names

import 'package:get/get.dart';

class DashboardUIController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedTab = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  void selectText(int index) {
    selectedTab.value = index;
  }

  bool get recentViwe => selectedTab.value == 0;
  bool get myCart => selectedTab.value == 1;

  bool get isSelectDiamond => selectedIndex.value == 0;
  bool get isSelectJewellwery => selectedIndex.value == 1;
}