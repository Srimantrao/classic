// ignore_for_file: file_names

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HolddiamodUIController extends GetxController
    // ignore: deprecated_member_use
    with SingleGetTickerProviderMixin {
  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  //Add List Viwe
  RxList<int> selectedIndices = <int>[].obs;

  //Flotting Action Button
  late AnimationController animationController;
  late Animation<double> animation;

  //Flotting Action Button
  void toggle() {
    if (animationController.isCompleted) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  //Add List Viwe
  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
    }
    update();
  }

  double calculateTotalCarats(List<Map<String, dynamic>> diamondList) {
    double totalCarats = 0.0;
    for (int index in selectedIndices) {
      if (index < diamondList.length) {
        final diamond = diamondList[index];
        totalCarats += double.tryParse(diamond['Carat'].toString()) ?? 0.0;
      }
    }
    return totalCarats;
  }

  double calculateTotalAmount(List<Map<String, dynamic>> diamondList) {
    double totalAmount = 0.0;
    int count = selectedIndices.length;

    if (count == 0) return 0.0;

    for (int index in selectedIndices) {
      if (index < diamondList.length) {
        final diamond = diamondList[index];
        final priceString = diamond['price'].toString();
        final cleanedPrice = priceString.replaceAll(RegExp(r'[^\d.]'), '');

        totalAmount += double.tryParse(cleanedPrice) ?? 0.0;
      }
    }
    return totalAmount;
  }

  double calculateRapTotalAmount(List<Map<String, dynamic>> diamondList) {
    double totalAmount = 0.0;
    for (int index in selectedIndices) {
      if (index < diamondList.length) {
        final diamond = diamondList[index];
        final priceString = diamond['Rap Price'].toString();
        final cleanedPrice = priceString.replaceAll(RegExp(r'[^\d.]'), '');
        totalAmount += double.tryParse(cleanedPrice) ?? 0.0;
      }
    }
    return totalAmount;
  }

  double calculateTotalTotalAmount(List<Map<String, dynamic>> diamondList) {
    double totalAmount = 0.0;
    for (int index in selectedIndices) {
      if (index < diamondList.length) {
        final diamond = diamondList[index];
        final priceString = diamond['price'].toString();
        final cleanedPrice = priceString.replaceAll(RegExp(r'[^\d.]'), '');
        totalAmount += double.tryParse(cleanedPrice) ?? 0.0;
      }
    }
    return totalAmount;
  }

  double calculatePricePerCarat(List<Map<String, dynamic>> diamondList) {
    double totalCarats = calculateTotalCarats(diamondList);
    double totalAmount = calculateTotalTotalAmount(diamondList);

    if (totalCarats == 0) return 0.0;
    return totalAmount / totalCarats;
  }
}
