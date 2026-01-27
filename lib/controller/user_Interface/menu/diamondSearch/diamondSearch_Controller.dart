// ignore_for_file: file_names, avoid_print

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
  List<int> selectedCarat = [];
  List<int> selectedClarity = [];
  List<String> selectedClarityIds = [];
  List<int> selectedColor = [];
  List<String> selectedColorIds = [];
  List<String> selectShortcut = [];
  List<int> selectedLAB = [];
  List<String> selectedLABIds = [];
  List<int> selectedPolish = [];
  List<String> selectedPolishIds = [];
  List<int> selectedSymmetry = [];
  List<String> selectedSymmetryIds = [];
  List<String> selectAvailability = [];
  List<String> selectTreatment = [];
  List<int> selectedFluorescence = [];
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
  void toggleColorSelection(int index, String paraMtrId) {
    if (selectedColor.contains(index)) {
      selectedColor.remove(index);
      selectedColorIds.remove(paraMtrId);
    } else {
      selectedColor.add(index);
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
    // If selecting "Other", clear specific shape selections
    if (selectedOtherShape) {
      selectedShapes.clear();
    }
    update();
  }

  //Multiple selection Fluorescence
  void toggleFluorescenceSelection(int index, String paraMtrId) {
    if (selectedFluorescence.contains(index)) {
      selectedFluorescence.remove(index);
      selectedFluorescenceIds.remove(paraMtrId);
    } else {
      selectedFluorescence.add(index);
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
  void toggleSymmetrySelection(int index, String paraMtrId) {
    if (selectedSymmetry.contains(index)) {
      selectedSymmetry.remove(index);
      selectedSymmetryIds.remove(paraMtrId);
    } else {
      selectedSymmetry.add(index);
      selectedSymmetryIds.add(paraMtrId);
    }
    update();
  }

  //Multiple selection Polish
  void togglePolishSelection(int index, String paraMtrId) {
    if (selectedPolish.contains(index)) {
      selectedPolish.remove(index);
      selectedPolishIds.remove(paraMtrId);
    } else {
      selectedPolish.add(index);
      selectedPolishIds.add(paraMtrId);
    }
    update();
  }

  //Multiple selection Lab
  void toggleLABSelection(int index, String paraMtrId) {
    if (selectedLAB.contains(index)) {
      selectedLAB.remove(index);
      selectedLABIds.remove(paraMtrId);
    } else {
      selectedLAB.add(index);
      selectedLABIds.add(paraMtrId);
    }
    update();
  }

  //Multiple selection clarity
  void toggleClaritySelection(int index, String paraMtrId) {
    if (selectedClarity.contains(index)) {
      selectedClarity.remove(index);
      selectedClarityIds.remove(paraMtrId);
    } else {
      selectedClarity.add(index);
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
    final int id = int.parse(paraMtrId);

    if (selectedCarat.contains(id)) {
      selectedCarat.remove(id);
    } else {
      selectedCarat.add(id);
    }
    update();
  }

  // For single selection (if you prefer) Clarity
  void selectClarity(int index) {
    selectedClarity.clear();
    selectedClarity.add(index);
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
  void selectsymmetry(int index) {
    selectedSymmetry.clear();
    selectedSymmetry.add(index);
    update();
  }

  // For single selection (if you prefer) LB
  void selectLab(int index) {
    selectedLAB.clear();
    selectedLAB.add(index);
    update();
  }

  // For single selection (if you prefer) Shortcut
  void selectshortcut(int index) {
    selectShortcut.clear();
    selectShortcut.add(index.toString());
    update();
  }

  // For single selection (if you prefer) Polish
  void selectspolish(int index) {
    selectedPolish.clear();
    selectedPolish.add(index);
    update();
  }

  // For single selection (if you prefer) White Color
  void selectWitheColor(int index) {
    selectedColor.clear();
    selectedColor.add(index);
    update();
  }

  // For single selection (if you prefer) Carat
  void selectCarat(int index) {
    selectedCarat.clear();
    selectedCarat.add(index);
    update();
  }

  // For single selection (if you prefer) Fluorescence
  void selectFluorescences(int index) {
    selectedFluorescence.clear();
    selectedFluorescence.add(index);
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
      shape: selectedShapes,
      carat: selectedCarat,
      clarity: selectedClarity,
      color: selectedColor,
      lab: selectedLAB,
      polish: selectedPolish,
      symmetry: selectedSymmetry,
      availability: selectAvailability,
      treatment: selectTreatment,
      fluorescence: selectedFluorescence,
      eyeClean: selectedEyeClean,
      shortcut: selectShortcut,
    );

    print("Shape :- $selectedShapes");
    print("Carat :- $selectedCarat");
    print("Clarity :- $selectedClarity");
    print("Color :- $selectedColor");
    print("LAB :- $selectedLAB");
    print("Polish :- $selectedPolish");
    print("Symmetry :- $selectedSymmetry");
    print("Availability :- $selectAvailability");
    print("Treatment :- $selectTreatment");
    print("Fluorescence :- $selectedFluorescence");
    print("Eye Clean :- $selectedEyeClean");
    print("Shortcut :- $selectShortcut");
  }
}
