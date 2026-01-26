// ignore_for_file: must_call_super, file_names, unused_import

import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/totalRecored_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/home/filterSlider_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/home/homeCollctionAPIController.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/catagory/category_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList/filter/filter_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList/filter/getAllParameter_Controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../apiController/hedder/cart/cart_Controller.dart';

//hedder
//cart
class CartAPICall extends GetxController {
  final cartAPI = Get.put(CartController());

  @override
  void onInit() {
    Future.microtask(() {
      cartAPI.filterCart();
    });
  }
}

//home Screen
class HomeAPICall extends GetxController {
  final filterSilderAPI = Get.put(FilterSliderController());
  final homeCollectionAPI = Get.put(HomeCollctionapiController());

  @override
  void onInit() {
    Future.microtask(() {
      filterSilderAPI.filterSlider();
      homeCollectionAPI.homeCollectionApi();
    });
  }
}

//jewelry Screen
class JewelleryAPICall extends GetxController {
  final categoryAPI = Get.put(CategoryController());
  final filter = Get.put(FilterController());
  final getAllParameter = Get.put(GetallparameterController());

  @override
  void onInit() {
    Future.microtask(() {
      categoryAPI.getCategory();
      filter.filterAPI();
      getAllParameter.getAllParameterAPI();
    });
  }
}

class DashBordAPICall extends GetxController{
  final totalRecored = Get.put(TotalRecordedController());

  @override
  void onInit() {
    Future.microtask(() {
      totalRecored.totalRecord();
    });
  }
}
