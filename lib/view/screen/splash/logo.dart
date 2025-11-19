// ignore_for_file: sized_box_for_whitespace

import 'package:classic/controller/user_Interface/splash/logo_Controller.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/widget/fullScreen.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogoController());
    return Fullscreen(image: AppImage.spalsh_background);
  }
}