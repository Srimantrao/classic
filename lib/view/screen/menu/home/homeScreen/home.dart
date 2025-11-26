// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_import

import 'package:classic/controller/user_Interface/menu/home/home_Controller.dart';
import 'package:classic/modal/menu/home/our_collection.dart';
import 'package:classic/view/screen/menu/home/homeWidget/body/homeBody.dart';
import 'package:classic/view/screen/menu/home/homeWidget/fotter/homeFotter.dart';
import 'package:classic/view/screen/menu/home/homeWidget/header/appbar.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/app_video.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Home extends StatelessWidget {
  final homeUI = Get.put(HomeUIController());
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: appBar(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            sliderImages(),
            Obx(() => ourCollection(homeUI)),
            adVideo(),
            adImage(),
            whatClassic(),
            emailContainer(),
            fotter(),
          ],
        ),
      ),
    );
  }
}