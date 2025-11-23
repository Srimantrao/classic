
// ignore_for_file: file_names

import 'package:get/get.dart';

class Widgetsize {
  static double getContainerHeight() {
    final screenHeight = Get.height;
    final isSmallScreen = screenHeight < 700;
    return screenHeight * (isSmallScreen ? 0.06 : 0.05);
  }
}