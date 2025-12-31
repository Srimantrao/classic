// ignore_for_file: sized_box_for_whitespace

import 'package:classic/controller/user_Interface/splash/logo_Controller.dart';
import 'package:classic/view/utils/app_Gif.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/widget/fullScreen.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LogoController());
    return Fullscreen(
      image: AppImage.spalsh_background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(image: AssetImage(AppGif.loader), height: 80, width: 80),
          SizedBox(height: Get.height * 0.05)
        ],
      ),
    );
  }
}
