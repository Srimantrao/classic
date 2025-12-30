// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_import

import 'package:classic/controller/application_Programing_interface/apiController/menu/home/filterSlider_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/home/homeCollctionAPIController.dart';
import 'package:classic/controller/user_Interface/menu/home/home_Controller.dart';
import 'package:classic/modal/menu/home/our_collection.dart';
import 'package:classic/view/screen/hedder/cart/cartScreen/cart.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/drawer.dart';
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

import '../homeExtraWidget/homeconnectingWideget.dart';

class Home extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final homeUI = Get.put(HomeUIController());
  final filterSilderAPI = Get.put(FilterSliderController());
  final homeCollectionAPI = Get.put(HomeCollctionapiController());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      scaffoldKey: scaffoldKey,
      endDrawer: Drawers(),
      appBar: appBar(
        newcartOntap: () => Get.to(() => Cart()),
        drawerOntap: () => scaffoldKey.currentState?.openEndDrawer(),
      ),
      child: CustomScrollView(
        slivers: [

          /// Slider
          SliverToBoxAdapter(
            child: Obx(() {
              final data = filterSilderAPI.filterSliderData['data'];
              if (data == null || data.isEmpty) return const SizedBox();
              final image = data[0]['mobileImage'];
              return (image != null && image.isNotEmpty)
                  ? sliderImages(image)
                  : const SizedBox();
            }),
          ),


          SliverToBoxAdapter(child: SizedBox(height: Get.height * 0.03)),
          /// Horizontal Collection (NO fixed height, NO Expanded)
          SliverToBoxAdapter(
            child: Obx(() {
              final data = homeCollectionAPI.homeCollectionData['data'];
              if (data == null || data.isEmpty) return const SizedBox();

              return Column(
                children: [
                  homeScreenHeddingText(AppString.ouerCollection),
                  homeScreenSubheddingText(AppString.chekout),
                  SizedBox(height: Get.height * 0.01),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: List.generate(data.length, (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.050,
                              ),
                              child: Text(
                                data[index]['categoryName'],
                              ),
                            );
                          }),
                        ),
                        Text('222'),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),

          /// Rest widgets
          SliverToBoxAdapter(child: SizedBox(height: Get.height * 0.03)),
          SliverToBoxAdapter(child: adVideo()),
          SliverToBoxAdapter(child: adImage()),
          SliverToBoxAdapter(child: whatClassic()),
          SliverToBoxAdapter(child: emailContainer()),
          SliverToBoxAdapter(child: fotter()),
        ],
      ),
    );
  }
}
