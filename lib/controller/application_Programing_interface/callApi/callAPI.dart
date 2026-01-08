// ignore_for_file: must_call_super, file_names, unused_import

import 'package:classic/controller/application_Programing_interface/apiController/menu/home/filterSlider_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/home/homeCollctionAPIController.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/category_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/filter_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/getAllParameter_Controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
