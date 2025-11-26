
// ignore_for_file: file_names

import 'package:classic/view/screen/menu/dashbord/dashbordScreen/dashbord.dart';
import 'package:classic/view/screen/menu/home/homeScreen/home.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/jewelry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottombarController extends GetxController{
  var selectindex = 0.obs;

  final List<Widget> pages = [
    Home(),
    Jewelry(),
    Dashbord(),
  ].obs;

  void indexOne() => selectindex.value = 0;
  void indexTwo() => selectindex.value = 1;
  void indexThree() => selectindex.value = 2;
  void indexFour() => selectindex.value = 3;
  void indexFive() => selectindex.value = 4;

  // Update index only
  void changePage(int index) {
    selectindex.value = index;
  }

  // Switch screen using index
  Widget selectscreen(int index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Jewelry();
      case 2:
        return Dashbord();
      case 3:
      //   return Overstore();
      // case 4:
      //   return Account();
      default:
        return Home();
    }
  }
}