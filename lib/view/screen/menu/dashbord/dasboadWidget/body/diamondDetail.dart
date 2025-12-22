// ignore_for_file: file_names, strict_top_level_inference

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
                border: Border.all(color: AppColor.gray5),
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
