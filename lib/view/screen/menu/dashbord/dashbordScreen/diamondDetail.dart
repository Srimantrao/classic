// ignore_for_file: file_names, avoid_print

import 'package:classic/controller/user_Interface/menu/dashboard/diamondDetail_Controller.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/diamondDetail.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/header/diamondDetail.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../controller/application_Programing_interface/apiController/menu/diamondSearch/diamondShow_Controller.dart';
import '../../../../../controller/application_Programing_interface/callApi/callAPI.dart';
import '../../../../utils/app_cricularProgrssIndicator.dart';
import '../../../../utils/app_json.dart';
import '../../../../utils/widget/bottomNavigationButton.dart';
import '../../../../utils/widget/image/productVideo.dart';
import '../dashbordExtraWidget/diamondDetailExtraWidget.dart';

class DiamondDetail extends StatelessWidget {
  final diamondShow = Get.put(DiamondShowController());
  final diamondDetail = Get.put(DiamondDetailUIController());
  final cartAPICallAPI = Get.put(CartAPICall());
  final String id;
  final String? image;
  final String? video;
  DiamondDetail({super.key, required this.id, required this.image, this.video});
  @override
  Widget build(BuildContext context) {
    diamondShow.diamondShowData(id);
    print("ID: $id");
    print("Image URL: $image");
    print("Video URL: $video");
    return Fullscreen(
      appBar: allOtherScreen(AppString.diamondDetail, cart: true),
      bottomNavigationBar: Obx(() {
        final api = diamondShow;
        if (api.isLoading.value) {
          return SizedBox();
        }
        final diamond = api.diamondSearchData;
        if (diamond['data'] == null || (diamond['data'] as List).isEmpty) {
          return SizedBox();
        }
        return buttonNavigation(
          child: button(
            loadingWait: (diamondDetail.adToCart.isLoading.value)
                ? customCircular()
                : null,
            AppString.addtoCart,
            onTap: () {
              diamondDetail.addToCart();
              cartAPICallAPI.cartAPI.filterCart();
            },
            isLowercase: true,
            bottomBottonFontSize: true,
          ),
        );
      }),
      child: Obx(() {
        final api = diamondShow;
        if (api.isLoading.value) {
          return shirmmer();
        }
        final diamond = api.diamondSearchData;
        if (diamond['data'] == null || (diamond['data'] as List).isEmpty) {
          return Center(child: Lottie.asset(AppJson.noData));
        }
        final diamondData = diamond['data'][0];
        if (diamondData == null) {
          return Center(child: Lottie.asset(AppJson.noData));
        }
        return Column(
          children: [
            //Hadder
            diamondDetailHadder(
              shape: diamondData['shape']?.toString() ?? '',
              careat: diamondData['carat']?.toString() ?? '',
              lab: diamondData['lab']?.toString() ?? '',
              colorcode: diamondData['countryCode']?.toString() ?? '',
              clarity: diamondData['clarity']?.toString() ?? '',
              cartifactNo:
              (diamondData['certno'] == null || diamondData['certno'] == '-')
                  ? ''
                  : diamondData['certno'].toString(),
              location: diamondData['country']?.toString() ?? '',
              PPC: diamondData['polish']?.toString() ?? '',
              total: diamondData['finalamount']?.toString() ?? '',
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Image & Video Button
                    selectButton(diamondDetail),

                    //Image & Video
                    imageAndVideo(
                      diamonddetail: diamondDetail,
                      video: videoLink(video),
                      image:
                          (image == null || image == 'null' || image!.isEmpty)
                          ? ''
                          : image!,
                    ),

                    angelPadding(),
                    Divider(color: AppColor.secondary, thickness: 3),
                    angelPadding(),

                    //Select Detail Button
                    selectedDetails(diamondDetail),
                    angelPadding(),

                    //Show Detail
                    (diamondDetail.isSelectDetails.value)
                        ? showDetail(
                            carat: diamondData['carat']?.toString() ?? '',
                            cut: diamondData['cut']?.toString() ?? '',
                            shape: diamondData['shape']?.toString() ?? '',
                            lab: diamondData['lab']?.toString() ?? '',
                            colorCode: diamondData['color']?.toString() ?? '',
                            clarity: diamondData['clarity']?.toString() ?? '',
                            fluorescence: diamondData['flo']?.toString() ?? '',
                            polish: diamondData['polish']?.toString() ?? '',
                            symmetry: diamondData['sym']?.toString() ?? '',
                            location: diamondData['country']?.toString() ?? '',
                          )
                        : SizedBox(),

                    //Show Measurements
                    (diamondDetail.isSelectMeasurements.value)
                        ? showMeasurements(
                            measure:
                                diamondData['measurement']?.toString() ?? '',
                            table: '${diamondData['tablepercent'] ?? ''} %',
                            crheight: '',
                            crandwidth: '',
                            depth: '${diamondData['depth'] ?? ''} %',
                            pavAngle: '',
                            girdle: diamondData['girdle']?.toString() ?? '',
                          )
                        : SizedBox(),

                    //Show Inclusion
                    (diamondDetail.isSelectInclusion.value)
                        ? showInclusion(
                            brown: diamondData['brown']?.toString() ?? '',
                            openT: '',
                            blaclkT: diamondData['black']?.toString() ?? '',
                            tableInc: '',
                            DTLEligble: '',
                            culetSize: '',
                            openc: '',
                            blaclkS: '',
                            openp: '',
                            openg: '',
                            laser: '',
                            hnA: '',
                            openG: '',
                            openP: '',
                            openC: '',
                          )
                        : SizedBox(),

                    angelPadding(),
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
