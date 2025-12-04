// ignore_for_file: file_names

import 'package:classic/controller/user_Interface/menu/addCustomJewellery/addCustomJewellery_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/view/screen/menu/addCustomJewellery/addCustomJewelleryWidget/body/addCustomJewelleryWidget.dart';
import 'package:classic/view/screen/menu/addCustomJewellery/addCustomJewelleryWidget/headder/appbar.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomJewellery extends StatelessWidget {
  final addCustomJewellery = Get.put(AddcustomjewelleryUIController());
  final diamondList = DiamondList();
  AddCustomJewellery({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: appBarAddCustomJewellery(
        prefixIcon: AppIcon.newcart,
        suffixIcon: AppIcon.drawer,
        hedding: AppString.addCustomJewellery,
      ),
      child: SingleChildScrollView(
        child: horizontalPadding(
          child: Obx(() {
            return Column(
              children: [
                SizedBox(height: Get.height * 0.02),
                //Product Type Dropdown
                productType(
                  list: addCustomJewellery.getProductTypeItems(),
                  value: addCustomJewellery.productType.value,
                  onChanged: addCustomJewellery.productTypeValueChange,
                ),

                //Upload Your Image, Video, URL Section Start
                //Upload Your File
                uploadYourFile(
                  imageColor: addCustomJewellery.selectedImageType.value
                      ? AppColor.primary
                      : AppColor.gray,
                  videoColor: addCustomJewellery.selectedVideoType.value
                      ? AppColor.primary
                      : AppColor.gray3,
                  urlColor: addCustomJewellery.selectedURLType.value
                      ? AppColor.primary
                      : AppColor.gray3,
                  videoOnTap: () => addCustomJewellery.selectVideoType(),
                  imageOnTap: () => addCustomJewellery.selectImageType(),
                  urlOnTap: () => addCustomJewellery.selectURLType(),
                  imageRadius: addCustomJewellery.selectedImageType.value
                      ? 7
                      : 9,
                  videoRadius: addCustomJewellery.selectedVideoType.value
                      ? 7
                      : 9,
                  urlRadius: addCustomJewellery.selectedURLType.value ? 7 : 9,
                ),

                //Additional Details
                //Image
                (addCustomJewellery.selectedImageType.value)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          chooseFile(
                            onTap: () => addCustomJewellery.pickImageFile(),
                            buttonText: AppString.chooseFile,
                            yourCommentsController:
                                addCustomJewellery.yourCommentsController,
                            addCustomJewellery: addCustomJewellery,
                          ),
                          SizedBox(height: Get.height * 0.02),
                        ],
                      )
                    : SizedBox(),

                //video
                (addCustomJewellery.selectedVideoType.value)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          chooseFile(
                            onTap: () => addCustomJewellery.pickVideoFile(),
                            buttonText: AppString.chooseFile,
                            yourCommentsController:
                                addCustomJewellery.yourCommentsController,
                            addCustomJewellery: addCustomJewellery,
                          ),
                          SizedBox(height: Get.height * 0.02),
                        ],
                      )
                    : SizedBox(),

                (addCustomJewellery.selectedURLType.value)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addURL(
                            addURlTextController:
                                addCustomJewellery.addURlTextController,
                            yourCommentsController:
                                addCustomJewellery.yourCommentsController,
                          ),
                          SizedBox(height: Get.height * 0.02),
                        ],
                      )
                    : SizedBox(),
                //Upload Your Image, Video, URL Section End

                //Metal Details Start
                metalDetails(
                  metalTypeList: addCustomJewellery.getMetalTypeItems(),
                  metalTypeValue: addCustomJewellery.metalType.value,
                  metalTypeOnChanged: addCustomJewellery.metalTypeValueChange,
                  metalStampList: addCustomJewellery.getMetalStampItems(),
                  metalStampValue: addCustomJewellery.metalStamp.value,
                  metalStampOnChanged: addCustomJewellery.metalStampValueChange,
                  ringSizeOnChanged:
                      addCustomJewellery.selectRingSizeValueChange,
                  ringSizeList: addCustomJewellery.getSelectRingSizeItems(),
                  ringSizeValue: addCustomJewellery.ringSize.value,
                  appxMetalWeightController:
                      addCustomJewellery.appxMetalWeightController,
                  budgetController: addCustomJewellery.budgetController,
                  engravingController: addCustomJewellery.engravingController,
                ),
                //Metal Details End

                //Diamond And Gemstone Detail Start
                diamondAndGemstoneDetails(
                  isCenterStonevalue: addCustomJewellery.isCenterStone.value,
                  isSideStonevalue: addCustomJewellery.isSideStone.value,
                  isCenterStonetext: AppString.centerStone,
                  isCenterStoneonChanged: (value) {
                    addCustomJewellery.toggleCenterStone(value);
                  },
                  isSideStonetext: AppString.sideStone,
                  isSideStoneonChanged: (value) {
                    addCustomJewellery.toggleSideStone(value);
                  },
                  colorText: AppString.iscolor,
                  isCenterColorvalue: addCustomJewellery.isColor.value,
                  isSideColorChanged: (value) {
                    addCustomJewellery.toggleIsColor(value);
                  },
                  diamondSearch: addCustomJewellery,
                  shapetext: AppString.shape,
                  colorSearch: addCustomJewellery,
                  colortext: AppString.color,
                  claritySearch: addCustomJewellery,
                  claritytext: AppString.clarity,
                ),

                //Diamond And Gemstone Detail End
              ],
            );
          }),
        ),
      ),
    );
  }
}
