// ignore_for_file: avoid_print

import 'dart:async';

import 'package:classic/controller/application_Programing_interface/apiController/hedder/cart/updateCart_Controller.dart';
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
  double grandTotal = 0;
  RxInt updatingQty = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  void initQty(List cartProduct) {
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
    calculateGrandTotal();
  }

  void calculateGrandTotal() {
    grandTotal = 0;
    for (int i = 0; i < qtyList.length; i++) {
      grandTotal += unitPriceList[i] * qtyList[i];
    }
    update(['grand_total']);
  }

  void incrementQty(int index, String id) {
    qtyList[index]++;
    updatingQty.value = qtyList[index];
    update(['qty_$index']);
    _debouncedUpdateCart(index, id);
  }

  void decrementQty(int index, String id) {
    if (qtyList[index] <= 1) return;
    qtyList[index]--;
    updatingQty.value = qtyList[index];
    update(['qty_$index']);
    _debouncedUpdateCart(index, id);
  }

  void changeRingSize(int index, String ringSize, String id) {
    ringSizeList[index] = ringSize;
    _updateCart(index, id);
    update(['ring_$index', 'qty_$index']);
  }

  void _debouncedUpdateCart(int index, String id) {
    _qtyDebounce?.cancel();
    _qtyDebounce = Timer(const Duration(milliseconds: 600), () {
      _updateCart(index, id);
    });
  }

  Future<void> _updateCart(int index, String id) async {
    totalPrice.value = unitPriceList[index] * qtyList[index];

    await updateCart.updateCart(
      id,
      qty: updatingQty.value.toString(), // ✅ correct
      price: totalPrice.toStringAsFixed(2),
      ringSizeId: ringSizeList[index],
    );

    // 🔍 Debug logs
    print('Id        :- $id');
    print('Qty       :- ${updatingQty.value}');
    print('UnitPrice :- ${unitPriceList[index]}');
    print('Price     :- ${totalPrice.toStringAsFixed(2)}');
    print('RingSize  :- ${ringSizeList[index]}');

    calculateGrandTotal();
  }

  void removeCartItem(int index, String id) {
    // qtyList.removeAt(index);
    // ringSizeList.removeAt(index);
    // unitPriceList.removeAt(index);
    calculateGrandTotal();
    removeItem.deleteCart(id);
    // Update UI
    cartAPICallAPI.cartAPI.filterCart();
    update(['cartList']);
  }
}
