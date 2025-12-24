// ignore_for_file: file_names, strict_top_level_inference, non_constant_identifier_names

import 'package:classic/controller/user_Interface/menu/dashboard/diamondDetail_Controller.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../../utils/widget/button.dart';
import '../../../../../utils/widget/horizontalpaddind.dart';
import '../../dashbordExtraWidget/diamondDetailExtraWidget.dart';

//Button
Widget selectButton(diamonddetail) {
  return horizontalPadding(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.02),
        Row(
          children: [
            Expanded(
              child: button(
                AppString.image,
                onTap: diamonddetail.selectImage,
                borderColor: (diamonddetail.isSelectImage.value)
                    ? AppColor.primary
                    : AppColor.gray5,
                textColor: (diamonddetail.isSelectImage.value)
                    ? AppColor.white
                    : AppColor.black,
                backgroundColor: (diamonddetail.isSelectImage.value)
                    ? AppColor.primary
                    : AppColor.white,
                isLowercase: true,
              ),
            ),
            SizedBox(width: Get.width * 0.02),
            Expanded(
              child: button(
                AppString.video,
                onTap: diamonddetail.selectVideo,
                borderColor: (diamonddetail.isSelectVideo.value)
                    ? AppColor.primary
                    : AppColor.gray5,
                textColor: (diamonddetail.isSelectVideo.value)
                    ? AppColor.white
                    : AppColor.black,
                backgroundColor: (diamonddetail.isSelectVideo.value)
                    ? AppColor.primary
                    : AppColor.white,
                isLowercase: true,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//Image & Video
Widget imageAndVideo({
  required DiamondDetailUIController diamonddetail,
  required Widget video,
  required String image,
}) {
  return horizontalPadding(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.02),
        Stack(
          children: [
            Container(
              // height: Get.width * 0.85,
              // width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderradius.buttonboder),
                border: Border.all(color: AppColor.secondary),
                image: (diamonddetail.isSelectImage.value)
                    ? DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: (diamonddetail.isSelectImage.value)
                    ? null
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(
                          borderradius.buttonboder,
                        ),
                        child: video,
                      ),
              ),
            ),
            Positioned(
              top: Get.height * 0.02,
              right: Get.width * 0.04,
              child: Image.asset(
                AppIcon.wishlist,
                width: Get.width * 0.065,
                height: Get.width * 0.065,
                color: AppColor.gray,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//selected Details
Widget selectedDetails(diamonddetail) {
  return horizontalPadding(
    child: Row(
      children: [
        Expanded(
          child: button(
            AppString.details,
            onTap: diamonddetail.selectDetails,
            backgroundColor: diamonddetail.isSelectDetails.value
                ? AppColor.primary
                : AppColor.white,
            textColor: diamonddetail.isSelectDetails.value
                ? AppColor.white
                : AppColor.black,
            borderColor: diamonddetail.isSelectDetails.value
                ? AppColor.primary
                : AppColor.gray5,
          ),
        ),
        SizedBox(width: Get.width * 0.02),
        Expanded(
          child: button(
            AppString.measurements,
            onTap: diamonddetail.selectMeasurements,
            backgroundColor: diamonddetail.isSelectMeasurements.value
                ? AppColor.primary
                : AppColor.white,
            textColor: diamonddetail.isSelectMeasurements.value
                ? AppColor.white
                : AppColor.black,
            borderColor: diamonddetail.isSelectMeasurements.value
                ? AppColor.primary
                : AppColor.gray5,
          ),
        ),
        SizedBox(width: Get.width * 0.02),
        Expanded(
          child: button(
            AppString.inclusion,
            onTap: diamonddetail.selectInclusion,
            backgroundColor: diamonddetail.isSelectInclusion.value
                ? AppColor.primary
                : AppColor.white,
            textColor: diamonddetail.isSelectInclusion.value
                ? AppColor.white
                : AppColor.black,
            borderColor: diamonddetail.isSelectInclusion.value
                ? AppColor.primary
                : AppColor.gray5,
          ),
        ),
      ],
    ),
  );
}

//Show Detail
Widget showDetail({
  required String carat,
  required String cut,
  required String shape,
  required String lab,
  required String colorCode,
  required String clarity,
  required String fluorescence,
  required String polish,
  required String symmetry,
  required String location,
}) {
  return horizontalPadding(
    child: Column(
      children: [
        grayContainer(
          color: AppColor.gray3,
          leftlable: AppString.shape,
          leftvalue: shape,
          rightlable: AppString.lab,
          rightvalue: lab,
        ),
        grayContainer(
          color: AppColor.gray,
          leftlable: AppString.color,
          leftvalue: colorCode,
          rightlable: AppString.clarity,
          rightvalue: clarity,
        ),
        grayContainer(
          color: AppColor.gray3,
          leftlable: AppString.carat,
          leftvalue: carat,
          rightlable: AppString.cut,
          rightvalue: cut,
        ),
        grayContainer(
          color: AppColor.gray,
          leftlable: AppString.fluorescence,
          leftvalue: fluorescence,
          rightlable: AppString.polish,
          rightvalue: 'Round',
        ),
        grayContainer(
          color: AppColor.gray3,
          leftlable: AppString.symmetry,
          leftvalue: symmetry,
          rightlable: AppString.location,
          rightvalue: location,
        ),
      ],
    ),
  );
}

//Show Measurements
Widget showMeasurements({
  required String measure,
  required String table,
  required String crheight,
  required String crandwidth,
  required String depth,
  required String pavAngle,
  required String girdle,
}) {
  return horizontalPadding(
    child: Column(
      children: [
        grayContainer(
          color: AppColor.gray3,
          leftlable: AppString.measure,
          leftvalue: measure,
          rightlable: AppString.crheight,
          rightvalue: crheight,
        ),
        grayContainer(
          color: AppColor.gray,
          leftlable: AppString.table,
          leftvalue: table,
          rightlable: AppString.crandwidth,
          rightvalue: crandwidth,
        ),
        grayContainer(
          color: AppColor.gray3,
          leftlable: AppString.depth,
          leftvalue: depth,
          rightlable: AppString.pavAngle,
          rightvalue: pavAngle,
        ),
        grayContainer(
          color: AppColor.gray,
          leftlable: AppString.girdle,
          leftvalue: girdle,
          rightlable: AppString.pavDepth,
          rightvalue: pavAngle,
        ),
      ],
    ),
  );
}

//Show Inclusion
Widget showInclusion({
  required String brown,
  required String openT,
  required String blaclkT,
  required String tableInc,
  required String DTLEligble,
  required String culetSize,
  required String openc,
  required String blaclkS,
  required String openp,
  required String openg,
  required String laser,
  required String hnA,
  required String openG,
  required String openP,
  required String openC,
}) {
  return horizontalPadding(
    child: Column(
      children: [
        grayContainer(
          color: AppColor.gray3,
          leftlable: AppString.brown,
          leftvalue: brown,
          rightlable: AppString.openT,
          rightvalue: openT,
        ),
        grayContainer(
          color: AppColor.gray,
          leftlable: AppString.blaclkT,
          leftvalue: blaclkT,
          rightlable: AppString.openc,
          rightvalue: openc,
        ),
        grayContainer(
          color: AppColor.gray3,
          leftlable: AppString.blaclkS,
          leftvalue: blaclkS,
          rightlable: AppString.openg,
          rightvalue: openg,
        ),
        grayContainer(
          color: AppColor.gray,
          leftlable: AppString.tableInc,
          leftvalue: tableInc,
          rightlable: AppString.openp,
          rightvalue: openp,
        ),
        grayContainer(
          color: AppColor.gray,
          leftlable: AppString.DTLEligble,
          leftvalue: DTLEligble,
          rightlable: AppString.laser,
          rightvalue: laser,
        ),
        grayContainer(
          color: AppColor.gray,
          leftlable: AppString.culetSize,
          leftvalue: culetSize,
          rightlable: AppString.hnA,
          rightvalue: hnA,
        ),
      ],
    ),
  );
}
