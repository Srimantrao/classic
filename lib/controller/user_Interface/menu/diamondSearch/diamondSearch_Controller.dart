// ignore_for_file: file_names

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DiamondSearchUIController extends GetxController {
  var selectedIndex = 0.obs;
  List<int> selectedShapes = [];
  List<int> selectedCarat = [];
  List<int> selectedClarity = [];
  List<int> selectWhiteColor = [];
  List<int> selectShortcut = [];
  List<int> selectLAB = [];
  List<int> selectPolish = [];
  List<int> selectSymmetry = [];

  //Multiple selection White Color
  void toggleWhiteColorSelection(int index) {
    if (selectWhiteColor.contains(index)) {
      selectWhiteColor.remove(index);
    } else {
      selectWhiteColor.add(index);
    }
    update();
  }

  //Multiple selection Shortcut
  void toggleShortcutSelection(int index) {
    if (selectShortcut.contains(index)) {
      selectShortcut.remove(index);
    } else {
      selectShortcut.add(index);
    }
    update();
  }

  //Multiple selection selectSymmetry
  void toggleSymmetrySelection(int index) {
    if (selectSymmetry.contains(index)) {
      selectSymmetry.remove(index);
    } else {
      selectSymmetry.add(index);
    }
    update();
  }

  //Multiple selection Polish
  void togglePolishSelection(int index) {
    if (selectPolish.contains(index)) {
      selectPolish.remove(index);
    } else {
      selectPolish.add(index);
    }
    update();
  }

  //Multiple selection Lab
  void toggleLABSelection(int index) {
    if (selectLAB.contains(index)) {
      selectLAB.remove(index);
    } else {
      selectLAB.add(index);
    }
    update();
  }


  //Multiple selection clarity
  void toggleClaritySelection(int index) {
    if (selectedClarity.contains(index)) {
      selectedClarity.remove(index);
    } else {
      selectedClarity.add(index);
    }
    update();
  }

  //Multiple selection Shape
  void toggleShapeSelection(int index) {
    if (selectedShapes.contains(index)) {
      selectedShapes.remove(index);
    } else {
      selectedShapes.add(index);
    }
    update();
  }

  //Multiple selection carat
  void toggleCaratSelection(int index) {
    if (selectedCarat.contains(index)) {
      selectedCarat.remove(index);
    } else {
      selectedCarat.add(index);
    }
    update();
  }

  // For single selection (if you prefer) Clarity
  void selectClarity(int index) {
    selectedClarity.clear();
    selectedClarity.add(index);
    update();
  }

  // For single selection (if you prefer) Symmetry
  void selectsymmetry (int index) {
    selectSymmetry.clear();
    selectSymmetry.add(index);
    update();
  }

  // For single selection (if you prefer) LB
  void selectLab(int index) {
    selectLAB.clear();
    selectLAB.add(index);
    update();
  }

  // For single selection (if you prefer) Shortcut
  void selectshortcut(int index) {
    selectShortcut.clear();
    selectShortcut.add(index);
    update();
  }

  // For single selection (if you prefer) Polish
  void selectspolish(int index) {
    selectPolish.clear();
    selectPolish.add(index);
    update();
  }


  // For single selection (if you prefer) White Color
  void selectWitheColor(int index) {
    selectWhiteColor.clear();
    selectWhiteColor.add(index);
    update();
  }

  // For single selection (if you prefer) Carat
  void selectCarat(int index) {
    selectedCarat.clear();
    selectedCarat.add(index);
    update();
  }

  // For single selection (if you prefer) Shape
  void selectShape(int index) {
    selectedShapes.clear();
    selectedShapes.add(index);
    update();
  }

  // Clear all selections
  void clearSelections() {
    selectedShapes.clear();
    selectedCarat.clear();
    selectedClarity.clear();
    selectWhiteColor.clear();
    selectWhiteColor.clear();
    selectLAB.clear();
    selectPolish.clear();
    selectSymmetry.clear();
    update();
  }

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  bool get isWhite => selectedIndex.value == 0;
  bool get isColored => selectedIndex.value == 1;
}
