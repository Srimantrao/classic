// ignore_for_file: file_names

import 'package:classic/controller/user_Interface/menu/diamondSearch/diamondSearch_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/drawer.dart';
import 'package:classic/view/screen/menu/diamondSearch/diamondSearchExtraWidget/diamondExtraWidget.dart';
import 'package:classic/view/screen/menu/diamondSearch/diamondWidget/header/appbar.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../diamondWidget/body/diamondSearchWidget.dart';

class Diamondsearch extends StatelessWidget {
  final diamondSearch = Get.put(DiamondSearchUIController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final diamondList = DiamondList();

  Diamondsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      scaffoldKey: scaffoldKey,
      endDrawer: Drawers(),
      bottomNavigationBar: SizedBox(
        height: Get.height * 0.22,
        child: horizontalPadding(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.025),
              button(
                AppString.searchdiamond,
                onTap: () {},
                isLowercase: true,
                bottomBottonFontSize: true,
              ),
              SizedBox(height: Get.height * 0.025),
            ],
          ),
        ),
      ),
      appBar: appBarDiamond(
        prefixIcon: AppIcon.newcart,
        suffixIcon: AppIcon.drawer,
        hedding: AppString.diamondSearch,
        suffixOnTap: () => scaffoldKey.currentState?.openEndDrawer(),
      ),
      child: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.02),

              // TOP TABS
              indexButtons(
                isWhiteDimaond: diamondSearch.isWhite,
                isColoredDimaond: diamondSearch.isColored,
                onTapDiamond: () => diamondSearch.selectTab(0),
                onTapJewellwery: () => diamondSearch.selectTab(1),
              ),

              //Shape
              shapeViwe(diamondSearch, AppString.shape),

              //Carat
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.carat,
                contain: carat(diamondSearch, diamondList),
              ),

              //Clarity
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.clarity,
                contain: clarity(diamondSearch, diamondList),
              ),

              //White Color
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.whiteColor,
                contain: whiteColor(diamondSearch, diamondList),
                height: Get.height / 6.3,
              ),

              //ShortCut
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.shortcut,
                contain: shortcutColor(diamondSearch, diamondList),
                height: Get.height / 8.5,
              ),

              //Lab
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.lab,
                contain: lab(diamondSearch, diamondList),
                height: Get.height / 6.3,
              ),

              //Polish
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.polish,
                contain: polish(diamondSearch, diamondList),
                height: Get.height / 9.3,
              ),

              //Symmetry
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.symmetry,
                contain: symmetry(diamondSearch, diamondList),
                height: Get.height / 9.3,
              ),

              //Availability
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.availability,
                contain: availability(diamondSearch, diamondList),
                height: Get.height / 8.9,
              ),

              //Treatment
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.treatment,
                contain: treatment(diamondSearch, diamondList),
                height: Get.height / 8.9,
              ),

              //Fluorescence
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.fluorescence,
                contain: fluorescence(diamondSearch, diamondList),
                height: Get.height / 8.9,
              ),

              //Eye Clean
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.eyeClean,
                contain: eyeClean(diamondSearch, diamondList),
                height: Get.height / 8.5,
              ),

              //Measurements
              measurements(
                lengthMinController: diamondSearch.lengthMinController,
                lengthMaxController: diamondSearch.lengthMaxController,
                widthMinController: diamondSearch.widthMinController,
                widthMaxController: diamondSearch.widthMaxController,
                depthMinController: diamondSearch.depthMinController,
                depthMaxController: diamondSearch.depthMaxController,
                tableMinController: diamondSearch.tableMinController,
                tableMaxController: diamondSearch.tableMaxController,
                crownHeightMinController:
                    diamondSearch.crownHeightMinController,
                crownHeightMaxController:
                    diamondSearch.crownHeightMaxController,
                crownAngleMaxController: diamondSearch.crownAngleMaxController,
                crownAngleMinController: diamondSearch.crownAngleMinController,
                pavilionDepthMinController:
                    diamondSearch.pavilionDepthMinController,
                pavilionDepthMaxController:
                    diamondSearch.pavilionDepthMaxController,
                pavilionAngleMinController:
                    diamondSearch.pavilionAngleMinController,
                pavilionAngleMaxController:
                    diamondSearch.pavilionAngleMaxController,
              ),

              SizedBox(height: Get.height * 0.2),
            ],
          ),
        );
      }),
    );
  }
}
