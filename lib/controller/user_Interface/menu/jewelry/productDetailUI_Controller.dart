// ignore_for_file: file_names, avoid_print

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/productsize_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../application_Programing_interface/apiController/menu/jewellery/productDetail/productDetail_Controller.dart';

class ImageController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final List imageList;

  ImageController(this.imageList);

  String get selectedImage => imageList[selectedIndex.value]['zoom'];

  void changeImage(int index) {
    selectedIndex.value = index;
  }
}

class ProductDetailUIController extends GetxController {
  final productDetailAPI = Get.put(ProductdetailController());
  final bracelet = Get.put(BraceletPriceController());
  final rings = Get.put(RingsSizeController());
  final adToCart = Get.put(CreateCartController());
  final remarkController = TextEditingController();
  final engravingController = TextEditingController();

  //Qty
  var qtyValue = 1.obs;

  // Metal Detail & Stone Detail
  var metalDetail = false.obs;
  var stoneDetail = false.obs;

  //Qty
  void incrementQty() {
    qtyValue.value++;
  }

  void decrementQty() {
    if (qtyValue.value > 1) {
      qtyValue.value--;
    }
  }

  //Metal Detail & Stone Detail
  void metalDetails() {
    metalDetail.value = !metalDetail.value;
    stoneDetail.value = false;
  }

  void stoneDetails() {
    metalDetail.value = false;
    stoneDetail.value = !stoneDetail.value;
  }

  /// ------------------ STATE ------------------
  final selectedVariantSlug = ''.obs;

  final selectedRingSize = ''.obs;
  final selectedBraceletSize = ''.obs;

  void updateRingSize(String size) {
    selectedRingSize.value = size;
  }

  void updateBraceletSize(String size) {
    selectedBraceletSize.value = size;
  }

  final activeVariant = <String, dynamic>{}.obs;

  final currentShape = ''.obs;
  final currentMetalStamp = ''.obs;
  final currentMetalType = ''.obs;
  final currentCarat = ''.obs;

  final uniqueShapes = <Map<String, dynamic>>[].obs;
  final uniqueMetalStamp = <Map<String, dynamic>>[].obs;
  final uniqueMetalType = <Map<String, dynamic>>[].obs;
  final uniqueCaratList = <Map<String, dynamic>>[].obs;

  List<Map<String, dynamic>> childProducts = [];

  /// ------------------ INIT ------------------
  @override
  void onInit() {
    super.onInit();
    ever(productDetailAPI.prdoctdetailData, (data) {
      if (data['data'] == null) return;

      childProducts = (data['data']['childProduct'] as List)
          .map((e) => Map<String, dynamic>.from(e))
          .toList();

      /// ⚠️ Only first time
      if (selectedVariantSlug.value.isEmpty && childProducts.isNotEmpty) {
        selectedVariantSlug.value = childProducts.first['slug'];
      }

      _updateVariantData();
    });

    ever(selectedVariantSlug, (_) {
      _updateVariantData();
    });
  }

  /// ------------------ CORE UPDATE ------------------
  void _updateVariantData() {
    if (childProducts.isEmpty) return;

    final variant = childProducts.firstWhere(
      (p) => p['slug'] == selectedVariantSlug.value,
      orElse: () => childProducts.first,
    );

    activeVariant.value = variant;

    /// CURRENT VALUES
    currentShape.value = variant['productStoneDetails']?[0]?['shape']?['paraMtrName'] ?? '';
    currentMetalStamp.value = variant['metalStamp']?[0]?['paraMtrName'] ?? '';
    currentMetalType.value = variant['metalType']?[0]?['metal'] ?? '';
    currentCarat.value = variant['totalWgt']?.toString() ?? '';

    /// UNIQUE OPTIONS
    uniqueShapes.value = {
      for (var p in childProducts)
        p['productStoneDetails'][0]['shape']['paraMtrName']:
        Map<String, dynamic>.from(p['productStoneDetails'][0]['shape']),
    }.values.toList();

    uniqueMetalStamp.value = {
      for (var p in childProducts)
        p['metalStamp'][0]['paraMtrName']: Map<String, dynamic>.from(
          p['metalStamp'][0],
        ),
    }.values.toList();

    uniqueMetalType.value = {
      for (var p in childProducts)
        p['metalType'][0]['metal']: Map<String, dynamic>.from(
          p['metalType'][0],
        ),
    }.values.toList();

    uniqueCaratList.value = {
      for (var p in childProducts)
        p['totalWgt'].toString(): {'totalWgt': p['totalWgt']},
    }.values.toList();

    /// IMAGES
    Get.put(ImageController(variant['images']), permanent: false);
  }

  /// ------------------ UPDATE FROM UI ------------------
  void updateSelectedVariant(String slug) {
    selectedVariantSlug.value = slug;
  }

  /// ------------------ COMBINATION MATCHING ------------------
  Map<String, dynamic> findMatchingVariant({
    required List<Map<String, dynamic>> childProducts,
    String? shape,
    String? metalStamp,
    String? metalType,
    String? carat,
  }) {
    return childProducts.firstWhere((product) {
      final pShape =
          product['productStoneDetails']?[0]?['shape']?['paraMtrName'];
      final pStamp = product['metalStamp']?[0]?['paraMtrName'];
      final pMetal = product['metalType']?[0]?['metal'];
      final pCarat = product['totalWgt']?.toString();

      return (shape == null || shape == pShape) &&
          (metalStamp == null || metalStamp == pStamp) &&
          (metalType == null || metalType == pMetal) &&
          (carat == null || carat == pCarat);
    }, orElse: () => childProducts.first);
  }

  /// Selected IDs
  final selectedRingSizeId = ''.obs;
  final selectedBraceletSizeId = ''.obs;

  void onSizeSelected({
    required bool isRing,
    required String size,
    required String paraMtrId,
    String? productId,
    String? sizeId,
  }) {
    if (isRing) {
      selectedRingSize.value = size;
      selectedRingSizeId.value = paraMtrId;

      /// Ring size related API
      rings.ringsPriceAPI(productId: productId!, sizeId: sizeId!);
    } else {
      selectedBraceletSize.value = size;
      selectedBraceletSizeId.value = paraMtrId;

      /// Bracelet size related API
      bracelet.braceletPriceAPI(productId: productId!, sizeId: sizeId!);
    }
  }

  //Add To Cart
  void addToCart() {
    String? ringSizeParam;

    if (selectedRingSize.value.isNotEmpty) {
      ringSizeParam = selectedRingSize.value;
    } else if (selectedBraceletSize.value.isNotEmpty) {
      ringSizeParam = selectedBraceletSize.value;
    } else {
      ringSizeParam = null;
    }
    adToCart.createCart(
      price: activeVariant['finalPrice'].toString(),
      productId: activeVariant['_id'].toString(),
      engravingText: engravingController.text,
      sizeRemark: remarkController.text,
      qty: qtyValue.value.toString(),
      ringSize: ringSizeParam?.isEmpty == true ? null : ringSizeParam,
      DiamondId: '',
    );
    print({
      'activeVariant': activeVariant,
      'ringSize': ringSizeParam,
      'price': activeVariant['finalPrice'].toString(),
      'productId': activeVariant['_id'].toString(),
      'engravingText': engravingController.text,
      'sizeRemark': remarkController.text,
      'qty': qtyValue.value.toString(),
      'DiamondId': '',
    });
  }
}
