// ignore_for_file: must_call_super, file_names, unused_import, avoid_print

import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/address/getAddress_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/customProduct/customProduct_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/fitterWish/fitterWish_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/holdDiamond/holdDiamond_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/orderHistory/orderHistory_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/cardRecord_Controller.dart';
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
  final getholdDiamond = Get.put(HoldDiamondController());
  final customProduct = Get.put(CustomProductController());
  final getAddress = Get.put(GetAddressController());

  @override
  Future<void> onInit() async {
    super.onInit();

    if (isLogin == true) {
      await Future.wait([
        cartAPI.filterCart(),
        show.showListView(),
        profileDetail.profileDetail(),
        orderHistory.oderHistory(),
        fitterWish.fitterWishList(),
        getholdDiamond.getHoldDimaond(),
        customProduct.getCustomProduct(),
        getAddress.getAddress(userID),
      ]);
    } else {
      print('No Login in Header');
    }
    await calculateCartCount(cartAPI);
  }
}

//home Screen
class HomeAPICall extends GetxController {
  final filterSilderAPI = Get.put(FilterSliderController());
  final homeCollectionAPI = Get.put(HomeCollctionapiController());

  @override
  Future<void> onInit() async {
    super.onInit();

    if (isLogin == true) {
      await Future.wait([
        filterSilderAPI.filterSlider(),
        homeCollectionAPI.homeCollectionApi(),
      ]);
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
  Future<void> onInit() async {
    super.onInit();

    if (isLogin == true) {
      await Future.wait([
        categoryAPI.getCategory(),
        filter.filterAPI(),
        getAllParameter.getAllParameterAPI(),
      ]);
    } else {
      print('No Login in JewelleryAPI');
    }
  }
}

//dashbord Screen
class DashBordAPICall extends GetxController {
  final totalRecored = Get.put(TotalRecordedController());
  final recentView = Get.put(RecentViewController());
  final cardRecord = Get.put(CardRecordController());

  @override
  Future<void> onInit() async {
    super.onInit();

    if (isLogin == true) {
      await Future.wait([
        totalRecored.totalRecord(),
        recentView.recentViewdata(),
        cardRecord.fetchCardRecords(isFirstLoad: true, type: 'Diamond'),
      ]);
    } else {
      print('No Login in DashboardAPI');
    }
  }
}

Future<void> calculateCartCount(cartAPI) async {
  await cartAPI.filterCart();
  final cartData = cartAPI.cartData;
  if (cartData.isEmpty) {
    cartItemCount.value = "0";
    return;
  }
  final dataList = cartData['data'];
  if (dataList == null || dataList.isEmpty) {
    cartItemCount.value = "0";
    return;
  }
  final cartProductList = dataList[0]['productLookup'] as List? ?? [];
  final diamondProductList = dataList[0]['diamondLookup'] as List? ?? [];
  cartItemCount.value = (cartProductList.length + diamondProductList.length).toString();
}
