import 'package:get/get.dart';

class DrawersUIController extends GetxController {
  var jewellery = false.obs;
  var shopByMetal = false.obs;
  var show = false.obs;
  var diamonds = false.obs;
  var shape = false.obs;
  var shape2 = false.obs;


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

  //diamonds
  void showDiamonds() {
    diamonds.value = !diamonds.value;
    update();
  }

  //shape
  void showShape() {
    shape.value = !shape.value;
    update();
  }

  void showShape2() {
    shape2.value = !shape2.value;
    update();
  }
}
