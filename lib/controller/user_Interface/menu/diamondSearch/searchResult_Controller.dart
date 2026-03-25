// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/fitterWish/fitterWish_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/holdDiamond/holdDiamond_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/diamondSearch/diamondHold_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createWishList_Controller.dart';
import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../application_Programing_interface/apiController/menu/diamondSearch/diamondSearch_Controller.dart';

class SearchResultController extends GetxController {
  final diamondSearchAPI = Get.find<DiamondSearchController>();
  final addholdToDimaonds = Get.put(DiamondHoldController());
  final getholdDiamond = Get.put(HoldDiamondController());
  final adToCart = Get.put(CreateCartController());
  final cartAPICallAPI = Get.put(CartAPICall());
  final fitterWish = Get.put(FitterWishController());
  final addWishListCart = Get.put(CreateWishlistController());
  final ScrollController scrollController = ScrollController();

  RxList<bool> holdDiamondList = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (!diamondSearchAPI.isPaginationLoading.value &&
          diamondSearchAPI.diamondList.length <
              (diamondSearchAPI.diamondSearchData['totalCount'] ?? 0)) {
        diamondSearchAPI.currentPage++;
        diamondSearchAPI.diamondSearching(
          pageSize: diamondSearchAPI.pageSize.toString(),
          pageNumber: diamondSearchAPI.currentPage.toString(),
          isPagination: true,
        );
      }
    }
  }

  void initHoldDiamond(int length) {
    holdDiamondList.value = List.generate(length, (index) => false);
  }

  int get selectedDiamondCount {
    return holdDiamondList.where((e) => e == true).length;
  }

  // double getTotalCts(List valueList) {
  //   double total = 0.0;
  //   for (int i = 0; i < holdDiamondList.length; i++) {
  //     if (holdDiamondList[i]) {
  //       total += double.tryParse(valueList[i]['parcarat'].toString()) ?? 0.0;
  //     }
  //   }
  //   return total;
  // }

  double getTotalCts(List valueList) {
    double totalPieces = 0.0;
    double carat;
    double parCarat;
    for (int i = 0; i < holdDiamondList.length; i++) {
      if (holdDiamondList[i]) {
        carat = double.tryParse(valueList[i]['carat'].toString()) ?? 0.0;
        parCarat = double.tryParse(valueList[i]['parcarat'].toString()) ?? 0.0;
        if (parCarat != 0) {
          totalPieces = (parCarat / carat);
        }
      }
      print("totalPieces :- $totalPieces");
    }
    return totalPieces;
  }

  double getTotalCarat(List valueList) {
    double total = 0.0;
    for (int i = 0; i < holdDiamondList.length; i++) {
      if (holdDiamondList[i]) {
        total += double.tryParse(valueList[i]['carat'].toString()) ?? 0.0;
      }
    }
    return total;
  }

  double getTotalAmount(List valueList) {
    double total = 0.0;
    for (int i = 0; i < holdDiamondList.length; i++) {
      if (holdDiamondList[i]) {
        total += double.tryParse(valueList[i]['finalamount'].toString()) ?? 0.0;
      }
    }
    return total;
  }

  void holdDiamondValue(int index, bool value) {
    holdDiamondList[index] = value;
    holdDiamondList.refresh();
  }

  void addHoldDiamond() async {
    final apiData = diamondSearchAPI.diamondSearchData;
    final List apiloadData = apiData['data'] ?? [];
    List<String> selectedIds = [];
    for (int i = 0; i < holdDiamondList.length; i++) {
      if (holdDiamondList[i] == true) {
        selectedIds.add(apiloadData[i]["_id"]);
      }
    }
    if (selectedIds.isNotEmpty) {
      await addholdToDimaonds.holdDiamond(ids: jsonEncode(selectedIds));
      getholdDiamond.getHoldDimaond();
      print('Selected diamond IDs: ${[selectedIds]}');
    } else {
      print("Please select at least one diamond");
    }
  }

  void addToCart() async {
    final dasbaord = Get.put(DashBordAPICall());
    final apiData = diamondSearchAPI.diamondSearchData;
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
      dasbaord.cardRecord.fetchCardRecords(isFirstLoad: true, type: 'Diamond');
    } else {
      if (kDebugMode) {
        print("Please select at least one diamond");
      }
    }
  }

  void addToWishListCart() async {
    final apiData = diamondSearchAPI.diamondSearchData;
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
