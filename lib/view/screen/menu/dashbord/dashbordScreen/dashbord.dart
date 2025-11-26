// ignore_for_file: non_constant_identifier_names

import 'package:classic/controller/user_Interface/menu/dashboard/dashboard_Controller.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/dashboardWidget.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/diamondSection.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/header/appbar.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashbord extends StatelessWidget {
  final dashboard_UI = Get.put(DashboardUIController());
  Dashbord({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: appBarDashboard(
        prefixOnTap: () {},
        suffixOnTap: () {},
        prefixIcon: AppIcon.newcart,
        suffixIcon: AppIcon.drawer,
        hedding: AppString.dashboard,
      ),
      child: Obx(() {
        return Column(
          children: [
            SizedBox(height: Get.height * 0.02),

            // TOP TABS
            indexButtons(
              isSelectDiamond: dashboard_UI.isSelectDiamond,
              isSelectJewellwery: dashboard_UI.isSelectJewellwery,
              onTapDiamond: () => dashboard_UI.selectTab(0),
              onTapJewellwery: () => dashboard_UI.selectTab(1),
            ),

            SizedBox(height: Get.height * 0.02),

            // CONTENT BASED ON INDEX
            if (dashboard_UI.selectedIndex.value == 0)
              Column(
                children: [
                  // Information Container Start
                  diamondSection(
                    informationContainerDiamondText: AppString.diamond,
                    informationContainerDiamondValue: '14974',
                    informationContainerOrderText: AppString.Orders,
                    informationContainerOrderValue: '46',
                    informationContainerHoldText: AppString.Hold,
                    informationContainerHoldValue: '2',
                  ),

                  // Information Container End
                  selectIndexText(
                    onTapRecentViwe: () => dashboard_UI.selectText(0),
                    onTapMyCartViwe: () => dashboard_UI.selectText(1),
                    isrecentViwe: dashboard_UI.recentViwe,
                    isMyCartViwe: dashboard_UI.myCart,
                  ),
                ],
              ),

              if(dashboard_UI.selectedTab.value == 0)
                Container(
                  width: Get.width,
                  height: Get.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                )
                else if(dashboard_UI.selectedTab.value == 1)
                Container(
                  width: Get.width,
                  height: Get.height * 0.02,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                )

            else
              Container(
                width: Get.width,
                height: Get.height * 0.1,
                color: AppColor.red,
              ),
          ],
        );
      }),
    );
  }
}
