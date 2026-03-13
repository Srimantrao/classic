// ignore_for_file: file_names, deprecated_member_use, unnecessary_null_comparison, avoid_print

import 'dart:convert';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/fitterWish/fitterWish_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/holdDiamond/holdDiamond_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/holdDiamond/removeDiamond_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createWishList_Controller.dart';
import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HolddiamodUIController extends GetxController
    with SingleGetTickerProviderMixin {
  final getholdDiamond = Get.put(HoldDiamondController());
  final removeAccount = Get.put(RemoveDiamondController());
  final adToCart = Get.put(CreateCartController());
  final cartAPICallAPI = Get.put(CartAPICall());
  final fitterWish = Get.put(FitterWishController());
  final addWishListCart = Get.put(CreateWishlistController());

  late AnimationController animationController;
  late Animation<double> animation;

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

    ever(getholdDiamond.getHoldDimaondData, (data) {
      if (data != null && data['data'] is List) {
        initializeHoldDiamondList((data['data'] as List).length);
      }
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  //Add List Viwe
  RxList<int> selectedIndices = <int>[].obs;

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

  RxList<bool> holdDiamondList = <bool>[].obs;

  void initHoldDiamond(int length) {
    if (holdDiamondList.length != length) {
      holdDiamondList.value = List.generate(length, (index) => false);
    }
  }

  void initializeHoldDiamondList(int length) {
    if (holdDiamondList.length != length) {
      holdDiamondList.value = List.generate(length, (index) => false);
    }
  }

  void holdDiamondValue(int index, bool value) {
    if (index < holdDiamondList.length) {
      holdDiamondList[index] = value;
      holdDiamondList.refresh();
    }
  }

  int get selectedDiamondCount {
    return holdDiamondList.where((e) => e == true).length;
  }

  double getTotalCts(List valueList) {
    double total = 0.0;
    for (int i = 0; i < holdDiamondList.length; i++) {
      if (i < valueList.length && holdDiamondList[i]) {
        total +=
            double.tryParse(valueList[i]['parcarat']?.toString() ?? '0') ?? 0.0;
      }
    }
    return total;
  }

  double getTotalCarat(List valueList) {
    double total = 0.0;
    for (int i = 0; i < holdDiamondList.length; i++) {
      if (i < valueList.length && holdDiamondList[i]) {
        total +=
            double.tryParse(valueList[i]['carat']?.toString() ?? '0') ?? 0.0;
      }
    }
    return total;
  }

  double getTotalAmount(List valueList) {
    double total = 0.0;
    for (int i = 0; i < holdDiamondList.length; i++) {
      if (i < valueList.length && holdDiamondList[i]) {
        total +=
            double.tryParse(valueList[i]['finalamount']?.toString() ?? '0') ??
            0.0;
      }
    }
    return total;
  }

  void removeHoldDiamond() {
    final apiData = getholdDiamond.getHoldDimaondData;
    final List apiloadData = apiData['data'] ?? [];
    List<String> selectedIds = [];
    for (int i = 0; i < holdDiamondList.length; i++) {
      if (holdDiamondList[i] == true) {
        selectedIds.add(apiloadData[i]["_id"]);
      }
    }
    getholdDiamond.getHoldDimaond();
    if (selectedIds.isNotEmpty) {
      removeAccount.removeDiamond(jsonEncode([selectedIds]));
      print('Removed diamond IDs: ${[selectedIds]}');
    } else {
      print("Please select at least one diamond");
    }
  }

  void addToCart() async {
    final apiData = getholdDiamond.getHoldDimaondData;
    final List apiloadData = apiData['data'] ?? [];
    List<String> selectedIds = [];
    for (int i = 0; i < holdDiamondList.length && i < apiloadData.length; i++) {
      if (holdDiamondList[i]) {
        selectedIds.add(apiloadData[i]["_id"]);
      }
    }
    if (selectedIds.isNotEmpty) {
      await adToCart.createCart(DiamondId: jsonEncode(selectedIds), qty: '1');
      if (kDebugMode) {
        print('DiamondId :- ${jsonEncode(selectedIds)}');
      }
      cartAPICallAPI.cartAPI.filterCart();
    } else {
      if (kDebugMode) {
        print("Please select at least one diamond");
      }
    }
  }

  void addToWishListCart() async {
    final apiData = getholdDiamond.getHoldDimaondData;
    final List apiloadData = apiData['data'] ?? [];
    List<String> selectedIds = [];
    for (int i = 0; i < holdDiamondList.length && i < apiloadData.length; i++) {
      if (holdDiamondList[i]) {
        selectedIds.add(apiloadData[i]["_id"]);
      }
    }
    if (selectedIds.isNotEmpty) {
      await addWishListCart.createWishlist(
        DiamondId: jsonEncode(selectedIds),
        qty: '1',
      );
      if (kDebugMode) {
        print('DiamondId :- ${jsonEncode(selectedIds)}');
      }
      fitterWish.fitterWishList();
    } else {
      if (kDebugMode) {
        print("Please select at least one diamond");
      }
    }
  }
}
