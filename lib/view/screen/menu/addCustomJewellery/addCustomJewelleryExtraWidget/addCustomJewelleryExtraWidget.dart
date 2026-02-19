// ignore_for_file: file_names, deprecated_member_use, collection_methods_unrelated_type, avoid_unnecessary_containers, unused_local_variable, strict_top_level_inference

import 'package:classic/controller/user_Interface/menu/addCustomJewellery/addCustomJewellery_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/view/screen/menu/diamondSearch/diamondSearchExtraWidget/diamondExtraWidget.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/cartcontainer.dart';
import 'package:classic/view/utils/widget/checkbox.dart';
import 'package:classic/view/utils/widget/dropdownSelected.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productList/filter/getAllParameter_Controller.dart';

Widget addCustomJewelleryHeddingText(
  text, {
  Color? color,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color ?? AppColor.primary,
      fontWeight: FontWeight.w600,
      fontSize: Get.width * 0.052,
      fontFamily: 'Sans-Bold',
    ),
  );
}

Widget addCustomJewellerySubHeddingText(
  text, {
  Color? color,
  double? fontSize,
}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: fontSize ?? Get.width * 0.035,
      fontWeight: FontWeight.w400,
      fontFamily: 'Sans-Bold',
      color: color ?? AppColor.black,
    ),
  );
}

Widget roundCircleSelector({
  required String imageText,
  required String videoText,
  required String urlText,
  required void Function() imageOnTap,
  required void Function() videoOnTap,
  required void Function() urlOnTap,
  required Color imageColor,
  required Color videoColor,
  required Color urlColor,
  required double imageRadius,
  required double videoRadius,
  required double urlRadius,
}) {
  return Row(
    children: [
      roundCircal(
        text: imageText,
        onTap: imageOnTap,
        color: imageColor,
        radius: imageRadius,
      ),
      SizedBox(width: Get.width * 0.15),
      roundCircal(
        text: videoText,
        onTap: videoOnTap,
        color: videoColor,
        radius: videoRadius,
      ),
      SizedBox(width: Get.width * 0.15),
      roundCircal(
        text: urlText,
        onTap: urlOnTap,
        color: urlColor,
        radius: urlRadius,
      ),
    ],
  );
}

Widget roundCircal({
  required String text,
  required void Function() onTap,
  required Color color,
  required double radius,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 10,
          child: CircleAvatar(backgroundColor: AppColor.white, radius: radius),
        ),
        SizedBox(width: Get.width * 0.02),
        Text(
          text,
          style: TextStyle(
            color: AppColor.black,
            fontSize: Get.width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget chooseFileButton({
  required void Function() onTap,
  required String buttonText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: Get.height * 0.01),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.1,
                  vertical: Get.height * 0.015,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderradius.buttonboder),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: Get.width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget inputString({
  required TextEditingController controller,
  required String text,
  required String hinttext,
  int? maxLength,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
}) {
  return inputTyaping(
    text: text,
    hinttext: hinttext,
    controller: controller,
    color: AppColor.gray5,
    maxLength: maxLength,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
  );
}

Widget selectdropdown(
  String? label, {
  required List<DropdownMenuItem<String>> list,
  required String value,
  required ValueChanged<String?> onChanged,
  required String hinttext,
}) {
  return dropdowns(
    label,
    hinttext: hinttext,
    list: list,
    value: value,
    onChanged: onChanged,
    border: Border.all(color: AppColor.gray5),
    fontWeight: FontWeight.w500,
  );
}

Widget checkBoxWidget({
  required String isCenterStonetext,
  required bool isCenterStonevalue,
  required void Function(bool?) isCenterStoneonChanged,
  required String isSideStonetext,
  required bool isSideStonevalue,
  required void Function(bool?) isSideStoneonChanged,
  required String colorText,
  required bool isCenterColorvalue,
  required void Function(bool?) isSideColorChanged,
  required GetallparameterController diamondSearch,
  required String shapetext,
  required GetallparameterController colorSearch,
  required String colortext,
  required GetallparameterController claritySearch,
  required String claritytext,
  required AddcustomjewelleryUIController stoneUpdate,
}) {
  return Column(
    children: [
      tabCheck(
        text: isCenterStonetext,
        value: isCenterStonevalue,
        onChanged: isCenterStoneonChanged,
      ),
      SizedBox(height: Get.height * 0.01),
      (isCenterStonevalue)
          ? centerStoneContainer(
              text: AppString.iscolor,
              value: isCenterColorvalue,
              onChanged: isSideColorChanged,
              diamondSearch: diamondSearch,
              shapetext: shapetext,
              colorSearch: colorSearch,
              colortext: colortext,
              claritySearch: claritySearch,
              claritytext: claritytext,
            )
          : SizedBox(),
      SizedBox(height: Get.height * 0.01),
      tabCheck(
        text: isSideStonetext,
        value: isSideStonevalue,
        onChanged: isSideStoneonChanged,
      ),
      SizedBox(height: Get.height * 0.01),
      (isSideStonevalue) ? sideStoneContainer(stoneUpdate) : SizedBox(),
      SizedBox(height: Get.height * 0.01),
    ],
  );
}

Widget centerStoneContainer({
  required String text,
  required bool value,
  required Function(bool?) onChanged,
  required GetallparameterController diamondSearch,
  required String shapetext,
  required GetallparameterController colorSearch,
  required String colortext,
  required GetallparameterController claritySearch,
  required String claritytext,
}) {
  return cartConatiner(
    child: Align(
      alignment: AlignmentGeometry.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tabCheck(text: text, value: value, onChanged: onChanged),
          shapeViweDimondShape(diamondSearch, shapetext),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.015)),
          shapeHedding(AppString.color),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.015)),
          whiteColor(colorSearch),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.015)),
          shapeHedding(AppString.clarity),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.015)),
          clarity(claritySearch),
        ],
      ),
    ),
  );
}

