// ignore_for_file: file_names

import 'package:classic/controller/user_Interface/menu/diamondSearch/diamondSearch_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/view/screen/menu/diamondSearch/diamondSearchExtraWidget/diamondExtraWidget.dart';
import 'package:classic/view/screen/menu/diamondSearch/diamondWidget/header/appbar.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../diamondWidget/body/diamondSearchWidget.dart';

class Diamondsearch extends StatelessWidget {
  final diamondSearch = Get.put(DiamondSearchUIController());
  final diamondList = DiamondList();
  Diamondsearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: appBarDiamond(
        prefixIcon: AppIcon.newcart,
        suffixIcon: AppIcon.drawer,
        hedding: AppString.diamondSearch,
      ),
      child: Obx((){
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
                height: Get.height / 6.5,
              ),

              //ShortCut
              searchColor(
                diamondSearch: diamondSearch,
                text: 'Shortcut',
                contain: shortcutColor(diamondSearch, diamondList),
                height: Get.height / 8.5,
              ),

              //Lab
              searchColor(
                diamondSearch: diamondSearch,
                text: 'Lab',
                contain: lab(diamondSearch, diamondList),
                height: Get.height / 6.5,
              ),

              //Polish
              searchColor(
                diamondSearch: diamondSearch,
                text: 'Polish',
                contain: polish(diamondSearch, diamondList),
                height: Get.height / 9.5,
              ),

              searchColor(
                diamondSearch: diamondSearch,
                text: 'Symmetry',
                contain: symmetry(diamondSearch, diamondList),
              ),
            ],
          ),
        );
      })
    );
  }
}
