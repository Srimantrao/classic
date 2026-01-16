// ignore_for_file: avoid_print, unused_local_variable

import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList/filter/filter_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList/filter/getAllParameter_Controller.dart';
import 'package:classic/controller/user_Interface/menu/jewelry/filter_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/modal/menu/jewelry/lisofProduct.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/bottomNavigationButton.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/noDada.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_String.dart';
import '../jewelryExtraWidget/filter.dart';
import '../jewelryWidget/body/filterbody.dart';

void bottomStyle(
  BuildContext context, {
  required String categoryId,
  required String categoryName,
}) {
  showModalBottomSheet(
    useSafeArea: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColor.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(borderradius.buttonboder),
      ),
    ),
    builder: (_) {
      return Filter(categoryId: categoryId, categoryName: categoryName);
    },
  );
}

class Filter extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final filter = Get.put(FilterUIController());
  final filterAPI = Get.put(FilterController());
  final getAllPeraMeter = Get.put(GetallparameterController());
  final product = Lisofproduct();
  final dimaondlist = DiamondList();
  final filterCategory = FilterCategory();

  Filter({super.key, required this.categoryId, required this.categoryName});

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
                child: filterButton(
                  onTapClear: () {
                    filter.reset(categoryId, categoryName);
                  },
                  onTapSave: () {
                    filter.savePerametter(categoryId, categoryName);
                  },
                ),
              );
      }),

      //Body
      child: Obx(() {
        final apiflter = filterAPI;
        final apiGetAllParameter = getAllPeraMeter;
        final loadingApiFilter = apiflter.isLoading.value;
        final loadingApiGetAllParameter = apiGetAllParameter.isLoading.value;

        if (loadingApiFilter || loadingApiGetAllParameter) {
          return Center(child: shimmer());
        }

        final apiData = apiflter.filterData;
        final getAllParameterData = apiGetAllParameter.getAllParameterData;

        if (apiData.isEmpty || getAllParameterData.isEmpty) {
          return noData();
        }

        final filterData = apiData['data'];
        final metalStampsList = (filterData['metalStamp'] as List? ?? []).cast<Map<String, dynamic>>();
        final metalTypesList = (filterData['metalType'] as List? ?? []).cast<Map<String, dynamic>>();
        final stoneTypesList = (getAllParameterData['settingType'] as List? ?? []).cast<Map<String, dynamic>>();
        final shapesList = (filterData['shape'] as List? ?? []).cast<Map<String, dynamic>>();

        filter.computeCombinedMetal(filterData);

        return SingleChildScrollView(
          child: Column(
            children: [
              // metalType(metalTypes: metalTypesList, filter: filter),
              // divider(),
              //
              // metalStamps(metalStamps: metalStampsList, filter: filter),
              // divider(),
              combinedMetalWidget(combinedMetal: filter.combinedMetal, filter: filter),
              divider(),

              shape(shapes: shapesList, filter: filter),
              divider(),

              stone(stone: stoneTypesList, filter: filter),
              divider(),

              shortBY(
                isSelectedHighToLow: filter.highToLow.value,
                isSelectedLowToHigh: filter.lowToHigh.value,
                onTapHighToLow: filter.sortHighToLow,
                onTapLowToHigh: filter.sortLowToHigh,
              ),

              Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.03))
            ],
          ),
        );
      }),
    );
  }
}