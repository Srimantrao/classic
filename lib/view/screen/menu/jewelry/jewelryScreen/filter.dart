import 'package:classic/controller/user_Interface/menu/jewelry/filter_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_String.dart';
import '../jewelryWidget/body/filterbody.dart';

class Filter extends StatelessWidget {
  final filter = Get.put(FilterUIController());
  final product = Lisofproduct();
  final dimaondlist = DiamondList();
  final filterCategory = FilterCategory();

  Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.filters, filter: true),
      child: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              //Metal Type
              horizontalPadding(
                child: metaltype(
                  whiteGoldOneTap: filter.selectWhiteGold,
                  roseGoldOneTap: filter.selectRoseGold,
                  yellowGoldOneTap: filter.selectYellowGold,
                  roseWhiteGoldOneTap: filter.selectRoseWhiteGold,
                  yellowWhiteGoldOneTap: filter.selectYellowWhiteGold,
                  whiteRoseGoldOneTap: filter.selectWhiteRoseGold,
                  whiteselect: filter.whiteGold.value,
                  roseGoldselect: filter.roseGold.value,
                  yellowGoldselect: filter.yellowGold.value,
                  roseWhiteGoldselect: filter.roseWhiteGold.value,
                  yellowWhiteGoldselect: filter.yellowWhiteGold.value,
                  whiteRoseGoldselect: filter.whiteRoseGold.value,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Divider(color: AppColor.gray5, thickness: 2),

              //Metal Stamp
              horizontalPadding(child: metalstame(product)),
              SizedBox(height: Get.height * 0.03),
              Divider(color: AppColor.gray5, thickness: 2),

              //shape
              SizedBox(height: Get.height * 0.01),
              shapeSelected(dimaondlist),

              SizedBox(height: Get.height * 0.03),
              Divider(color: AppColor.gray5, thickness: 2),

              //Stone Type
              stoneType(filterCategory),
              SizedBox(height: Get.height * 0.03),
              Divider(color: AppColor.gray5, thickness: 2),

              //Sort By
              shortBY(
                isSelectedHighToLow: filter.highToLow.value,
                isSelectedLowToHigh: filter.lowToHigh.value,
                onTapHighToLow: filter.sortHighToLow,
                onTapLowToHigh: filter.sortLowToHigh,
              ),

              //Filter Button
              filterButton(onTapClear: () {}, onTapSave: () {}),
            ],
          ),
        );
      }),
    );
  }
}
