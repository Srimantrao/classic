// ignore_for_file: must_be_immutable, file_names, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DiamondDetailUIController extends GestureDetector {
  //select Image & Video
  var isSelectImage = true.obs;
  var isSelectVideo = false.obs;

  //select Image & Video
  void selectImage() {
    isSelectImage.value = true;
    isSelectVideo.value = false;
  }

  void selectVideo() {
    isSelectImage.value = false;
    isSelectVideo.value = true;
  }
}
