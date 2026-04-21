// ignore_for_file: strict_top_level_inference, avoid_print

import 'package:get/get.dart';
import '../../../../view/screen/menu/jewelry/jewelryScreen/product.dart';

class DrawersUIController extends GetxController {
  var engagement = false.obs;
  var weddingbands = false.obs;
  var jewellery = false.obs;
  var shopByMetal = false.obs;
  var show = false.obs;
  var diamonds = false.obs;
  var shape = false.obs;
  var shape2 = false.obs;

  //Engaemant
  var shaopmetal = false.obs;
  var shopstyle = false.obs;
  var shapProduct = false.obs;

  //Wedding Bands
  var shaopmetalWedding = false.obs;
  var shopstyleWedding = false.obs;
  var shapProductWedding = false.obs;

  // Track selected metal type and stamp
  var selectedMetalType = ''.obs;
  var selectedMetalStamp = ''.obs;

  //Engagement Rings
  void showEngagement() {
    engagement.value = !engagement.value;
    String categoryId;
    String categoryName;
    if (engagement.value == true) {
      categoryId = '67ee85d43c2ae60318a28998';
      categoryName = 'Engagement Rings';
      print({'categoryId': categoryId, 'categoryName': categoryName});
    }
    if (engagement.value == false) {
      categoryId = '';
      categoryName = '';
    }
    update();
  }

  void engagementSeramani(
    drawerUI,
    productMetal,
    productstamp,
    engagementCategory,
  ) {
    final metalStamp = drawerUI.selectedMetalStamp.value;
    final metalType = drawerUI.selectedMetalType.value;
    final selectedMetal = productMetal.firstWhere(
      (e) =>
          (e['metal'] ?? '').toString().toLowerCase().trim() ==
          metalType.toLowerCase().trim(),
      orElse: () => null,
    );
    final selectedStamp = productstamp.firstWhere(
      (e) =>
          (e['paraMtrName'] ?? '').toString().toLowerCase().trim() ==
          metalStamp.toLowerCase().trim(),
      orElse: () => null,
    );
    if (selectedMetal != null && selectedStamp != null) {
      Get.to(
        () => Product(
          categoryId: engagementCategory['_id'],
          categoryName: "$metalStamp $metalType",
          metalStamp: selectedStamp['_id'],
          metalType: selectedMetal['_id'],
        ),
      );
    } else {
      print("❌ Selection not found");
    }
    update();
  }

  //Wedding
  void weddingBandsSeramani(
    drawerUI,
    productMetal,
    productstamp,
    weddingBandsCategory,
  ) {
    final metalStamp = drawerUI.selectedMetalStamp.value;
    final metalType = drawerUI.selectedMetalType.value;

    final selectedMetal = productMetal.firstWhere(
      (e) =>
          (e['metal'] ?? '').toString().toLowerCase().trim() ==
          metalType.toLowerCase().trim(),
      orElse: () => null,
    );

    final selectedStamp = productstamp.firstWhere(
      (e) =>
          (e['paraMtrName'] ?? '').toString().toLowerCase().trim() ==
          metalStamp.toLowerCase().trim(),
      orElse: () => null,
    );

    if (selectedMetal != null && selectedStamp != null) {
      Get.to(
        () => Product(
          categoryId: weddingBandsCategory['_id'],
          categoryName: "$metalStamp $metalType",
          metalStamp: selectedStamp['_id'],
          metalType: selectedMetal['_id'],
        ),
      );
    } else {
      print("❌ Wedding Bands selection not found");
    }
    update();
  }

  //Engaemant
  void shopMetal() {
    shaopmetal.value = !shaopmetal.value;
    update();
  }

  void shopStyle() {
    shopstyle.value = !shopstyle.value;
    update();
  }

  void shapeProduct() {
    shapProduct.value = !shapProduct.value;
    update();
  }

  //Wedding
  void shopMetalWedding() {
    shaopmetalWedding.value = !shaopmetalWedding.value;
    update();
  }

  void shopStyleWedding() {
    shopstyleWedding.value = !shopstyleWedding.value;
    update();
  }

  void shapeProductWedding() {
    shapProductWedding.value = !shapProductWedding.value;
    update();
  }

  void selectMetalType(String metalType) {
    selectedMetalType.value = metalType;
    update();
  }

  void selectMetalStamp(String metalStamp) {
    selectedMetalStamp.value = metalStamp;
    update();
  }

  //Wedding bands
  void showWeddingbands() {
    weddingbands.value = !weddingbands.value;
    String categoryId;
    String categoryName;
    if (weddingbands.value == true) {
      categoryId = '682181561353060d79b6e480';
      categoryName = 'Wedding Bands';
      print({'categoryId': categoryId, 'categoryName': categoryName});
    }
    if (weddingbands.value == false) {
      categoryId = '';
      categoryName = '';
    }
    update();
  }

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