Widget sideStoneContainer(AddcustomjewelleryUIController stoneUpdate) {
  return cartConatiner(
    child: GetBuilder<AddcustomjewelleryUIController>(
      builder: (AddcustomjewelleryUIController stoneUpdate) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [addButton()],
            ),
            SizedBox(height: Get.height * 0.01),
            (stoneUpdate.allSelectdata.isNotEmpty)
                ? listofSaveSideStone(stoneUpdate)
                : SizedBox(),
          ],
        );
      },
    ),
  );
}

Widget addButton() {
  final controller = Get.find<AddcustomjewelleryUIController>();
  return GestureDetector(
    onTap: (){
      controller.resetStoneForm();
      openBottomSheet();
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        color: AppColor.primary,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.09,
        vertical: Get.height * 0.007,
      ),
      child: Text(
        '+ Add',
        style: TextStyle(
          color: AppColor.white,
          fontSize: Textsize.normal,
          fontWeight: FontWeight.w400,
          fontFamily: 'FuturaCyrillic',
        ),
      ),
    ),
  );
}

void openBottomSheet() {
  Widget padding() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Get.height * 0.010,
      ),
    );
  }
  Get.bottomSheet(
    GetBuilder<AddcustomjewelleryUIController>(
      builder: (AddcustomjewelleryUIController stoneUpdate) {
        return SafeArea(
          child: Container(
            height: Get.height * 0.7,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Get.width * 0.09),
                topRight: Radius.circular(Get.width * 0.09),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
              child: horizontalPadding(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            bottomWidget(),
                            padding(),
                            chekISGem(
                              value: stoneUpdate.isGemValue.value,
                              onChanged: stoneUpdate.toggleIsGam,
                            ),
                            padding(),
                            dropdowns(
                              AppString.shape,
                              value: stoneUpdate.shape.value,
                              list: stoneUpdate.getShape(),
                              onChanged: stoneUpdate.selectShapeDrop,
                            ),
                            (stoneUpdate.shapValue.value == true)
                                ? dropdowns(
                                    AppString.color,
                                    value: stoneUpdate.color.value,
                                    list: stoneUpdate.getColor(),
                                    onChanged: stoneUpdate.selectColorDrop,
                                  )
                                : dropdowns(
                                    AppString.color,
                                    value: stoneUpdate.color.value,
                                    list: stoneUpdate.getColor(),
                                    onChanged: stoneUpdate.selectColorDrop,
                                  ),
                            (stoneUpdate.colorValue.value == true)
                                ? dropdowns(
                                    AppString.clarity,
                                    value: stoneUpdate.clarity.value,
                                    list: stoneUpdate.getClarity(),
                                    onChanged: stoneUpdate.selectClarityDrop,
                                  )
                                : dropdowns(
                                    AppString.clarity,
                                    value: stoneUpdate.clarity.value,
                                    list: stoneUpdate.getClarity(),
                                    onChanged: stoneUpdate.selectClarityDrop,
                                  ),
                            dropdowns(
                              AppString.size,
                              value: stoneUpdate.size.value,
                              list: stoneUpdate.getSize(),
                              onChanged: stoneUpdate.selectSizeDrop,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Inputfield(
                                    color: AppColor.gray5,
                                    hinttext: AppString.pieces,
                                    controller: stoneUpdate.piecessController,
                                    maxLength: 4,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.03,
                                  ),
                                ),
                                Expanded(
                                  child: Inputfield(
                                    color: AppColor.gray5,
                                    hinttext: AppString.weight,
                                    controller: stoneUpdate.weightController,
                                    maxLength: 4,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// ADD BUTTON FIXED AT BOTTOM
                    GestureDetector(
                      onTap: () async {
                        await stoneUpdate.selectAllData();
                        Get.back();
                      },
                      child: button(
                        '+Add',
                        isLowercase: true,
                        bottomBottonFontSize: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
    isScrollControlled: true,
  );
}

Widget listofSaveSideStone(AddcustomjewelleryUIController stoneupdate) {
  return ListView.builder(
    itemCount: stoneupdate.allSelectdata.length,
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      final data = stoneupdate.allSelectdata[index] ?? '';
      final shape = stoneupdate.allSelectdata[index]['shape'] ?? '';
      final clarity = stoneupdate.allSelectdata[index]['clarity'] ?? '';
      final pieces = stoneupdate.allSelectdata[index]['pieces'] ?? '';
      final color = stoneupdate.allSelectdata[index]['color'] ?? '';
      final size = stoneupdate.allSelectdata[index]['size'] ?? '';
      final weight = stoneupdate.allSelectdata[index]['weight'] ?? '';
      return Container(
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: kElevationToShadow[1],
          borderRadius: BorderRadius.circular(borderradius.buttonboder),
        ),
        child: horizontalPadding(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    fuctionButton(
                      AppString.edit,
                      onTap: () {
                        stoneupdate.updateingValue(index);
                        openBottomSheet();
                      },
                    ),
                    SizedBox(width: Get.width * 0.02),
                    fuctionButton(
                      AppString.remove,
                      onTap: () {
                        stoneupdate.removeStone(index);
                      },
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        selectedDimanondViwe(
                          nameString: AppString.shape,
                          valueString: shape,
                        ),
                        selectedDimanondViwe(
                          nameString: AppString.clarity,
                          valueString: clarity,
                        ),
                        selectedDimanondViwe(
                          nameString: AppString.pieces,
                          valueString: pieces,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        selectedDimanondViwe(
                          nameString: AppString.color,
                          valueString: color,
                        ),
                        selectedDimanondViwe(
                          nameString: AppString.size,
                          valueString: size,
                        ),
                        selectedDimanondViwe(
                          nameString: AppString.weight,
                          valueString: weight,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget fuctionButton(text, {void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget selectedDimanondViwe({
  required String nameString,
  required String valueString,
}) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            '$nameString : ',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'FuturaCyrillic',
            ),
          ),
          Text(
            valueString,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'FuturaCyrillic',
              fontSize: Textsize.normal,
              color: AppColor.primary,
            ),
          ),
        ],
      ),
      SizedBox(height: Get.height * 0.005),
    ],
  );
}

Widget bottomWidget() {
  return Text(
    AppString.addsideStone,
    style: TextStyle(
      color: AppColor.black,
      fontSize: Textsize.heading,
      fontWeight: FontWeight.w400,
      fontFamily: 'FuturaCyrillic',
    ),
  );
}

Widget chekISGem({required bool value, void Function(bool?)? onChanged}) {
  return tabCheck(text: AppString.IsGem, value: value, onChanged: onChanged);
}

Widget shapeViweDimondShape(diamondSearch, text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.015)),
      shapeHedding(text),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.015)),
      shape(diamondSearch, isMenu: true),
    ],
  );
}

Widget shapeViweDimondColor(diamondSearch, text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.015)),
      shapeHedding(text),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.015)),
      shape(diamondSearch, isMenu: true),
    ],
  );
}

