// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList/filter/getAllParameter_Controller.dart';
import 'package:classic/controller/user_Interface/menu/diamondSearch/diamondSearch_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/drawer.dart';
import 'package:classic/view/screen/menu/diamondSearch/diamondSearchExtraWidget/diamondExtraWidget.dart';
import 'package:classic/view/screen/menu/diamondSearch/diamondSearchScreen/searchResult.dart';
import 'package:classic/view/screen/menu/diamondSearch/diamondWidget/header/appbar.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_cricularProgrssIndicator.dart';
import '../diamondWidget/body/diamondSearchWidget.dart';

class Diamondsearch extends StatelessWidget {
  final diamondSearch = Get.put(DiamondSearchUIController());
  final getAllPeraMeter = Get.put(GetallparameterController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final diamondList = DiamondList();

  Diamondsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      scaffoldKey: scaffoldKey,
      endDrawer: Drawers(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColor.white),
        height: Get.height * 0.22,
        child: horizontalPadding(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.025),
              Obx(() {
                final api = diamondSearch.diamondSearchAPI;
                final loading = api.isLoading.value;
                return button(
                  AppString.searchdiamond,
                  onTap: () {
                    diamondSearch.searchDiamond().then((value) {
                      Get.to(() => SearchResult());
                    });
                  },
                  isLowercase: true,
                  bottomBottonFontSize: true,
                  loadingWait: (loading) ? customCircular() : null,
                );
              }),
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.025),
              ),
            ],
          ),
        ),
      ),
      appBar: appBarDiamond(
        prefixIcon: AppIcon.edit,
        suffixIcon: AppIcon.drawer,
        hedding: AppString.diamondSearch,
        suffixOnTap: () => scaffoldKey.currentState?.openEndDrawer(),
        prefixOnTap: diamondSearch.clearSelections,
      ),
      child: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.02),
              ),
              // TOP TABS
              indexButtons(
                isWhiteDimaond: diamondSearch.isWhite,
                isColoredDimaond: diamondSearch.isColored,
                onTapDiamond: () => diamondSearch.selectTab(0),
                onTapJewellwery: () => diamondSearch.selectTab(1),
              ),

              //Shape
              shapeViwe(
                getAllPeraMeter,
                AppString.shape,
                Widget: shape(getAllPeraMeter, isMenu: true),
              ),

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
                contain: clarity(getAllPeraMeter),
              ),

              //White Color
              (diamondSearch.selectedIndex.value == 0)
                  ? searchColor(
                      diamondSearch: diamondSearch,
                      text: AppString.whiteColor,
                      contain: whiteColor(getAllPeraMeter),
                    )
                  : shapeViwe(
                      getAllPeraMeter,
                      AppString.color,
                      Widget: fancyColor(getAllPeraMeter),
                    ),

              //ShortCut
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.shortcut,
                contain: shortcutColor(diamondSearch, diamondList),
              ),

              //Lab
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.lab,
                contain: lab(getAllPeraMeter),
              ),

              //Polish
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.polish,
                contain: polish(getAllPeraMeter),
              ),

              //Symmetry
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.symmetry,
                contain: symmetry(getAllPeraMeter),
              ),

              //Availability
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.availability,
                contain: availability(diamondSearch, diamondList),
              ),

              //Treatment
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.treatment,
                contain: treatment(diamondSearch, diamondList),
              ),

              //Fluorescence
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.fluorescence,
                contain: fluorescence(getAllPeraMeter),
              ),

              //Eye Clean
              searchColor(
                diamondSearch: diamondSearch,
                text: AppString.eyeClean,
                contain: eyeClean(diamondSearch, diamondList),
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
            ],
          ),
        );
      }),
    );
  }
}
