// ignore_for_file: must_be_immutable, file_names, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DiamondDetailUIController extends GestureDetector {
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
}
