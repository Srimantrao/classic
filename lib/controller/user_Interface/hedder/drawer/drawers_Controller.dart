import 'package:get/get.dart';

class DrawersUIController extends GetxController {
  var jewellery = false.obs;
  var shopByMetal = false.obs;
  var show = false.obs;

  //Jewellery
  void showJewellery() {
    jewellery.value = !jewellery.value;
    update();
  }

  //shopByMetal
  void showShopByMetal() {
    shopByMetal.value = !shopByMetal.value;
    update();
  }

  //show
  void showShow() {
    show.value = !show.value;
    update();
  }
}
