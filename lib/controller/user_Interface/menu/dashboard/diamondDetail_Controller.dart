// ignore_for_file: must_be_immutable, file_names, use_key_in_widget_constructors

import 'dart:convert';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/fitterWish/fitterWish_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createWishList_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../application_Programing_interface/apiController/menu/diamondSearch/diamondShow_Controller.dart';
import '../../../application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';

class DiamondDetailUIController extends GestureDetector {
  final adToCart = Get.put(CreateCartController());
  final addWishListCart = Get.put(CreateWishlistController());
  final diamondShow = Get.put(DiamondShowController());

  //select Image & Video
  var isSelectImage = true.obs;
  var isSelectVideo = false.obs;

  //select Details
  var isSelectDetails = true.obs;
  var isSelectMeasurements = false.obs;
  var isSelectInclusion = false.obs;

  //select Image & Video
  void selectImage() {
    isSelectImage.value = true;
    isSelectVideo.value = false;
  }

  void selectVideo() {
    isSelectImage.value = false;
    isSelectVideo.value = true;
  }

  //select Details
  void selectDetails() {
    isSelectDetails.value = true;
    isSelectMeasurements.value = false;
    isSelectInclusion.value = false;
  }

  void selectMeasurements() {
    isSelectDetails.value = false;
    isSelectMeasurements.value = true;
    isSelectInclusion.value = false;
  }

  void selectInclusion() {
    isSelectDetails.value = false;
    isSelectMeasurements.value = false;
    isSelectInclusion.value = true;
  }

  void addToCart() {
    final diamondId = diamondShow.diamondSearchData['data'][0]['_id'];
    adToCart.createCart(
      DiamondId: jsonEncode([diamondId]),
      qty: '1',
    );
    if (kDebugMode) {
      print('DiamondId :- ${jsonEncode([diamondId])}');
    }
  }

  void addToWishListCart(){
    final fitterWish = Get.put(FitterWishController());
    final diamondId = diamondShow.diamondSearchData['data'][0]['_id'];
    addWishListCart.createWishlist(
      DiamondId: jsonEncode([diamondId]),
      qty: '1',
    );
    if (kDebugMode) {
      print('DiamondId :- ${jsonEncode([diamondId])}');
    }
    fitterWish.fitterWishList();
  }
}
