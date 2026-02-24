// ignore_for_file: strict_top_level_inference

import 'package:classic/controller/user_Interface/hedder/drawer/show_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/show/showWidget/body/showWidget.dart';
import 'package:classic/view/screen/menu/home/homeWidget/body/homeBody.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Show extends StatelessWidget {
  final showUI = Get.put(ShowControllerUI());
  final String? imageShow;
  Show({super.key, this.imageShow});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.show),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (imageShow != null && imageShow!.isNotEmpty)
              showImage(imageShow!),
            height(),
            Obx(() => fillTheForm(showUI)),
            whatClassic(),
            height(),
          ],
        ),
      ),
    );
  }
}
