// ignore_for_file: file_names

import 'package:classic/view/screen/credentials/login.dart';
import 'package:get/get.dart';

class LogoController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () => Get.offAll(() => Login()));
  }
}
