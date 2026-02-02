//Shape
// ignore_for_file: collection_methods_unrelated_type, deprecated_member_use, file_names, strict_top_level_inference, unnecessary_underscores

import 'package:classic/controller/user_Interface/menu/diamondSearch/diamondSearch_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productList/filter/getAllParameter_Controller.dart';

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

Widget shape(GetallparameterController diamondSearch, {required bool isMenu}) {
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      final allShapes = diamondSearch.getAllParameterData['shape'];
      if (allShapes == null || allShapes.isEmpty) {
        return const SizedBox();
      }
      final shapeList = allShapes.where((item) {
        final menuValue = item['isMenu'];
        return isMenu ? menuValue == true : menuValue != true;
      }).toList();
      if (shapeList.isEmpty) {
        return const SizedBox();
      }
      return Wrap(
        spacing: Get.width * 0.05,
        runSpacing: Get.height * 0.009,
        children: [
          ...List.generate(shapeList.length, (index) {
            final imageUrl = shapeList[index]['image1'];
            final String paraMtrId = shapeList[index]['paraMtrId'].toString();
            bool isSelected = controller.selectedShapes.contains(paraMtrId);
            return GestureDetector(
              onTap: () => controller.toggleShapeSelection(paraMtrId),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.04,
                  vertical: Get.height * 0.012,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderradius.buttonboder),
                  border: Border.all(
                    color: isSelected ? AppColor.primary : AppColor.gray3,
                  ),
                  boxShadow: kElevationToShadow[2],
                  color: isSelected ? AppColor.primary : AppColor.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (imageUrl != null && imageUrl.isNotEmpty)
                      Image.network(
                        imageUrl,
                        scale: 4,
                        color: isSelected ? AppColor.white : AppColor.black,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const CircularProgressIndicator();
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.broken_image,
                            color: isSelected ? AppColor.white : AppColor.black,
                          );
                        },
                      ),
                    Text(
                      shapeList[index]['paraMtrName'],
                      style: TextStyle(
                        fontSize: Textsize.samisubHedding,
                        color: isSelected ? AppColor.white : AppColor.black,
                        fontWeight: isSelected
                            ? FontWeight.w500
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          GestureDetector(
            onTap: () => controller.toggleOtherShape(allShapes),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.04,
                vertical: Get.height * 0.012,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderradius.buttonboder),
                border: Border.all(
                  color: controller.selecteOtherShape.isNotEmpty
                      ? AppColor.primary
                      : AppColor.gray3,
                ),
                color: controller.selecteOtherShape.isNotEmpty
                    ? AppColor.primary
                    : AppColor.white,
                boxShadow: kElevationToShadow[2],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppIcon.edit,
                    scale: 25,
                    fit: BoxFit.contain,
                    color: controller.selecteOtherShape.isNotEmpty
                        ? AppColor.white
                        : AppColor.gray3,
                  ),
                  Text(
                    'Other',
                    style: TextStyle(
                      fontSize: Textsize.samisubHedding,
                      color: controller.selecteOtherShape.isNotEmpty
                          ? AppColor.white
                          : AppColor.black,
                      fontWeight: controller.selecteOtherShape.isNotEmpty
                          ? FontWeight.w500
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget fancyColor(GetallparameterController diamondSearch) {
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      final allColors = diamondSearch.getAllParameterData['fancyColor'];
      if (allColors == null || allColors.isEmpty) {
        return const SizedBox();
      }
      return Wrap(
        spacing: Get.width * 0.074,
        runSpacing: Get.height * 0.009,
        children: List.generate(allColors.length, (index) {
          final item = allColors[index];
          final imageUrl = item['image1'];
          final String paraMtrId = item['paraMtrId'].toString();
          bool isSelected = controller.selectedFancyColors.contains(paraMtrId);
          return GestureDetector(
            onTap: () => controller.toggleFancyColorSelection(paraMtrId),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.04,
                vertical: Get.height * 0.012,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderradius.buttonboder),
                border: Border.all(
                  color: isSelected ? AppColor.primary : AppColor.gray3,
                ),
                boxShadow: kElevationToShadow[2],
                color: isSelected ? AppColor.primary : AppColor.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (imageUrl != null && imageUrl.isNotEmpty)
                    Image.network(
                      imageUrl,
                      scale: 4,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return  Icon(Icons.broken_image, color: AppColor.black);
                      },
                    ),
                  const SizedBox(height: 4),
                  Text(
                    item['paraMtrName'],
                    style: TextStyle(
                      fontSize: Textsize.samisubHedding,
                      color: isSelected ? AppColor.white : AppColor.black,
                      fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    },
  );
}

//carat
Widget carat(DiamondSearchUIController controller, DiamondList diamondList) {
  return selectionGrid<String>(
    items: diamondList.carat.map((e) => e['paraMtrName'].toString()).toList(),
    isSelected: (_, index, __) {
      return controller.selectedCarat.contains(
        diamondList.carat[index]['paraMtrId'],
      );
    },
    onTap: (_, index) {
      controller.toggleCaratSelection(diamondList.carat[index]['paraMtrId']);
    },
  );
}

//Clarity
Widget clarity(GetallparameterController diamondSearch) {
  final List clarityData = diamondSearch.getAllParameterData['clarity'] as List;
  final List<String> clarityList = clarityData
      .map((e) => e['paraMtrName'].toString())
      .toList();
  return GetBuilder<GetallparameterController>(
    builder: (controller) {
      return selectionGrid<String>(
        items: clarityList,
        isSelected: (controller, index, item) {
          final String paraMtrId = clarityData[index]['paraMtrId'];
          return controller.selectedClarity.contains(paraMtrId);
        },
        onTap: (controller, index) {
          final selectedObj = clarityData[index];
          final String paraMtrId = selectedObj['paraMtrId'];
          controller.toggleClaritySelection(paraMtrId);
        },
      );
    },
  );
}

//White Color
Widget whiteColor(GetallparameterController diamondSearch) {
  final List colorData = diamondSearch.getAllParameterData['color'] as List;

  final List<String> colorList = colorData
      .map((e) => e['paraMtrName'].toString())
      .toList();

  return GetBuilder<GetallparameterController>(
    builder: (controller) {
      return selectionGrid<String>(
        items: colorList,
        isSelected: (controller, index, item) {
          final String paraMtrId = colorData[index]['paraMtrId'];
          return controller.selectedColor.contains(paraMtrId);
        },
        onTap: (controller, index) {
          final String paraMtrId = colorData[index]['paraMtrId'];
          controller.toggleColorSelection(paraMtrId);
        },
      );
    },
  );
}

//Shortcut Color
Widget shortcutColor(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.shortcut
        .map((e) => e['paraMtrName'].toString())
        .toList(),
    isSelected: (controller, index, item) {
      return controller.selectShortcut.contains(
        diamondList.shortcut[index]['paraMtrId'],
      );
    },
    onTap: (controller, index) => controller.toggleShortcutSelection(
      diamondList.shortcut[index]['paraMtrId'],
    ),
  );
}

//Lab
Widget lab(GetallparameterController diamondSearch) {
  final List labData = diamondSearch.getAllParameterData['lab'] as List;

  final List<String> labList = labData
      .map((e) => e['paraMtrName'].toString())
      .toList();

  return GetBuilder<GetallparameterController>(
    builder: (controller) {
      return selectionGrid<String>(
        items: labList,
        isSelected: (controller, index, item) {
          final String paraMtrId = labData[index]['paraMtrId'];
          return controller.selectedLAB.contains(paraMtrId);
        },
        onTap: (controller, index) {
          final String paraMtrId = labData[index]['paraMtrId'];
          controller.toggleLABSelection(paraMtrId);
        },
      );
    },
  );
}

//polish
Widget polish(GetallparameterController diamondSearch) {
  final List polishData = diamondSearch.getAllParameterData['polish'] as List;

  final List<String> polishList = polishData
      .map((e) => e['paraMtrName'].toString())
      .toList();

  return GetBuilder<GetallparameterController>(
    builder: (controller) {
      return selectionGrid<String>(
        items: polishList,
        isSelected: (controller, index, item) {
          final String paraMtrId = polishData[index]['paraMtrId'];
          return controller.selectedPolish.contains(paraMtrId);
        },
        onTap: (controller, index) {
          final String paraMtrId = polishData[index]['paraMtrId'];
          controller.togglePolishSelection(paraMtrId);
        },
      );
    },
  );
}

//Symmetry
Widget symmetry(GetallparameterController diamondSearch) {
  final List symmetryData =
      diamondSearch.getAllParameterData['symmetry'] as List;

  final List<String> symmetryList = symmetryData
      .map((e) => e['paraMtrName'].toString())
      .toList();

  return GetBuilder<GetallparameterController>(
    builder: (controller) {
      return selectionGrid<String>(
        items: symmetryList,
        isSelected: (controller, index, item) {
          final String paraMtrId = symmetryData[index]['paraMtrId'];
          return controller.selectedSymmetry.contains(paraMtrId);
        },
        onTap: (controller, index) {
          final String paraMtrId = symmetryData[index]['paraMtrId'];
          controller.toggleSymmetrySelection(paraMtrId);
        },
      );
    },
  );
}

//Availability
Widget availability(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.availability
        .map((e) => e['paraMtrName'].toString())
        .toList(),
    isSelected: (controller, index, item) => controller.selectAvailability
        .contains(diamondList.availability[index]['paraMtrId']),
    onTap: (controller, index) {
      return controller.toggleAvailabilitySelection(
        diamondList.availability[index]['paraMtrId'],
      );
    },
  );
}

//Treatment
Widget treatment(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.treatment
        .map((e) => e['paraMtrName'].toString())
        .toList(),
    isSelected: (controller, index, item) {
      return controller.selectTreatment.contains(
        diamondList.treatment[index]['paraMtrId'],
      );
    },
    onTap: (controller, index) => controller.toggleTreatmentSelection(
      diamondList.treatment[index]['paraMtrId'],
    ),
  );
}

//Fluorescence
Widget fluorescence(GetallparameterController diamondSearch) {
  final List fluorescenceData =
      diamondSearch.getAllParameterData['fluorescence'] as List;

  final List<String> fluorescenceList = fluorescenceData
      .map((e) => e['paraMtrName'].toString())
      .toList();

  return GetBuilder<GetallparameterController>(
    builder: (controller) {
      return selectionGrid<String>(
        items: fluorescenceList,
        isSelected: (controller, index, item) {
          final String paraMtrId = fluorescenceData[index]['paraMtrId'];
          return controller.selectedFluorescence.contains(paraMtrId);
        },
        onTap: (controller, index) {
          final String paraMtrId = fluorescenceData[index]['paraMtrId'];
          controller.toggleFluorescenceSelection(paraMtrId);
        },
      );
    },
  );
}

//Eye Clean
Widget eyeClean(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return selectionGrid<String>(
    items: diamondList.eyeClean
        .map((e) => e['paraMtrName'].toString())
        .toList(),
    isSelected: (controller, index, item) {
      return controller.selectedEyeClean.contains(
        diamondList.eyeClean[index]['paraMtrId'],
      );
    },
    onTap: (controller, index) {
      return controller.toggleEyeCleanSelection(
        diamondList.eyeClean[index]['paraMtrId'],
      );
    },
  );
}

Widget viweList({
  required int itemCount,
  required Widget Function(BuildContext, int) itemBuilder,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final spacing = Get.width * 0.03;
      final itemWidth = (constraints.maxWidth - (spacing * 3)) / 4;
      return Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: spacing,
          runSpacing: Get.height * 0.009,
          children: List.generate(
            itemCount,
            (index) =>
                SizedBox(width: itemWidth, child: itemBuilder(context, index)),
          ),
        ),
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
        boxShadow: kElevationToShadow[2],
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
            color: selected ? AppColor.primary : AppColor.white,
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
