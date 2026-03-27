// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors

import 'package:classic/controller/application_Programing_interface/apiController/hedder/cart/cart_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/customProduct/customProduct_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/fitterWish/fitterWish_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/holdDiamond/holdDiamond_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/orderHistory/orderHistory_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/profile/profileDetail_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/showList_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/recentView_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/totalRecored_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/home/filterSlider_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/home/homeCollctionAPIController.dart';
import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/menu/home/home_Controller.dart';
import 'package:classic/modal/menu/home/our_collection.dart';
import 'package:classic/view/screen/hedder/cart/cartScreen/cart.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/drawer.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/wishlist/wishlistScreen/wishlistScreen.dart';
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
import '../../jewelry/jewelryScreen/product.dart';
import '../homeExtraWidget/homeconnectingWideget.dart';

class Home extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final homeUI = Get.put(HomeUIController());
  final homeAPI = Get.put(HomeAPICall());
  final cartAPICallAPI = Get.put(CartAPICall());
  final dashbord_API = Get.put(DashBordAPICall());
  final jewellry = Get.put(JewelleryAPICall());
  static bool apiCalled = false;
  @override
  Widget build(BuildContext context) {
    calculateCartCount(cartAPICallAPI.cartAPI);
    calculateWishCount(cartAPICallAPI.fitterWish);
    if (!apiCalled) {
      apiCalled = true;
      Future.wait([
        homeAPI.onInit(),
        cartAPICallAPI.onInit(),
        dashbord_API.onInit(),
        jewellry.onInit(),
      ]);
    }
    return Fullscreen(
      scaffoldKey: scaffoldKey,
      endDrawer: Drawers(),
      appBar: appBar(
        newcartOntap: () => Get.to(() => Cart()),
        wishlistOntap: () => Get.to(() => Wishlist()),
        drawerOntap: () => scaffoldKey.currentState?.openEndDrawer(),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Obx(() {
              final api = homeAPI.filterSilderAPI;
              final apidata = api.filterSliderData['data'];
              final data = apidata;
              if (data == null || data.isEmpty) {
                return const SizedBox();
              }
              final image = data[0]['mobileImage'];
              return (image != null && image.isNotEmpty)
                  ? sliderImages(image)
                  : SizedBox();
            }),
          ),
          SliverToBoxAdapter(child: collectonList(homeAPI, homeUI)),
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
