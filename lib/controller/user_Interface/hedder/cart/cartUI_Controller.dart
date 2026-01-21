import 'package:get/get.dart';

class CartUiController extends GetxController {

  List<int> qtyList = [];
  double grandTotal = 0;

  void initQty(List cartProduct) {
    qtyList = cartProduct.map((e) => e['qty'] ?? 1).cast<int>().toList();
    calculateGrandTotal(cartProduct);
  }

  void calculateGrandTotal(List cartProduct) {
    grandTotal = 0;
    for (int i = 0; i < cartProduct.length; i++) {
      double price = cartProduct[i]['price']?.toDouble() ?? 0;
      grandTotal += price * qtyList[i];
    }
    update(['total']);
  }

  void incrementQty(int index, List cartProduct) {
    qtyList[index]++;
    update(['qty_$index']);
    calculateGrandTotal(cartProduct);
  }

  void decrementQty(int index, List cartProduct) {
    if (qtyList[index] > 1) {
      qtyList[index]--;
      update(['qty_$index']);
      calculateGrandTotal(cartProduct);
    }
  }
}
