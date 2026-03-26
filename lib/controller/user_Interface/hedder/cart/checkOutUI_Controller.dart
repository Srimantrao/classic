import 'package:get/get.dart';

class CheckoutUiController extends GetxController {
  var isbiilingValue = false.obs;

  var billingAddress = false.obs;

  Future<void> isbillingAddress(bool value) async {
    isbiilingValue.value = value;
  }

  void isBillingItem() {
    billingAddress.value = !billingAddress.value;
  }
}
