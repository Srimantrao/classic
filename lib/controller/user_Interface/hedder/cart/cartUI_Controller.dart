import 'package:classic/controller/application_Programing_interface/apiController/hedder/cart/updateCart_Controller.dart';
import 'package:get/get.dart';
import '../../../application_Programing_interface/apiController/hedder/cart/deleteCart_Controller.dart';

class CartUiController extends GetxController {
  final UpdateCartController updateCart = Get.put(UpdateCartController());
  final DeleteCartController removeItem = Get.put(DeleteCartController());

  List cartList = [];

  List<int> qtyList = [];
  List<String> ringSizeList = [];
  List<double> unitPriceList = [];
  double grandTotal = 0;

  void initQty(List cartProduct) {
    qtyList = cartProduct.map<int>((e) => (e['qty'] as num?)?.toInt() ?? 1).toList();
    ringSizeList = cartProduct.map<String>((e) => e['ringSizeId']?.toString() ?? '').toList();
    unitPriceList = cartProduct.map<double>((e) => (e['price'] as num?)?.toDouble() ?? 0.0).toList();
    calculateGrandTotal();
  }

  void calculateGrandTotal() {
    grandTotal = 0;
    for (int i = 0; i < qtyList.length; i++) {
      grandTotal += unitPriceList[i] * qtyList[i];
    }
    update(['total']);
  }

  void incrementQty(int index, String id) {
    qtyList[index]++;
    _updateCart(index, id);
    update(['qty_$index']);
  }

  void decrementQty(int index, String id) {
    if (qtyList[index] <= 1) return;
    qtyList[index]--;
    _updateCart(index, id);
    update(['qty_$index']);
  }

  void changeRingSize(int index, String ringSize, String id) {
    ringSizeList[index] = ringSize;
    _updateCart(index, id);
    update(['ring_$index', 'qty_$index']);
  }

  void _updateCart(int index, String id) {
    final totalPrice = unitPriceList[index] * qtyList[index];
    updateCart.updateCart(
      id,
      qty: qtyList[index].toString(),
      price: totalPrice.toStringAsFixed(2),
      ringSizeId: ringSizeList[index],
    );
    calculateGrandTotal();
  }

  void removeCartItem(int index, String id) {
    qtyList.removeAt(index);
    ringSizeList.removeAt(index);
    unitPriceList.removeAt(index);
    calculateGrandTotal();
    removeItem.deleteCart(id);
    // Update UI
    update(['cartList']);
  }
}
