// ignore_for_file: use_key_in_widget_constructors

import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/hedder/drawer/drawers_Controller.dart';
import 'package:classic/controller/user_Interface/menu/jewelry/filter_Controller.dart';
import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
import 'package:classic/controller/user_Interface/widget/logOut/logOut_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerExtraWidget/drawerExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/findStore/findStoreScreen/findStore.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/myAccount/myAccountScreen/myAccount.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerWidget/body/drawarBody.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

//Drawers
class Drawers extends StatelessWidget {
  final drawerUI = Get.put(DrawersUIController());
  final jewelryUI = Get.put(JewelleryAPICall());
  final cartAPICallAPI = Get.put(CartAPICall());
  final bottomController = Get.put(BottombarController());
  final logOutUI = Get.put(LogoutController());
  final filter = Get.put(FilterUIController());
  @override
  Widget build(BuildContext context) {
    return allDrawersBody(
      child: SingleChildScrollView(
        child: GetBuilder<DrawersUIController>(
          builder: (DrawersUIController controller) {
            final jewelryAPI = jewelryUI;
            final showListApi = cartAPICallAPI.show;
            final jewelryData = jewelryAPI.categoryAPI.catagoryData;
            final parameter = jewelryAPI.getAllParameter;
            final shopByMetalListData = parameter.getAllParameterData;
            final jewelry = jewelryData['data'];
            final shopByMetalList = shopByMetalListData['metalType'];
            final showList = showListApi.showListData['data'];
            final shapList = parameter.getAllParameterData['shape'];
            if (jewelryData.isEmpty) {
              return Lottie.asset(AppJson.noData);
            }
            if (shopByMetalListData.isEmpty) {
              return Lottie.asset(AppJson.noData);
            }
            if (parameter.getAllParameterData.isEmpty) {
              return Lottie.asset(AppJson.noData);
            }
            if (showListApi.showListData.isEmpty) {
              return Lottie.asset(AppJson.noData);
            }
            if (parameter.getAllParameterData.isEmpty) {
              return Lottie.asset(AppJson.noData);
            }
            if (jewelryData['data'].isEmpty) {
              return Lottie.asset(AppJson.noData);
            }
            if (shopByMetalListData['metalType'].isEmpty) {
              return Lottie.asset(AppJson.noData);
            }
            if (showListApi.showListData['data'].isEmpty) {
              return Lottie.asset(AppJson.noData);
            }
            if (parameter.getAllParameterData['shape'].isEmpty) {
              return Lottie.asset(AppJson.noData);
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageDrawer(() => bottomController.isDrawerOpen.value = false),
                Divider(color: AppColor.gray),
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    bottom: Get.height * 0.015,
                  ),
                ),
                //Engagement Rings
                iconDrawer(
                  onTap: drawerUI.showEngagement,
                  text: AppString.enagagement,
                  icon: AppIcon.weddingRing,
                  dot: true,
                ),
                //Engagement Rings List
                Visibility(
                  visible: drawerUI.engagement.value,
                  child: engagementRingsList(),
                ),
                //Wedding bands
                iconDrawer(
                  onTap: drawerUI.showWeddingbands,
                  text: AppString.weddingbands,
                  icon: AppIcon.weddingRing,
                  dot: true,
                ),
                //Wedding bands List
                Visibility(
                  visible: drawerUI.weddingbands.value,
                  child: weddingBandsList(),
                ),
                //jewellwery
                iconDrawer(
                  onTap: drawerUI.showJewellery,
                  text: AppString.jewelry,
                  icon: AppIcon.jewelry,
                  dot: true,
                ),
                //Jewellery List
                Visibility(
                  visible: drawerUI.jewellery.value,
                  child: jewelryList(list: jewelry),
                ),
                //Diamond
                iconDrawer(
                  onTap: drawerUI.showDiamonds,
                  text: AppString.diamond,
                  icon: AppIcon.diamond,
                  dot: true,
                ),
                //Diamond List
                Visibility(
                  visible: drawerUI.diamonds.value,
                  child: Column(
                    children: [
                      listColltion(
                        onTap: drawerUI.showShape,
                        datalist: AppString.naturalDiamond,
                      ),
                      Visibility(
                        visible: drawerUI.shape.value,
                        child: Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.040),
                          child: diamondList(list: shapList),
                        ),
                      ),
                      listColltion(
                        datalist: AppString.coloredDiamond,
                        onTap: drawerUI.showShape2,
                      ),
                      Visibility(
                        visible: drawerUI.shape2.value,
                        child: Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.040),
                          child: diamondList(list: shapList),
                        ),
                      ),
                    ],
                  ),
                ),
                //Custom
                iconDrawer(
                  text: AppString.custom,
                  icon: AppIcon.jewelry,
                  onTap: () {
                    bottomController.isDrawerOpen.value = false;
                    bottomController.selectindex.value = 4;
                    bottomController.changePage(4);
                  },
                ),
                //Metaphysical
                iconDrawer(
                  onTap: drawerUI.showShopByMetal,
                  text: AppString.shopbymetal,
                  icon: AppIcon.jewelry,
                  dot: true,
                ),
                //Metaphysical List
                Visibility(
                  visible: drawerUI.shopByMetal.value,
                  child: shopByMetal(list: shopByMetalList),
                ),
                //Show
                iconDrawer(
                  text: AppString.show,
                  icon: AppIcon.hold,
                  dot: true,
                  onTap: drawerUI.showShow,
                ),
                //Show List
                Visibility(
                  visible: drawerUI.show.value,
                  child: showListValue(list: showList),
                ),
                //Find Store
                iconDrawer(
                  text: AppString.findstore,
                  icon: AppIcon.findstore1,
                  onTap: () => Get.to(() => Findstore()),
                ),
                //Dashbord
                iconDrawer(
                  text: AppString.dashboard,
                  icon: AppIcon.user1,
                  onTap: () {
                    bottomController.isDrawerOpen.value = false;
                    bottomController.selectindex.value = 2;
                    bottomController.changePage(2);
                  },
                ),
                //Myaccount
                iconDrawer(
                  onTap: () => Get.to(() => Myaccount()),
                  text: AppString.myAccount,
                  icon: AppIcon.user1,
                ),
                //logout
                iconDrawer(
                  text: AppString.logout,
                  icon: AppIcon.logout,
                  onTap: logOutUI.logout,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
