// ignore_for_file: file_names

import 'package:classic/controller/user_Interface/menu/dashboard/diamondDetail_Controller.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/diamondDetail.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/header/diamondDetail.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_video.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/video/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/widget/bottomNavigationButton.dart';

class Diamonddetail extends StatelessWidget {
  final diamonddetail = Get.put(DiamondDetailUIController());
  final String shape;
  final String careat;
  final String lab;
  final String colorcode;
  final String clarity;
  final String cartifactNo;

  Diamonddetail({
    super.key,
    required this.shape,
    required this.careat,
    required this.lab,
    required this.colorcode,
    required this.clarity,
    required this.cartifactNo,
  });

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.diamondDetail, cart: true),
      bottomNavigationBar: buttonNavigation(
        child: button('Add To Cart', isLowercase: true),
      ),
      child: Obx(() {
        return Column(
          children: [
            //Hadder
            diamondDetailHadder(
              shape: shape,
              careat: careat,
              lab: lab,
              colorcode: colorcode,
              clarity: clarity,
              cartifactNo: cartifactNo,
            ),

            //Image & Video Button
            selectButton(diamonddetail),

            //Image & Video
            imageAndVideo(
              diamonddetail: diamonddetail,
              video: Video(videoUrl: AppVideo.addVideo),
              image: AppImage.pandant1
            )
          ],
        );
      }),
    );
  }
}
