// ignore_for_file: file_names

import 'package:classic/view/screen/credentials/login/loginScreen/login.dart';
import 'package:classic/view/utils/app_Constants.dart';
import 'package:classic/view/utils/widget/bottom/bottomShow/bottomBar.dart';
import 'package:get/get.dart';

class LogoController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3), () {
      if (isLogin) {
        Get.offAll(() => Bottombar());
      } else {
        Get.offAll(() => Login());
      }
    });
  }
}