Widget shapeViweClarity(diamondSearch, text) {
  return SizedBox(
    height: Get.height / 6,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.height * 0.02),
        shapeHedding(text),
        SizedBox(height: Get.height * 0.01),
        colorClarity(diamondSearch),
      ],
    ),
  );
}

// Widget shapeDimaond(AddcustomjewelleryUIController diamondSearch) {
//   final diamondList = DiamondList();
//   return GetBuilder<AddcustomjewelleryUIController>(
//     builder: (controller) {
//       return Expanded(
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//             crossAxisSpacing: Get.width * 0.02,
//             mainAxisSpacing: Get.height * 0.009,
//             childAspectRatio: 1.7,
//           ),
//           itemCount: diamondList.shapes.length,
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             bool isSelected =
//                 controller.selectedShapes.contains(index) ||
//                 controller.selectedShapes.contains(diamondList.shapes[index]);
//             return GestureDetector(
//               onTap: () => controller.toggleShapeSelection(index),
//               child: Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.all(Get.width * 0.03),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(borderradius.buttonboder),
//                   border: Border.all(
//                     color: isSelected ? AppColor.primary : AppColor.gray5,
//                     width: 1.0,
//                   ),
//                   color: isSelected
//                       ? AppColor.primary.withOpacity(0.1)
//                       : Colors.transparent,
//                 ),
//                 child: Text(
//                   diamondList.shapes[index],
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: Textsize.samisubHedding,
//                     color: isSelected ? AppColor.primary : AppColor.black,
//                     fontWeight: isSelected
//                         ? FontWeight.w500
//                         : FontWeight.normal,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     },
//   );
// }

