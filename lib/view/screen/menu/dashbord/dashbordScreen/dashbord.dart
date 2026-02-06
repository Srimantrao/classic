// ignore_for_file: non_constant_identifier_names, unused_import, unused_local_variable, unnecessary_null_comparison, dead_code, strict_top_level_inference

import 'package:classic/controller/application_Programing_interface/apiController/menu/dashbord/totalRecored_Controller.dart';
import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/menu/dashboard/dashboard_Controller.dart';
import 'package:classic/modal/menu/dashbord/listViwe.dart';
import 'package:classic/view/screen/hedder/cart/cartScreen/cart.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/drawer.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/dashboardWidget.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/diamondSection.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/header/appbar.dart';
import 'package:classic/view/screen/menu/dashbord/dashbordExtraWidget/dashbordExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import '../../../../utils/widget/cartList.dart';
import '../../../../utils/widget/image/productImage.dart';
import '../../../../utils/widget/image/productVideo.dart';
import '../../diamondSearch/diamondWidget/body/searchResultWidget.dart';

class Dashbord extends StatelessWidget {
  final dashbord_UI = Get.put(DashboardUIController());
  final dashbord_API = Get.put(DashBordAPICall());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final value = Listviwe();
  Dashbord({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      scaffoldKey: scaffoldKey,
      endDrawer: Drawers(),
      appBar: appBarDashboard(
        prefixOnTap: () => Get.to(() => Cart()),
        suffixOnTap: () => scaffoldKey.currentState?.openEndDrawer(),
        prefixIcon: AppIcon.newcart,
        suffixIcon: AppIcon.drawer,
        hedding: AppString.dashboard,
      ),
      child: Obx(() {
        final totalRecored = dashbord_API.totalRecored;
        final totalRecordData = totalRecored.totalRecordData['data'];

        if (totalRecordData == null) {
          return Center(child: Lottie.asset(AppJson.noData));
        }

        final diamondCounts = totalRecordData['diamondCount'];
        final diamondOrderCounts = totalRecordData['diamondOrderCount'];
        final diamondHoldCounts = totalRecordData['diamondHoldCount'];
        final jewelleryCounts = totalRecordData['jewelleryCount'];
        final jewelleryCartCounts = totalRecordData['jewelleryCartCount'];
        final jewelleryOrdercounts = totalRecordData['jewelleryOrdercount'];

        //totalRecordData Start
        //Diamonds start
        final diamondCount = diamondCounts?.toString() ?? '0';
        final diamondOderCount = diamondOrderCounts?.toString() ?? '0';
        final diamondHoldCount = diamondHoldCounts?.toString() ?? '0';
        //Diamods End

        //Jewellwery start
        final jewelryList = jewelleryCounts?.toString() ?? '0';
        final jewelleryCartCount = jewelleryCartCounts?.toString() ?? '0';
        final jewelleryOrdercount = jewelleryOrdercounts?.toString() ?? '0';
        //Jwellwery End
        //totalRecordData End

        return Column(
          children: [
            SizedBox(height: Get.height * 0.02),

            // TOP TABS
            indexButtons(
              isSelectDiamond: dashbord_UI.isSelectDiamond,
              isSelectJewellwery: dashbord_UI.isSelectJewellwery,
              onTapDiamond: () => dashbord_UI.selectTab(0),
              onTapJewellwery: () => dashbord_UI.selectTab(1),
            ),

            SizedBox(height: Get.height * 0.02),

            // MAIN CONTENT
            if (dashbord_UI.selectedIndex.value == 0) ...[
              // Diamond Section
              Column(
                children: [
                  diamondSection(
                    isDiamond: true,
                    informationContainerDiamondText: AppString.diamond,
                    informationContainerDiamondValue: diamondCount,
                    informationContainerOrderText: AppString.Orders,
                    informationContainerOrderValue: diamondOderCount,
                    informationContainerHoldText: AppString.Hold,
                    informationContainerHoldValue: diamondHoldCount,
                  ),

                  selectIndexText(
                    onTapRecentViwe: () => dashbord_UI.selectText(0),
                    onTapMyCartViwe: () => dashbord_UI.selectText(1),
                    isrecentViwe: dashbord_UI.recentViwe,
                    isMyCartViwe: dashbord_UI.myCart,
                  ),
                ],
              ),

              // Sub-Tab Content (Recent / My Cart)
              if (dashbord_UI.selectedTab.value == 0)
                recentviwe(dashbord_API)
              else if (dashbord_UI.selectedTab.value == 1)
                dashbordValueList(
                  list: valueList(
                    valueList: value.mycartList,
                    video: true,
                    camara: true,
                    isCart: true,
                    isWishlist: true,
                  ),
                ),
            ]
            // Jewelry Section
            else if (dashbord_UI.selectedIndex.value == 1) ...[
              Column(
                children: [
                  diamondSection(
                    isDiamond: false,
                    informationContainerDiamondText: AppString.diamond,
                    informationContainerDiamondValue: jewelryList,
                    informationContainerOrderText: AppString.Orders,
                    informationContainerOrderValue: jewelleryOrdercount,
                    informationContainerHoldText: '',
                    informationContainerHoldValue: '',
                  ),

                  selectIndexText(
                    onTapRecentViwe: () => dashbord_UI.selectText(0),
                    onTapMyCartViwe: () => dashbord_UI.selectText(1),
                    isrecentViwe: dashbord_UI.recentViwe,
                    isMyCartViwe: dashbord_UI.myCart,
                  ),
                ],
              ),

              // Sub-Tab Content (Recent / My Cart)
              if (dashbord_UI.selectedTab.value == 0)
                dashbordValueList(
                  list: jewelryListViwe(
                    jewelryList: value.jewellweryListProduct,
                  ),
                )
              else if (dashbord_UI.selectedTab.value == 1)
                dashbordValueList(
                  list: jewelryListViwe(
                    jewelryList: value.jewellweryListMyCartProduct,
                  ),
                ),
            ],
          ],
        );
      }),
    );
  }
}

