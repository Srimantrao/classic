// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:classic/controller/user_Interface/menu/dashboard/dashboard_Controller.dart';
import 'package:classic/modal/menu/dashbord/listViwe.dart';
import 'package:classic/view/screen/hedder/cart/cartScreen/cart.dart';
import 'package:classic/view/screen/hedder/drawer/drawerScreen/drawer.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/dashboardWidget.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/diamondSection.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/header/appbar.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/widget/cartList.dart';

class Dashbord extends StatelessWidget {
  final dashboard_UI = Get.put(DashboardUIController());
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

            // MAIN CONTENT
            if (dashboard_UI.selectedIndex.value == 0) ...[
              // Diamond Section
              Column(
                children: [
                  diamondSection(
                    informationContainerDiamondText: AppString.diamond,
                    informationContainerDiamondValue: '14974',
                    informationContainerOrderText: AppString.Orders,
                    informationContainerOrderValue: '46',
                    informationContainerHoldText: AppString.Hold,
                    informationContainerHoldValue: '2',
                  ),

                  selectIndexText(
                    onTapRecentViwe: () => dashboard_UI.selectText(0),
                    onTapMyCartViwe: () => dashboard_UI.selectText(1),
                    isrecentViwe: dashboard_UI.recentViwe,
                    isMyCartViwe: dashboard_UI.myCart,
                  ),
                ],
              ),

              // Sub-Tab Content (Recent / My Cart)
              if (dashboard_UI.selectedTab.value == 0)
                valueList(valueList: value.valueList)
              else if (dashboard_UI.selectedTab.value == 1)
                valueList(valueList: value.mycartList),
            ]
            // Jewelry Section
            else if (dashboard_UI.selectedIndex.value == 1) ...[
              Column(
                children: [
                  diamondSection(
                    informationContainerDiamondText: AppString.diamond,
                    informationContainerDiamondValue: '14974',
                    informationContainerOrderText: AppString.Orders,
                    informationContainerOrderValue: '46',
                    informationContainerHoldText: '',
                    informationContainerHoldValue: '',
                  ),

                  selectIndexText(
                    onTapRecentViwe: () => dashboard_UI.selectText(0),
                    onTapMyCartViwe: () => dashboard_UI.selectText(1),
                    isrecentViwe: dashboard_UI.recentViwe,
                    isMyCartViwe: dashboard_UI.myCart,
                  ),
                ],
              ),
              // Sub-Tab Content (Recent / My Cart)
              if (dashboard_UI.selectedTab.value == 0)
                jewelryListViwe(jewelryList: value.jewellweryListProduct)
              else if (dashboard_UI.selectedTab.value == 1)
                jewelryListViwe(jewelryList: value.jewellweryListMyCartProduct),
            ],
          ],
        );
      }),
    );
  }
}
