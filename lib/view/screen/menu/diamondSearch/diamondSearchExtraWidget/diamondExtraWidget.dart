//Shape
// ignore_for_file: collection_methods_unrelated_type, deprecated_member_use, file_names

import 'package:classic/controller/user_Interface/menu/diamondSearch/diamondSearch_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
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
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      return viweList(
        itemCount: diamondList.carat.length,
        itemBuilder: (context, index) {
          bool isSelected =
              controller.selectedCarat.contains(index) ||
              controller.selectedCarat.contains(diamondList.carat[index]);
          return viweContainer(
            onTap: () => controller.toggleCaratSelection(index),
            colorBoder: isSelected ? AppColor.primary : AppColor.gray3,
            color: isSelected ? AppColor.primary : Colors.transparent,
            textColor: isSelected ? AppColor.white : AppColor.black,
            text: diamondList.carat[index],
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          );
        },
      );
    },
  );
}

//Clarity
Widget clarity(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      return viweList(
        itemCount: diamondList.clarity.length,
        itemBuilder: (context, index) {
          bool isSelected =
              controller.selectedClarity.contains(index) ||
              controller.selectedClarity.contains(diamondList.clarity[index]);
          return viweContainer(
            onTap: () => controller.toggleClaritySelection(index),
            colorBoder: isSelected ? AppColor.primary : AppColor.gray3,
            color: isSelected ? AppColor.primary : Colors.transparent,
            textColor: isSelected ? AppColor.white : AppColor.black,
            text: diamondList.clarity[index],
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          );
        },
      );
    },
  );
}

//White Color
Widget whiteColor(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      return viweList(
        itemCount: diamondList.whiteColors.length,
        itemBuilder: (context, index) {
          bool isSelected =
              controller.selectWhiteColor.contains(index) ||
              controller.selectWhiteColor.contains(
                diamondList.whiteColors[index],
              );
          return viweContainer(
            onTap: () => controller.toggleWhiteColorSelection(index),
            colorBoder: isSelected ? AppColor.primary : AppColor.gray3,
            color: isSelected ? AppColor.primary : Colors.transparent,
            textColor: isSelected ? AppColor.white : AppColor.black,
            text: diamondList.whiteColors[index],
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          );
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
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      return viweList(
        itemCount: diamondList.shortcut.length,
        itemBuilder: (context, index) {
          bool isSelected =
              controller.selectShortcut.contains(index) ||
              controller.selectShortcut.contains(diamondList.shortcut[index]);
          return viweContainer(
            onTap: () => controller.toggleShortcutSelection(index),
            colorBoder: isSelected ? AppColor.primary : AppColor.gray3,
            color: isSelected ? AppColor.primary : Colors.transparent,
            textColor: isSelected ? AppColor.white : AppColor.black,
            text: diamondList.shortcut[index],
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          );
        },
      );
    },
  );
}

//Lab
Widget lab(DiamondSearchUIController diamondSearch, DiamondList diamondList) {
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      return viweList(
        itemCount: diamondList.lab.length,
        itemBuilder: (context, index) {
          bool isSelected =
              controller.selectLAB.contains(index) ||
              controller.selectLAB.contains(diamondList.lab[index]);
          return viweContainer(
            onTap: () => controller.toggleLABSelection(index),
            colorBoder: isSelected ? AppColor.primary : AppColor.gray3,
            color: isSelected ? AppColor.primary : Colors.transparent,
            textColor: isSelected ? AppColor.white : AppColor.black,
            text: diamondList.lab[index],
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          );
        },
      );
    },
  );
}

//polish
Widget polish(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      return viweList(
        itemCount: diamondList.polsih.length,
        itemBuilder: (context, index) {
          bool isSelected =
              controller.selectPolish.contains(index) ||
              controller.selectPolish.contains(diamondList.polsih[index]);
          return viweContainer(
            onTap: () => controller.togglePolishSelection(index),
            colorBoder: isSelected ? AppColor.primary : AppColor.gray3,
            color: isSelected ? AppColor.primary : Colors.transparent,
            textColor: isSelected ? AppColor.white : AppColor.black,
            text: diamondList.polsih[index],
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          );
        },
      );
    },
  );
}

//Symmetry
Widget symmetry(
  DiamondSearchUIController diamondSearch,
  DiamondList diamondList,
) {
  return GetBuilder<DiamondSearchUIController>(
    builder: (controller) {
      return viweList(
        itemCount: diamondList.symmetry.length,
        itemBuilder: (context, index) {
          bool isSelected =
              controller.selectSymmetry.contains(index) ||
              controller.selectSymmetry.contains(diamondList.symmetry[index]);
          return viweContainer(
            onTap: () => controller.toggleSymmetrySelection(index),
            colorBoder: isSelected ? AppColor.primary : AppColor.gray3,
            color: isSelected ? AppColor.primary : Colors.transparent,
            textColor: isSelected ? AppColor.white : AppColor.black,
            text: diamondList.symmetry[index],
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          );
        },
      );
    },
  );
}

Widget viweList({
  required int itemCount,
  required Widget Function(BuildContext, int) itemBuilder,
}) {
  return Expanded(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: Get.width * 0.02,
        mainAxisSpacing: Get.height * 0.009,
        childAspectRatio: 2.2,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    ),
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


// // ...existing code...

// // Generic selection grid widget
// Widget selectionGrid<T>({
//   required List<T> items,
//   required bool Function(DiamondSearchUIController controller, int index, T item) isSelected,
//   required void Function(DiamondSearchUIController controller, int index) onTap,
// }) {
//   return GetBuilder<DiamondSearchUIController>(
//     builder: (controller) {
//       return viweList(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index];
//           final selected = isSelected(controller, index, item);
//           return viweContainer(
//             onTap: () => onTap(controller, index),
//             colorBoder: selected ? AppColor.primary : AppColor.gray3,
//             color: selected ? AppColor.primary : Colors.transparent,
//             textColor: selected ? AppColor.white : AppColor.black,
//             text: item.toString(),
//             fontWeight: selected ? FontWeight.w500 : FontWeight.normal,
//           );
//         },
//       );
//     },
//   );
// }

// // ...existing code...

// //Symmetry (refactored to use selectionGrid)
// Widget symmetry(
//     DiamondSearchUIController diamondSearch,
//     DiamondList diamondList,
//     ) {
//   return selectionGrid<String>(
//     items: diamondList.symmetry,
//     isSelected: (controller, index, item) =>
//         controller.selectSymmetry.contains(index) ||
//         controller.selectSymmetry.contains(item),
//     onTap: (controller, index) => controller.toggleSymmetrySelection(index),
//   );
// }

// // ...existing code...