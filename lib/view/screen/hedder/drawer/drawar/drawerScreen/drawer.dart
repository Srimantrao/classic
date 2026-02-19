import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/hedder/drawer/drawers_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerExtraWidget/drawerExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerWidget/body/drawarBody.dart';
import 'package:classic/view/screen/hedder/drawer/findStore/findStoreScreen/findStore.dart';
import 'package:classic/view/screen/hedder/drawer/myAccount/myAccount/myAccountScreen/myAccount.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drawers extends StatelessWidget {
  final drawerUI = Get.put(DrawersUIController());
  final jewelryUI = Get.put(JewelleryAPICall());
  final cartAPICallAPI = Get.put(CartAPICall());
  Drawers({super.key});
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageDrawer(),
                Divider(color: AppColor.gray),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.015),
                ),
                //Myaccount
                iconDrawer(
                  onTap: () => Get.to(() => Myaccount()),
                  text: AppString.myAccount,
                  icon: AppIcon.user1,
                ),
                //Engagement
                iconDrawer(
                  text: AppString.enagagement,
                  icon: AppIcon.weddingRing,
                  dot: true,
                ),
                //Wedding bands
                iconDrawer(
                  text: AppString.weddingbands,
                  icon: AppIcon.weddingRing,
                  dot: true,
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
                  text: AppString.diamond,
                  icon: AppIcon.diamond,
                  dot: true,
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
                //logout
                iconDrawer(text: AppString.logout, icon: AppIcon.logout),
              ],
            );
          },
        ),
      ),
    );
  }
}