Widget recentviwe(dashbord_API) {
  return Expanded(
    child: Builder(
      builder: (_) {
        final recentView = dashbord_API.recentView.recentViewData;
        if (recentView == null) {
          return const SizedBox();
        }
        final dataList = recentView['data'] as List?;
        if (dataList == null || dataList.isEmpty) {
          return const SizedBox();
        }
        final diamondList = dataList.first?['diamondList'] as List?;
        if (diamondList == null || diamondList.isEmpty) {
          return const SizedBox();
        }
        final adToCart = Get.put(CreateCartController());
        return ListView.builder(
          itemCount: diamondList.length,
          itemBuilder: (_, index) {
            final diamond = diamondList[index] as Map?;
            final details = diamond?['diamondDetails'] as Map? ?? {};
            return listDiamond(
              cartifactIcon:
                  (diamond?['certno'] == null || diamond?['certno'] == '-')
                  ? AppIcon.documant
                  : AppIcon.edit,
              isWishlist: true,
              video: true,
              camara: true,
              isCart: true,
              ids: diamond?['diamondId']?.toString() ?? '',
              images: details['imageurl1']?.toString() ?? '',
              videos: '',
              shape: details['shape']?.toString() ?? '',
              careat: details['carat']?.toString() ?? '',
              lab: details['lab']?.toString() ?? '',
              colorcode: details['color']?.toString() ?? '',
              clarity: details['clarity']?.toString() ?? '',
              cartifactNo:
                  (details['certno'] == null || details['certno'] == '-')
                  ? ''
                  : details['certno'].toString(),
              cps: '',
              meas: details['measurement']?.toString() ?? '',
              refNo: details['stockId']?.toString() ?? '',
              T: details['tablepercent']?.toString() ?? '',
              D: details['depth']?.toString() ?? '',
              loc: details['county']?.toString() ?? '',
              ct: '',
              total: details['finalamount'] != null
                  ? (details['finalamount'] as num).toDouble().toStringAsFixed(
                      2,
                    )
                  : '0.00',
              cartOnTap: () {
                adToCart.createCart(
                  price: details['finalamount']?.toString() ?? '',
                  productId: details['_id']?.toString() ?? '',
                  DiamondId: details['dimCountryId']?.toString() ?? '',
                );
              },
              camaraOnTap: () {
                final String? image = details['imageurl1']?.toString();
                if (image == null || image.isEmpty) {
                  if (kDebugMode) {
                    print("No Image");
                  }
                  return;
                }
                Get.to(() => ProductImage(images: image));
              },
              videoOnTap: () {
                final String? video = details['videourl']?.toString();
                if (video == null || video.isEmpty) {
                  if (kDebugMode) {
                    print("No Video");
                  }
                  return;
                } else {
                  Get.to(() => ProductVideo(videoUrl: video));
                }
              },
            );
          },
        );
      },
    ),
  );
}