Widget colorDimaond(AddcustomjewelleryUIController diamondSearch) {
  final diamondList = DiamondList();
  return GetBuilder<AddcustomjewelleryUIController>(
    builder: (controller) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: Get.width * 0.02,
          mainAxisSpacing: Get.height * 0.009,
          childAspectRatio: 2.2,
        ),
        itemCount: diamondList.whiteColors.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          bool isSelected =
              controller.selectWhiteColor.contains(index) ||
              controller.selectWhiteColor.contains(
                diamondList.whiteColors[index],
              );
          return GestureDetector(
            onTap: () => controller.toggleColorSelection(index),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderradius.buttonboder),
                border: Border.all(
                  color: isSelected ? AppColor.primary : AppColor.gray5,
                  width: 1.0,
                ),
                color: isSelected ? AppColor.primary : Colors.transparent,
              ),
              child: Text(
                diamondList.whiteColors[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Textsize.samisubHedding,
                  color: isSelected ? AppColor.white : AppColor.black,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget colorClarity(AddcustomjewelleryUIController diamondSearch) {
  final diamondList = DiamondList();
  return GetBuilder<AddcustomjewelleryUIController>(
    builder: (controller) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: Get.width * 0.02,
          mainAxisSpacing: Get.height * 0.009,
          childAspectRatio: 1.7,
        ),
        itemCount: diamondList.clarity.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          bool isSelected =
              controller.selectedClarity.contains(index) ||
              controller.selectedClarity.contains(diamondList.clarity[index]);
          return GestureDetector(
            onTap: () => controller.toggleClaritySelection(index),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderradius.buttonboder),
                border: Border.all(
                  color: isSelected ? AppColor.primary : AppColor.gray5,
                  width: 1.0,
                ),
                color: isSelected ? AppColor.primary : Colors.transparent,
              ),
              child: Text(
                diamondList.clarity[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Textsize.samisubHedding,
                  color: isSelected ? AppColor.white : AppColor.black,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget tabCheck({
  required String text,
  required bool value,
  void Function(bool?)? onChanged,
}) {
  return Row(
    children: [
      checkBox(value, onChanged),
      SizedBox(width: Get.width * 0.02),
      Text(
        text,
        style: TextStyle(
          fontSize: Get.width * 0.04,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget contactInformationWidet({
  required String fristNameText,
  required String fristNameHintText,
  required TextEditingController fristNameController,
  required String lastNameText,
  required String lastNameHintText,
  required TextEditingController lastNameController,
  required String emailIDText,
  required String emailIDhintText,
  required TextEditingController emailIdhintController,
  required String mobileNumbarText,
  required String mobileNumbarhintText,
  required TextEditingController mobileNumbarhController,
  required String referredmobileNumbarText,
  required String referredNumbarhintText,
  required TextEditingController referredController,
}) {
  return cartConatiner(
    child: Column(
      children: [
        inputTyaping(
          text: fristNameText,
          controller: fristNameController,
          hinttext: fristNameHintText,
        ),
        inputTyaping(
          text: lastNameText,
          controller: lastNameController,
          hinttext: lastNameHintText,
        ),
        inputTyaping(
          text: emailIDText,
          controller: emailIdhintController,
          hinttext: emailIDhintText,
        ),
        inputTyaping(
          text: mobileNumbarText,
          controller: mobileNumbarhController,
          hinttext: mobileNumbarhintText,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
        ),
        inputTyaping(
          text: referredmobileNumbarText,
          controller: referredController,
          hinttext: referredNumbarhintText,
        ),
      ],
    ),
  );
}

Widget customCheckbox() {
  return Container(
    height: Get.height * 0.03,
    width: Get.width * 0.07,
    decoration: BoxDecoration(
      color: AppColor.primary,
      border: Border.all(color: AppColor.primary),
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
    ),
    child: Icon(Icons.check, color: AppColor.white, size: 20),
  );
}
