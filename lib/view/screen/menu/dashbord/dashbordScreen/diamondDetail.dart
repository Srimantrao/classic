// ignore_for_file: file_names

import 'package:classic/controller/user_Interface/menu/dashboard/diamondDetail_Controller.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/diamondDetail.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/header/diamondDetail.dart';
import 'package:classic/view/utils/app_Color.dart';
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
        child: button(
          AppString.addtoCart,
          isLowercase: true,
          bottomBottonFontSize: true,
        ),
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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Image & Video Button
                    selectButton(diamonddetail),

                    //Image & Video
                    imageAndVideo(
                      diamonddetail: diamonddetail,
                      video: Video(videoUrl: AppVideo.addVideo),
                      image: AppImage.pandant1,
                    ),

                    SizedBox(height: Get.height * 0.03),
                    Divider(color: AppColor.secondary, thickness: 3),
                    SizedBox(height: Get.height * 0.03),

                    //Select Detail Button
                    selectedDetails(diamonddetail),
                    SizedBox(height: Get.height * 0.03),

                    //Show Detail
                    (diamonddetail.isSelectDetails.value)
                        ? showDetail(
                            carat: '0.30',
                            cut: 'EX',
                            shape: 'Round',
                            lab: 'IGI',
                            colorCode: 'D',
                            clarity: 'IF',
                            fluorescence: 'NONE',
                            polish: 'EX',
                            symmetry: 'EX',
                            location: '',
                          )
                        : SizedBox(),

                    //Show Measurements
                    (diamonddetail.isSelectMeasurements.value)
                        ? showMeasurements(
                            measure: '4.33 X 4.35 X 2.63',
                            table: '58 %',
                            crheight: '',
                            crandwidth: '',
                            depth: '60.6 %',
                            pavAngle: '',
                            girdle: 'Medium To Slightly Thick',
                          )
                        : SizedBox(),

                    //Show Inclusion
                    (diamonddetail.isSelectInclusion.value)
                        ? showInclusion(
                            brown: 'YES',
                            openT: '',
                            blaclkT: 'YES',
                            tableInc: 'YES',
                            DTLEligble: 'YES',
                            culetSize: 'YES',
                            openc: '',
                            blaclkS: 'YES',
                            openp: '',
                            openg: '',
                            laser: '',
                            hnA: '',
                            openG: '',
                            openP: '',
                            openC: '',
                          )
                        : SizedBox(),

                    SizedBox(height: Get.height * 0.03),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
