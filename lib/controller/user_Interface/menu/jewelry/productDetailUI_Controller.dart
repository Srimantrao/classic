// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductdetailuiController extends GetxController {
  final remarkController = TextEditingController();
  final engravingController = TextEditingController();

  //selected Bracele Size
  var selectedBraceletSize = RxnString();

  //Shape
  String? selectShape;

  //carat Button
  var isSelectcarat_10K = false.obs;
  var isSelectcarat_14K = true.obs;
  var isSelectcarat_18K = false.obs;

  //metal Type Button
  var isSelectWitheGold = false.obs;
  var isSelectRoseGold = false.obs;
  var isSelectYellowGold = false.obs;

  //select carat
  var selectcarat_75 = false.obs;
  var selectcarat_1 = false.obs;

  //Qty
  var qtyValue = 1.obs;

  //Metal Detail & Stone Detail
  var metalDetail = false.obs;
  var stoneDetail = false.obs;

  //Shape
  void selectDiamondShape(String shape) {
    selectShape = shape;
    update();
  }

  //carat Button
  void selectcarat_10K() {
    isSelectcarat_10K.value = true;
    isSelectcarat_14K.value = false;
    isSelectcarat_18K.value = false;
  }

  void selectcarat_14K() {
    isSelectcarat_10K.value = false;
    isSelectcarat_14K.value = true;
    isSelectcarat_18K.value = false;
  }

  void selectcarat_18K() {
    isSelectcarat_10K.value = false;
    isSelectcarat_14K.value = false;
    isSelectcarat_18K.value = true;
  }

  //metal Type Button
  void selectWitheGold() {
    isSelectWitheGold.value = true;
    isSelectRoseGold.value = false;
    isSelectYellowGold.value = false;
  }

  void selectRoseGold() {
    isSelectWitheGold.value = false;
    isSelectRoseGold.value = true;
    isSelectYellowGold.value = false;
  }

  void selectYellowGold() {
    isSelectWitheGold.value = false;
    isSelectRoseGold.value = false;
    isSelectYellowGold.value = true;
  }

  //select carat
  void select_75() {
    selectcarat_75.value = true;
    selectcarat_1.value = false;
  }

  void select_1() {
    selectcarat_75.value = false;
    selectcarat_1.value = true;
  }

  //Qty
  void incrementQty() {
    qtyValue.value++;
  }

  void decrementQty() {
    if (qtyValue.value > 1) {
      qtyValue.value--;
    }
  }

  //Metal Detail & Stone Detail
  void metalDetails() {
    metalDetail.value =! metalDetail.value;
    stoneDetail.value = false;
  }

  void stoneDetails() {
    metalDetail.value = false;
    stoneDetail.value =! stoneDetail.value;
  }
}
