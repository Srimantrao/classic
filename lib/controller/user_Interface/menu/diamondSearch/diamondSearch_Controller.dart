// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:classic/controller/application_Programing_interface/apiController/menu/diamondSearch/diamondSearch_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DiamondSearchUIController extends GetxController {
  final diamondSearchAPI = Get.put(DiamondSearchController());
  var selectedIndex = 0.obs;
  bool selectedOtherShape = false;
  List<String> selectedShapes = [];
  Set<String> selectedShapeIds = {};
  RxBool selecteOtherShape = false.obs;
  List<String> selectedCarat = [];
  List<String> selectedClarity = [];
  List<String> selectedClarityIds = [];
  List<String> selectedColor = [];
  List<String> selectedColorIds = [];
  List<String> selectShortcut = [];
  List<String> selectedLAB = [];
  List<String> selectedLABIds = [];
  List<String> selectedPolish = [];
  List<String> selectedPolishIds = [];
  List<String> selectedSymmetry = [];
  List<String> selectedSymmetryIds = [];
  List<String> selectAvailability = [];
  List<String> selectTreatment = [];
  List<String> selectedFluorescence = [];
  List<String> selectedFluorescenceIds = [];
  List<String> selectedEyeClean = [];

  TextEditingController lengthMinController = TextEditingController();
  TextEditingController lengthMaxController = TextEditingController();
  TextEditingController widthMinController = TextEditingController();
  TextEditingController widthMaxController = TextEditingController();
  TextEditingController depthMinController = TextEditingController();
  TextEditingController depthMaxController = TextEditingController();
  TextEditingController tableMinController = TextEditingController();
  TextEditingController tableMaxController = TextEditingController();
  TextEditingController crownHeightMinController = TextEditingController();
  TextEditingController crownHeightMaxController = TextEditingController();
  TextEditingController crownAngleMinController = TextEditingController();
  TextEditingController crownAngleMaxController = TextEditingController();
  TextEditingController pavilionDepthMinController = TextEditingController();
  TextEditingController pavilionDepthMaxController = TextEditingController();
  TextEditingController pavilionAngleMinController = TextEditingController();
  TextEditingController pavilionAngleMaxController = TextEditingController();

  //Multiple selection White Color
  void toggleColorSelection(String paraMtrId) {
    if (selectedColor.contains(paraMtrId)) {
      selectedColor.remove(paraMtrId);
      selectedColorIds.remove(paraMtrId);
    } else {
      selectedColor.add(paraMtrId);
      selectedColorIds.add(paraMtrId);
    }
    update();
  }

  //Multiple selection Eye Clean
  void toggleEyeCleanSelection(String paraMtrId) {
    if (selectedEyeClean.contains(paraMtrId)) {
      selectedEyeClean.remove(paraMtrId);
    } else {
      selectedEyeClean.add(paraMtrId);
    }
    update();
  }

  void toggleOtherShapeSelection() {
    selectedOtherShape = !selectedOtherShape;
    if (selectedOtherShape) {
      selectedShapes.clear();
    }
    update();
  }

  //Multiple selection Fluorescence
  void toggleFluorescenceSelection(String paraMtrId) {
    if (selectedFluorescence.contains(paraMtrId)) {
      selectedFluorescence.remove(paraMtrId);
      selectedFluorescenceIds.remove(paraMtrId);
    } else {
      selectedFluorescence.add(paraMtrId);
      selectedFluorescenceIds.add(paraMtrId);
    }
    update();
  }

  //Multiple selection Treatment
  void toggleTreatmentSelection(String paraMtrId) {
    if (selectTreatment.contains(paraMtrId)) {
      selectTreatment.remove(paraMtrId);
    } else {
      selectTreatment.add(paraMtrId);
    }
    update();
  }

  //Multiple selection Availability
  void toggleAvailabilitySelection(String paraMtrId) {
    if (selectAvailability.contains(paraMtrId)) {
      selectAvailability.remove(paraMtrId);
    } else {
      selectAvailability.add(paraMtrId);
    }
    update();
  }

  //Multiple selection Shortcut
  void toggleShortcutSelection(String paraMtrId) {
    if (selectShortcut.contains(paraMtrId)) {
      selectShortcut.remove(paraMtrId);
    } else {
      selectShortcut.add(paraMtrId);
    }
    update();
  }

  //Multiple selection selectSymmetry
  void toggleSymmetrySelection(String paraMtrId) {
    if (selectedSymmetry.contains(paraMtrId)) {
      selectedSymmetry.remove(paraMtrId);
      selectedSymmetryIds.remove(paraMtrId);
    } else {
      selectedSymmetry.add(paraMtrId);
      selectedSymmetryIds.add(paraMtrId);
    }
    update();
  }

  //Multiple selection Polish
  void togglePolishSelection(String paraMtrId) {
    if (selectedPolish.contains(paraMtrId)) {
      selectedPolish.remove(paraMtrId);
      selectedPolishIds.remove(paraMtrId);
    } else {
      selectedPolish.add(paraMtrId);
      selectedPolishIds.add(paraMtrId);
    }
    update();
  }

  //Multiple selection Lab
  void toggleLABSelection(String paraMtrId) {
    if (selectedLAB.contains(paraMtrId)) {
      selectedLAB.remove(paraMtrId);
      selectedLABIds.remove(paraMtrId);
    } else {
      selectedLAB.add(paraMtrId);
      selectedLABIds.add(paraMtrId);
    }
    update();
  }

  //Multiple selection clarity
  void toggleClaritySelection(String paraMtrId) {
    if (selectedClarity.contains(paraMtrId)) {
      selectedClarity.remove(paraMtrId);
      selectedClarityIds.remove(paraMtrId);
    } else {
      selectedClarity.add(paraMtrId);
      selectedClarityIds.add(paraMtrId);
    }
    update();
  }

  //Multiple selection Shape
  void toggleShapeSelection(String paraMtrId) {
    if (selectedShapes.contains(paraMtrId)) {
      selectedShapes.remove(paraMtrId);
    } else {
      selectedShapes.add(paraMtrId);
    }
    update();
  }

  void togleOtherShape(List allShapes) {
    selecteOtherShape.value = !selecteOtherShape.value;
    final otherShapes = allShapes.where((e) => e['isMenu'] == false).toList();
    if (selecteOtherShape.value) {
      for (var shape in otherShapes) {
        selectedShapeIds.add(shape['paraMtrId']);
      }
    } else {
      for (var shape in otherShapes) {
        selectedShapeIds.remove(shape['paraMtrId']);
      }
    }
    update();
  }

  //Multiple selection carat
  void toggleCaratSelection(String paraMtrId) {
    if (selectedCarat.contains(paraMtrId)) {
      selectedCarat.remove(paraMtrId);
    } else {
      selectedCarat.add(paraMtrId);
    }
    update();
  }

  // For single selection (if you prefer) Clarity
  void selectClarity(String paraMtrId) {
    selectedClarity.clear();
    selectedClarity.add(paraMtrId);
    update();
  }

  //For single selection (if you prefer) Eye Clean
  void selectEyeClean(String paraMtrId) {
    selectedEyeClean.clear();
    selectedEyeClean.add(paraMtrId);
    update();
  }

  //For single selection (if you prefer) Treatment
  void selecttreatment(String paraMtrId) {
    selectTreatment.clear();
    selectTreatment.add(paraMtrId);
    update();
  }

  // For single selection (if you prefer) Availability
  void selectAvailabilitys(String paraMtrId) {
    selectAvailability.clear();
    selectAvailability.add(paraMtrId);
    update();
  }

  // For single selection (if you prefer) Symmetry
  void selectsymmetry(String paraMtrId) {
    selectedSymmetry.clear();
    selectedSymmetry.add(paraMtrId);
    update();
  }

  // For single selection (if you prefer) LB
  void selectLab(String paraMtrId) {
    selectedLAB.clear();
    selectedLAB.add(paraMtrId);
    update();
  }

  // For single selection (if you prefer) Shortcut
  void selectshortcut(int index) {
    selectShortcut.clear();
    selectShortcut.add(index.toString());
    update();
  }

  // For single selection (if you prefer) Polish
  void selectspolish(String paraMtrId) {
    selectedPolish.clear();
    selectedPolish.add(paraMtrId);
    update();
  }

  // For single selection (if you prefer) White Color
  void selectWitheColor(String paraMtrId) {
    selectedColor.clear();
    selectedColor.add(paraMtrId);
    update();
  }

  // For single selection (if you prefer) Carat
  void selectCarat(String paraMtrId) {
    selectedCarat.clear();
    selectedCarat.add(paraMtrId);
    update();
  }

  // For single selection (if you prefer) Fluorescence
  void selectFluorescences(String paraMtrId) {
    selectedFluorescence.clear();
    selectedFluorescence.add(paraMtrId);
    update();
  }

  // For single selection (if you prefer) Shape
  void selectShape(String paraMtrId) {
    selectedShapes.clear();
    selectedShapes.add(paraMtrId);
    update();
  }

  // Clear all selections
  void clearSelections() {
    selectedShapes.clear();
    selectedCarat.clear();
    selectedClarity.clear();
    selectedColor.clear();
    selectedLAB.clear();
    selectedPolish.clear();
    selectedSymmetry.clear();
    selectAvailability.clear();
    selectTreatment.clear();
    selectedFluorescence.clear();
    selectedEyeClean.clear();
    update();
  }

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  bool get isWhite => selectedIndex.value == 0;

  bool get isColored => selectedIndex.value == 1;

  void searchDiamond() {
    diamondSearchAPI.diamondSearching(
      pageSize: '1',
      pageNumber: '20',
      shape: selectedShapes.isEmpty ? null : jsonEncode(selectedShapes),
      carat: selectedCarat.isEmpty ? null : jsonEncode(selectedCarat),
      clarity: selectedClarity.isEmpty ? null : jsonEncode(selectedClarity),
      color: selectedColor.isEmpty ? null : jsonEncode(selectedColor),
      lab: selectedLAB.isEmpty ? null : jsonEncode(selectedLAB),
      polish: selectedPolish.isEmpty ? null : jsonEncode(selectedPolish),
      symmetry: selectedSymmetry.isEmpty ? null : jsonEncode(selectedSymmetry),
      availability: selectAvailability.isEmpty
          ? null
          : jsonEncode(selectAvailability),
      treatment: selectTreatment.isEmpty ? null : jsonEncode(selectTreatment),
      fluorescence: selectedFluorescence.isEmpty
          ? null
          : jsonEncode(selectedFluorescence),
      eyeClean: selectedEyeClean.isEmpty ? null : jsonEncode(selectedEyeClean),
      shortcut: selectShortcut.isEmpty ? null : jsonEncode(selectShortcut),
      length:
      (lengthMinController.text.isEmpty && lengthMaxController.text.isEmpty)
          ? null
          : jsonEncode({
        'min': lengthMinController.text,
        'max': lengthMaxController.text,
      }),
      width: (widthMinController.text.isEmpty)
          ? null
          : jsonEncode({
        'min': widthMinController.text,
        'max': widthMaxController.text,
      }),
      depth: (depthMinController.text.isEmpty)
          ? null
          : jsonEncode({
        'min': depthMinController.text,
        'max': depthMaxController.text,
      }),
      table: (tableMinController.text.isEmpty)
          ? null
          : jsonEncode({
        'min': tableMinController.text,
        'max': tableMaxController.text,
      }),
      crownHeight: (crownHeightMinController.text.isEmpty)
          ? null
          : jsonEncode({
        'min': crownHeightMinController.text,
        'max': crownHeightMaxController.text,
      }),
      crownAngle: (crownAngleMinController.text.isEmpty)
          ? null
          : jsonEncode({
        'min': crownAngleMinController.text,
        'max': crownAngleMaxController.text,
      }),
      pavilionDepth: (pavilionDepthMinController.text.isEmpty)
          ? null
          : jsonEncode({
        'min': pavilionDepthMinController.text,
        'max': pavilionDepthMaxController.text,
      }),
      pavilionAngle: (pavilionAngleMinController.text.isEmpty)
          ? null
          : jsonEncode({
        'min': pavilionAngleMinController.text,
        'max': pavilionAngleMaxController.text,
      }),
    );
    print("Shape :- ${jsonEncode(selectedShapes)}");
    print("Carat :- ${jsonEncode(selectedCarat)}");
    print("Clarity :- ${jsonEncode(selectedClarity)}");
    print("Color :- ${jsonEncode(selectedColor)}");
    print("LAB :- ${jsonEncode(selectedLAB)}");
    print("Polish :- ${jsonEncode(selectedPolish)}");
    print("Symmetry :- ${jsonEncode(selectedSymmetry)}");
    print("Availability :- ${jsonEncode(selectAvailability)}");
    print("Treatment :- ${jsonEncode(selectTreatment)}");
    print("Fluorescence :- ${jsonEncode(selectedFluorescence)}");
    print("Eye Clean :- ${jsonEncode(selectedEyeClean)}");
    print("Shortcut :- ${jsonEncode(selectShortcut)}");
    print(
        "Length :- ${(
            lengthMinController.text.isEmpty &&
                lengthMaxController.text.isEmpty
        )
            ? null
            : jsonEncode({
          'min': lengthMinController.text,
          'max': lengthMaxController.text,
        })}"
    );
    print(
        "Width :- ${(widthMinController.text.isEmpty &&
            widthMaxController.text.isEmpty) ? null : jsonEncode({
      'min': widthMinController.text,
      'max': widthMaxController.text,
    })}"
    );
  }
}
