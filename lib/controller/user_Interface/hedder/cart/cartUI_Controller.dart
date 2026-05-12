// ignore_for_file: avoid_print

import 'dart:async';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/cart/updateCart_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../application_Programing_interface/apiController/hedder/cart/deleteCart_Controller.dart';
import '../../../application_Programing_interface/callApi/callAPI.dart';

class CartUiController extends GetxController {
  final updateCart = Get.put(UpdateCartController());
  final removeItem = Get.put(DeleteCartController());
  final cartAPICallAPI = Get.put(CartAPICall());

  List cartList = [];
  Timer? _qtyDebounce;

  List<int> qtyList = [];
  List<String> ringSizeList = [];
  List<double> unitPriceList = [];
  RxDouble grandTotal = 0.0.obs;
  RxDouble diamondTotal = 0.0.obs;
  RxInt updatingQty = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  void initQty(List cartProduct, {double? apiDiamondTotal}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      qtyList = cartProduct
          .where((e) => e['qty'] != null)
          .map<int>((e) => (e['qty'] as num).toInt())
          .toList();
      ringSizeList = cartProduct
          .map<String>((e) => e['ringSizeId']?.toString() ?? '')
          .toList();
      unitPriceList = cartProduct
          .map<double>((e) => (e['price'] as num?)?.toDouble() ?? 0.0)
          .toList();

      if (apiDiamondTotal != null) {
        diamondTotal.value = apiDiamondTotal;
      }
      calculateGrandTotal();
    });
  }

  void calculateGrandTotal() {
    double totalValue = diamondTotal.value;
    for (int i = 0; i < qtyList.length; i++) {
      totalValue += unitPriceList[i] * qtyList[i];
    }
    grandTotal.value = totalValue;
    update(['grand_total', 'qty_list']);
  }

  void incrementQty(int index, String id) {
    if (index < qtyList.length) {
      qtyList[index]++;
      updatingQty.value = qtyList[index];
      update(['qty_$index', 'grand_total']);
      _debouncedUpdateCart(index, id);
    }
    update();
  }

  void decrementQty(int index, String id) {
    if (index < qtyList.length && qtyList[index] > 1) {
      qtyList[index]--;
      updatingQty.value = qtyList[index];
      update(['qty_$index', 'grand_total']);
      _debouncedUpdateCart(index, id);
    }
    update();
  }

  void changeRingSize(int index, String ringSize, String id) {
    if (index < ringSizeList.length) {
      ringSizeList[index] = ringSize;
      _updateCart(index, id);
      update(['ring_$index', 'qty_$index', 'grand_total']);
    }
    update();
  }

  void _debouncedUpdateCart(int index, String id) {
    _qtyDebounce?.cancel();
    _qtyDebounce = Timer(const Duration(milliseconds: 600), () {
      _updateCart(index, id);
    });
    update();
  }

  Future<void> _updateCart(int index, String id) async {
    if (index < unitPriceList.length && index < qtyList.length) {
      totalPrice.value = unitPriceList[index] * qtyList[index];
      await updateCart.updateCart(
        id,
        qty: qtyList[index].toString(),
        price: totalPrice.value.toStringAsFixed(2),
        ringSizeId: ringSizeList[index],
      );
      calculateGrandTotal();
      update();
    }
  }

  Future<void> removeCartItem(int index, String id) async {
    if (index < qtyList.length) {
      qtyList.removeAt(index);
      if (index < ringSizeList.length) ringSizeList.removeAt(index);
      if (index < unitPriceList.length) unitPriceList.removeAt(index);
    }
    calculateGrandTotal();
    update(['grand_total', 'qty_list', 'cartList']);
    await removeItem.deleteCart(id);
    await cartAPICallAPI.cartAPI.filterCart();
    update();
  }
}
