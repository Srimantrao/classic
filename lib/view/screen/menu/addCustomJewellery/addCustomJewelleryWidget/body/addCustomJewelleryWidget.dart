// ignore_for_file: file_names, avoid_print

import 'package:classic/controller/user_Interface/menu/addCustomJewellery/addCustomJewellery_Controller.dart';
import 'package:classic/view/screen/menu/addCustomJewellery/addCustomJewelleryExtraWidget/addCustomJewelleryExtraWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/dropdownSelected.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget productType({
  required List<DropdownMenuItem<String>> list,
  required String value,
  required ValueChanged<String?> onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      addCustomJewelleryHeddingText(AppString.productType),
      dropdowns(
        '',
        hinttext: AppString.productType,
        list: list,
        value: value,
        onChanged: onChanged,
        border: Border.all(color: AppColor.gray5),
        fontWeight: FontWeight.w500,
      ),
    ],
  );
}

Widget uploadYourFile({
  required Color imageColor,
  required Color videoColor,
  required Color urlColor,
  required void Function() videoOnTap,
  required void Function() imageOnTap,
  required void Function() urlOnTap,
  required double imageRadius,
  required double videoRadius,
  required double urlRadius,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      addCustomJewelleryHeddingText(AppString.uploadYourImage),
      addCustomJewellerySubHeddingText(AppString.youmay),
      SizedBox(height: Get.height * 0.02),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          roundCircleSelector(
            imageText: AppString.image,
            videoText: AppString.video,
            urlText: AppString.url,
            imageOnTap: imageOnTap,
            videoOnTap: videoOnTap,
            urlOnTap: urlOnTap,
            imageColor: imageColor,
            videoColor: videoColor,
            urlColor: urlColor,
            imageRadius: imageRadius,
            videoRadius: videoRadius,
            urlRadius: urlRadius,
          ),
        ],
      ),
    ],
  );
}

Widget chooseFile({
  required void Function() onTap,
  required String buttonText,
  required TextEditingController yourCommentsController,
  required AddcustomjewelleryUIController addCustomJewellery,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: Get.height * 0.01),
      Row(
        children: [
          Expanded(
            child: chooseFileButton(onTap: onTap, buttonText: buttonText),
          ),
          (addCustomJewellery.selectedFileName.value.isNotEmpty)
              ? Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      addCustomJewellery.selectedFileName.value,
                      style: TextStyle(
                        fontSize: Textsize.normal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
      SizedBox(height: Get.height * 0.01),
      Text(
        AppString.yourComments,
        style: TextStyle(
          fontSize: Textsize.normal,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: Get.height * 0.01),
      Inputfield(
        color: AppColor.gray5,
        hinttext: AppString.yourComments,
        controller: yourCommentsController,
        maxLength: 500,
        height: Get.height * 0.1,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
      ),
    ],
  );
}

Widget addURL({
  required TextEditingController addURlTextController,
  required TextEditingController yourCommentsController,
}) {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.02),
      Inputfield(
        color: AppColor.gray5,
        hinttext: AppString.enterURL,
        controller: addURlTextController,
      ),
      Inputfield(
        color: AppColor.gray5,
        hinttext: AppString.yourComments,
        controller: yourCommentsController,
        maxLength: 500,
        height: Get.height * 0.1,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
      ),
    ],
  );
}

Widget metalDetails({
  required List<DropdownMenuItem<String>> metalTypeList,
  required String metalTypeValue,
  required ValueChanged<String?> metalTypeOnChanged,
  required List<DropdownMenuItem<String>> metalStampList,
  required String metalStampValue,
  required ValueChanged<String?> metalStampOnChanged,
  required TextEditingController appxMetalWeightController,
  required TextEditingController budgetController,
  required TextEditingController engravingController,
  required ValueChanged<String?> ringSizeOnChanged,
  required List<DropdownMenuItem<String>> ringSizeList,
  required String ringSizeValue,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      addCustomJewelleryHeddingText(AppString.productType),
      SizedBox(height: Get.height * 0.02),

      //Metal Type
      selectdropdown(
        AppString.metalType,
        list: metalTypeList,
        value: metalTypeValue,
        onChanged: metalTypeOnChanged,
        hinttext: AppString.metalType,
      ),

      //Metal Stamp
      selectdropdown(
        AppString.metalStamp,
        list: metalStampList,
        value: metalStampValue,
        onChanged: metalStampOnChanged,
        hinttext: AppString.metalStamp,
      ),

      //Approximate Metal Weight
      inputString(
        controller: appxMetalWeightController,
        text: AppString.appxMetalWeight,
        hinttext: AppString.appxMetalWeight,
      ),

      //Budget
      inputString(
        text: AppString.budget,
        hinttext: AppString.budget,
        controller: budgetController,
        maxLength: 5,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),

      //Engraving
      inputString(
        controller: engravingController,
        text: AppString.engraving,
        hinttext: AppString.engraving,
      ),

      //Ring Size
      selectdropdown(
        AppString.ringSize,
        list: ringSizeList,
        value: ringSizeValue,
        onChanged: ringSizeOnChanged,
        hinttext: AppString.selectRingSize,
      ),
    ],
  );
}

Widget diamondAndGemstoneDetails({
  required String isCenterStonetext,
  required bool isCenterStonevalue,
  required void Function(bool?) isCenterStoneonChanged,
  required String isSideStonetext,
  required bool isSideStonevalue,
  required void Function(bool?) isSideStoneonChanged,
}) {
  return Column(
    children: [
      addCustomJewelleryHeddingText(AppString.diamondAndGemstoneDetails),
      checkBoxWidget(
        isCenterStonetext: isCenterStonetext,
        isCenterStonevalue: isCenterStonevalue,
        isCenterStoneonChanged: isCenterStoneonChanged,
        isSideStonetext: isSideStonetext,
        isSideStonevalue: isSideStonevalue,
        isSideStoneonChanged: isSideStoneonChanged,
      ),
    ],
  );
}
