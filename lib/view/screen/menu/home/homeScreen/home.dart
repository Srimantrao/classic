// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_import

import 'package:classic/controller/application_Programing_interface/apiController/menu/home/filterSlider_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/home/homeCollctionAPIController.dart';
import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
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
  final homeAPI = Get.put(HomeAPICall());
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
          SliverToBoxAdapter(
            child: Obx(() {
              final data = homeAPI.filterSilderAPI.filterSliderData['data'];

              if (data == null || data.isEmpty){
                return const SizedBox();
              }

              final image = data[0]['mobileImage'];
              return (image != null && image.isNotEmpty)
                  ? sliderImages(image)
                  : SizedBox();
            }),
          ),

          SliverToBoxAdapter(
            child: Obx(() {
              final response = homeAPI.homeCollectionAPI.homeCollectionData;
              final data = response?['data'];

              if (data == null || data.isEmpty) {
                return const SizedBox.shrink();
              }

              final selectedIndex = homeUI.index.value;

              if (selectedIndex < 0 || selectedIndex >= data.length) {
                return const SizedBox.shrink();
              }

              final selectedCategory = data[selectedIndex];

              final collections = selectedCategory['collection'];
              if (collections == null || collections.isEmpty) {
                return const SizedBox.shrink();
              }

              return ourCollection(
                collections,
                selectedIndex,
                data,
                homeUI,
              );
            }),
          ),

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
