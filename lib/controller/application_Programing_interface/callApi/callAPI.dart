// ignore_for_file: must_call_super, file_names, unused_import, avoid_print

import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/fitterWish/fitterWish_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/orderHistory/orderHistory_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/totalRecored_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/home/filterSlider_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/home/homeCollctionAPIController.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/catagory/category_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList/filter/filter_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList/filter/getAllParameter_Controller.dart';
import 'package:classic/view/utils/app_Constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../apiController/hedder/cart/cart_Controller.dart';
import '../apiController/hedder/drawer/myAccount/profile/profileDetail_Controller.dart';
import '../apiController/hedder/drawer/showList_Controller.dart';
import '../apiController/menu/dashbord/recentView_Controller.dart';

//hedder
//cart
class CartAPICall extends GetxController {
  final cartAPI = Get.put(CartController());
  final show = Get.put(ShowListController());
  final profileDetail = Get.put(ProfileDetailController());
  final orderHistory = Get.put(OrderHistoryController());
  final fitterWish = Get.put(FitterWishController());

  @override
  void onInit() {
    if (isLogin == true) {
      Future.microtask(() {
        cartAPI.filterCart();
        show.showListView();
        profileDetail.profileDetail();
        orderHistory.oderHistory();
        fitterWish.fitterWishList();
      });
    } else {
      print('No Login in Hedder');
    }
  }
}

//home Screen
class HomeAPICall extends GetxController {
  final filterSilderAPI = Get.put(FilterSliderController());
  final homeCollectionAPI = Get.put(HomeCollctionapiController());

  @override
  void onInit() {
    if (isLogin == true) {
      Future.microtask(() {
        filterSilderAPI.filterSlider();
        homeCollectionAPI.homeCollectionApi();
      });
    } else {
      print('No Login in HomeAPI');
    }
  }
}

//jewelry Screen
class JewelleryAPICall extends GetxController {
  final categoryAPI = Get.put(CategoryController());
  final filter = Get.put(FilterController());
  final getAllParameter = Get.put(GetallparameterController());

  @override
  void onInit() {
    if (isLogin == true) {
      Future.microtask(() {
        categoryAPI.getCategory();
        filter.filterAPI();
        getAllParameter.getAllParameterAPI();
      });
    } else {
      print('No Login in JwelleryAPI');
    }
  }
}

//dashbord Screen
class DashBordAPICall extends GetxController {
  final totalRecored = Get.put(TotalRecordedController());
  final recentView = Get.put(RecentViewController());

  @override
  void onInit() {
    if (isLogin == true) {
      Future.microtask(() {
        totalRecored.totalRecord();
        recentView.recentViewdata();
      });
    } else {
      print('No Login in DashbordAPI');
    }
  }
}
