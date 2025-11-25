
// ignore_for_file: file_names

import 'package:classic/view/screen/menu/home/homeScreen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottombarController extends GetxController{
  var selectindex = 0.obs;

  final List<Widget> pages = [
    Home(),
  ].obs;

  // void changePage(val) => selectindex.value = val;

  void indexOne() => selectindex.value = 0;
  void indexTwo() => selectindex.value = 1;
  void indexThree() => selectindex.value = 2;
  void indexFour() => selectindex.value = 3;
  void indexFive() => selectindex.value = 4;

  //Swich Screen
  Widget selectscreen(int index) {
    switch (index) {
      case 0: return Home();
      // case 1: return Categorys();
      // case 2: return Buynow();
      // case 3: return Overstore();
      // case 4: return Account();
      default: return Home();
    }
  }
}