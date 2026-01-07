import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/filter_Controller.dart';
import 'package:classic/controller/user_Interface/menu/jewelry/filter_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/bottomNavigationButton.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/noDada.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/app_Borderradius.dart';
import '../../../../utils/app_String.dart';
import '../jewelryExtraWidget/filter.dart';
import '../jewelryWidget/body/filterbody.dart';

class Filter extends StatelessWidget {
  final filter = Get.put(FilterUIController());
  final filterAPI = Get.put(FilterController());
  final product = Lisofproduct();
  final dimaondlist = DiamondList();
  final filterCategory = FilterCategory();

  Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.filters, filter: true),
      //Filter Button
      bottomNavigationBar: Obx(() {
        final api = filterAPI;
        final loading = api.isLoading.value;

        if (loading) {
          return Center(child: shimmer());
        }

        return (loading)
            ? SizedBox()
            : buttonNavigation(
                child: filterButton(onTapClear: () {}, onTapSave: () {}),
              );
      }),
      child: Obx(() {
        final api = filterAPI;
        final loading = api.isLoading.value;

        if (loading) {
          return Center(child: shimmer());
        }

        final apiData = api.filterData;

        if (apiData.isEmpty) {
          return noData();
        }

        final filterData = apiData['data'];

        final metalStampsList = filterData['metalStamp'];
        final metalTypesList = filterData['metalType'];
        final stoneTypesList = filterData['stone'];
        final shapesList = filterData['shape'];

        return SingleChildScrollView(
          child: Column(
            children: [
              metalType(metalTypes: metalTypesList, filter: filter),
              divider(),

              //Metal Stamp
              metalStamps(metalStamps: metalStampsList, filter: filter),
              divider(),

              //shape
              shape(shapes: shapesList, filter: filter),
              divider(),

              //Stone Type
              stone(stone: stoneTypesList, filter: filter),
              divider(),

              //Sort By
              shortBY(
                isSelectedHighToLow: filter.highToLow.value,
                isSelectedLowToHigh: filter.lowToHigh.value,
                onTapHighToLow: filter.sortHighToLow,
                onTapLowToHigh: filter.sortLowToHigh,
              ),

              Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.03)),
            ],
          ),
        );
      }),
    );
  }
}