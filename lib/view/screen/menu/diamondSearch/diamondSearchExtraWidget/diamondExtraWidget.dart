//Shape
// ignore_for_file: collection_methods_unrelated_type, deprecated_member_use, file_names, strict_top_level_inference

import 'package:classic/controller/user_Interface/menu/diamondSearch/diamondSearch_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget shapeHedding(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.subheding,
      fontFamily: 'FuturaCyrillic',
      fontWeight: FontWeight.w500,
    ),
  );
}

// Shape
Widget shape(DiamondSearchUIController diamondSearch) {
  final diamondList = DiamondList();
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      return Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: Get.width * 0.02,
            mainAxisSpacing: Get.height * 0.009,
            childAspectRatio: 1.7,
          ),
          itemCount: diamondList.shapes.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            bool isSelected =
                controller.selectedShapes.contains(index) ||
                controller.selectedShapes.contains(diamondList.shapes[index]);
            return GestureDetector(
              onTap: () => controller.toggleShapeSelection(index),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(Get.width * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderradius.buttonboder),
                  border: Border.all(
                    color: isSelected ? AppColor.primary : AppColor.gray3,
                    width: 1.0,
                  ),
                  color: isSelected
                      ? AppColor.primary.withOpacity(0.1)
                      : Colors.transparent,
                ),
                child: Text(
                  diamondList.shapes[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Textsize.samisubHedding,
                    color: isSelected ? AppColor.primary : AppColor.black,
                    fontWeight: isSelected
                        ? FontWeight.w500
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

//Carat
Widget carat(DiamondSearchUIController diamondSearch, DiamondList diamondList) {
  return selectionGrid<String>(
    items: diamondList.carat,
    isSelected: (controller, index, item) =>
        controller.selectedCarat.contains(index) ||
        controller.selectedCarat.contains(diamondList.carat[index]),
    onTap: (controller, index) => controller.toggleCaratSelection(index),
  );
}

//Clarity
Widget clarity(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.clarity,
    isSelected: (controller, index, item) =>
        controller.selectedClarity.contains(index) ||
        controller.selectedClarity.contains(diamondList.clarity[index]),
    onTap: (controller, index) => controller.toggleClaritySelection(index),
  );
}

//White Color
Widget whiteColor(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.whiteColors,
    isSelected: (controller, index, item) =>
        controller.selectWhiteColor.contains(index) ||
        controller.selectWhiteColor.contains(diamondList.whiteColors[index]),
    onTap: (controller, index) => controller.toggleWhiteColorSelection(index),
  );
}

//Shortcut Color
Widget shortcutColor(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.shortcut,
    isSelected: (controller, index, item) =>
        controller.selectShortcut.contains(index) ||
        controller.selectShortcut.contains(diamondList.shortcut[index]),
    onTap: (controller, index) => controller.toggleShortcutSelection(index),
  );
}

//Lab
Widget lab(DiamondSearchUIController diamondSearch, DiamondList diamondList) {
  return selectionGrid<String>(
    items: diamondList.lab,
    isSelected: (controller, index, item) =>
        controller.selectLAB.contains(index) ||
        controller.selectLAB.contains(diamondList.lab[index]),
    onTap: (controller, index) => controller.toggleLABSelection(index),
  );
}

//polish
Widget polish(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.polsih,
    isSelected: (controller, index, item) =>
        controller.selectPolish.contains(index) ||
        controller.selectPolish.contains(diamondList.polsih[index]),
    onTap: (controller, index) => controller.togglePolishSelection(index),
  );
}

//Symmetry
Widget symmetry(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.symmetry,
    isSelected: (controller, index, item) =>
        controller.selectSymmetry.contains(index) ||
        controller.selectSymmetry.contains(item),
    onTap: (controller, index) => controller.toggleSymmetrySelection(index),
  );
}

//Availability
Widget availability(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.availability,
    isSelected: (controller, index, item) =>
        controller.selectAvailability.contains(index) ||
        controller.selectAvailability.contains(item),
    onTap: (controller, index) => controller.toggleAvailabilitySelection(index),
  );
}

//Treatment
Widget treatment(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.treatment,
    isSelected: (controller, index, item) =>
        controller.selectTreatment.contains(index) ||
        controller.selectTreatment.contains(item),
    onTap: (controller, index) => controller.toggleTreatmentSelection(index),
  );
}

//Fluorescence
Widget fluorescence(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.fluorescence,
    isSelected: (controller, index, item) =>
        controller.selectFluorescence.contains(index) ||
        controller.selectFluorescence.contains(item),
    onTap: (controller, index) => controller.toggleFluorescenceSelection(index),
  );
}

//Eye Clean
Widget eyeClean(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.eyeClean,
    isSelected: (controller, index, item) =>
        controller.selectedEyeClean.contains(index) ||
        controller.selectedEyeClean.contains(item),
    onTap: (controller, index) => controller.toggleEyeCleanSelection(index),
  );
}

Widget viweList({
  required int itemCount,
  required Widget Function(BuildContext, int) itemBuilder,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: Get.width * 0.03,
          mainAxisSpacing: Get.height * 0.009,
          childAspectRatio: 2.9,
        ),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      );
    },
  );
}

Widget viweContainer({
  required void Function() onTap,
  required Color colorBoder,
  required Color color,
  required Color textColor,
  required String text,
  required FontWeight fontWeight,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.01,
        vertical: Get.width * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        border: Border.all(color: colorBoder),
        color: color,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Textsize.samisubHedding,
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}

Widget selectionGrid<T>({
  required List<T> items,
  required bool Function(
    DiamondSearchUIController controller,
    int index,
    T item,
  )
  isSelected,
  required void Function(DiamondSearchUIController controller, int index) onTap,
}) {
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      return viweList(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final selected = isSelected(controller, index, item);
          return viweContainer(
            onTap: () => onTap(controller, index),
            colorBoder: selected ? AppColor.primary : AppColor.gray3,
            color: selected ? AppColor.primary : Colors.transparent,
            textColor: selected ? AppColor.white : AppColor.black,
            text: item.toString(),
            fontWeight: selected ? FontWeight.w500 : FontWeight.normal,
          );
        },
      );
    },
  );
}

Widget textLine({
  required String hediingtext,
  required TextEditingController minController,
  required TextEditingController maxController,
}) {
  return horizontalPadding(
    child: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: Get.height * 0.01),
          Text(
            hediingtext,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'FuturaCyrillic',
              fontSize: Textsize.subheding,
            ),
          ),
          SizedBox(height: Get.height * 0.01),
          Row(
            children: [
              Expanded(
                child: Inputfield(
                  controller: minController,
                  hinttext: 'Min',
                  hintstylefontFamily: 'Sans-Regular',
                  textfontFamily: 'Sans-Regular',
                  hintstyleColor: AppColor.gray,
                  textColor: AppColor.black,
                  keyboardType: TextInputType.number,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primary),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.gray),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.gray),
                  ),
                ),
              ),
              SizedBox(width: Get.width * 0.05),
              Expanded(
                child: Inputfield(
                  controller: maxController,
                  hinttext: 'Max',
                  hintstylefontFamily: 'Sans-Regular',
                  textfontFamily: 'Sans-Regular',
                  hintstyleColor: AppColor.gray,
                  textColor: AppColor.black,
                  keyboardType: TextInputType.number,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primary),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.gray),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.gray),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
