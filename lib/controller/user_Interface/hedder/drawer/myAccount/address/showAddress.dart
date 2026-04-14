// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:get/get.dart';

class ShowaddressUIController extends GetxController {
  var selectedDefaultAddressIndex = (-1).obs;

  void selectDefaultAddress(int index) {
    selectedDefaultAddressIndex.value = index;
  }
}
