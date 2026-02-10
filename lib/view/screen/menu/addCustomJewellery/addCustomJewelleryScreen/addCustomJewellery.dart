// ignore_for_file: file_names

import 'package:classic/controller/user_Interface/menu/addCustomJewellery/addCustomJewellery_Controller.dart';
import 'package:classic/modal/menu/diamondSearch/diamondSearch.dart';
import 'package:classic/view/screen/hedder/cart/cartScreen/cart.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/drawer.dart';
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
  final addCustom = Get.put(AddcustomjewelleryUIController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final diamondList = DiamondList();
  AddCustomJewellery({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      scaffoldKey: scaffoldKey,
      endDrawer: Drawers(),
      appBar: appBarAddCustomJewellery(
        prefixOnTap: () => Get.to(() => Cart()),
        prefixIcon: AppIcon.newcart,
        suffixIcon: AppIcon.drawer,
        hedding: AppString.addCustomJewellery,
        suffixOnTap: () => scaffoldKey.currentState?.openEndDrawer(),
      ),
      child: SingleChildScrollView(
        child: horizontalPadding(
          child: Obx(() {
            return Column(
              children: [
                SizedBox(height: Get.height * 0.02),
                //Product Type Dropdown
                productType(
                  list: addCustom.getProductTypeItems(),
                  value: addCustom.productType.value,
                  onChanged: addCustom.productTypeValueChange,
                ),

                //Upload Your Image, Video, URL Section Start
                //Upload Your File
                uploadYourFile(
                  imageColor: addCustom.selectedImageType.value
                      ? AppColor.primary
                      : AppColor.gray,
                  videoColor: addCustom.selectedVideoType.value
                      ? AppColor.primary
                      : AppColor.gray3,
                  urlColor: addCustom.selectedURLType.value
                      ? AppColor.primary
                      : AppColor.gray3,
                  videoOnTap: () => addCustom.selectVideoType(),
                  imageOnTap: () => addCustom.selectImageType(),
                  urlOnTap: () => addCustom.selectURLType(),
                  imageRadius: addCustom.selectedImageType.value ? 7 : 9,
                  videoRadius: addCustom.selectedVideoType.value ? 7 : 9,
                  urlRadius: addCustom.selectedURLType.value ? 7 : 9,
                ),

                //Additional Details
                //Image
                (addCustom.selectedImageType.value)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          chooseFile(
                            onTap: () => addCustom.pickImageFile(),
                            buttonText: AppString.chooseFile,
                            yourCommentsController:
                                addCustom.yourCommentsController,
                            addCustomJewellery: addCustom,
                          ),
                          SizedBox(height: Get.height * 0.02),
                        ],
                      )
                    : SizedBox(),

                //video
                (addCustom.selectedVideoType.value)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          chooseFile(
                            onTap: () => addCustom.pickVideoFile(),
                            buttonText: AppString.chooseFile,
                            yourCommentsController:
                                addCustom.yourCommentsController,
                            addCustomJewellery: addCustom,
                          ),
                          SizedBox(height: Get.height * 0.02),
                        ],
                      )
                    : SizedBox(),

                //URL
                (addCustom.selectedURLType.value)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addURL(
                            addURlTextController:
                                addCustom.addURlTextController,
                            yourCommentsController:
                                addCustom.yourCommentsController,
                          ),
                          SizedBox(height: Get.height * 0.02),
                        ],
                      )
                    : SizedBox(),
                //Upload Your Image, Video, URL Section End

                //Metal Details Start
                metalDetails(
                  metalTypeList: addCustom.getMetalTypeItems(),
                  metalTypeValue: addCustom.metalType.value,
                  metalTypeOnChanged: addCustom.metalTypeValueChange,
                  metalStampList: addCustom.getMetalStampItems(),
                  metalStampValue: addCustom.metalStamp.value,
                  metalStampOnChanged: addCustom.metalStampValueChange,
                  ringSizeOnChanged: addCustom.selectRingSizeValueChange,
                  ringSizeList: addCustom.getSelectRingSizeItems(),
                  ringSizeValue: addCustom.ringSize.value,
                  appxMetalWeightController:
                      addCustom.appxMetalWeightController,
                  budgetController: addCustom.budgetController,
                  engravingController: addCustom.engravingController,
                ),
                //Metal Details End

                //Diamond And Gemstone Detail Start
                diamondAndGemstoneDetails(
                  isCenterStonevalue: addCustom.isCenterStone.value,
                  isSideStonevalue: addCustom.isSideStone.value,
                  isCenterStonetext: AppString.centerStone,
                  isCenterStoneonChanged: (value) {
                    addCustom.toggleCenterStone(value);
                  },
                  isSideStonetext: AppString.sideStone,
                  isSideStoneonChanged: (value) {
                    addCustom.toggleSideStone(value);
                  },
                  colorText: AppString.iscolor,
                  isCenterColorvalue: addCustom.isColor.value,
                  isSideColorChanged: (value) {
                    addCustom.toggleIsColor(value);
                  },
                  diamondSearch: addCustom,
                  shapetext: AppString.shape,
                  colorSearch: addCustom,
                  colortext: AppString.color,
                  claritySearch: addCustom,
                  claritytext: AppString.clarity,
                  stoneUpdate: addCustom,
                ),

                //Diamond And Gemstone Detail End
                contactInformation(
                  fristNameText: AppString.fristname,
                  fristNameController: addCustom.fristNameController,
                  fristNameHintText: AppString.fristname_hint,
                  lastNameText: AppString.lastname,
                  lastNameHintText: AppString.lastname_hint,
                  lastNameController: addCustom.lastNameController,
                  emailIDText: AppString.emailId,
                  emailIDhintText: AppString.emailId_hint,
                  emailIdhintController: addCustom.emailController,
                  mobileNumbarText: AppString.mobileNo,
                  mobileNumbarhintText: AppString.mobile_hint,
                  mobileNumbarhController: addCustom.mobileController,
                  referredmobileNumbarText: AppString.refereddby,
                  referredNumbarhintText: AppString.refereddby_hint,
                  referredController: addCustom.referredController,
                ),

                submitButton(AppString.submit),
              ],
            );
          }),
        ),
      ),
    );
  }
}
