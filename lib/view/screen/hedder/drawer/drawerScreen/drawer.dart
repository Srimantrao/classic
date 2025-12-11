import 'package:classic/view/screen/hedder/drawer/drawerWidget/body/drawarBody.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});

  @override
  Widget build(BuildContext context) {
    return allDrawersBody(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageDrawer(),
          Divider(color: AppColor.gray),
          SizedBox(height: Get.height * 0.015),
          iconDrawer(
            text: AppString.myAccount,
            icon: AppIcon.user1,
          ),
          iconDrawer(
            text: AppString.enagagement,
            icon: AppIcon.weddingRing,
            dot: true,
          ),
          iconDrawer(
            text: AppString.weddingbands,
            icon: AppIcon.weddingRing,
            dot: true,
          ),
          iconDrawer(
            text: AppString.jewellwery,
            icon: AppIcon.jewelry,
            dot: true,
          ),
          iconDrawer(
            text: AppString.diamond,
            icon: AppIcon.diamond,
            dot: true,
          ),
          iconDrawer(
            text: AppString.shopebymetal,
            icon: AppIcon.jewelry,
            dot: true,
          ),
          iconDrawer(
            text: AppString.show,
            icon: AppIcon.hold,
            dot: true,
          ),
          iconDrawer(
            text: AppString.findstore,
            icon: AppIcon.findstore1,
            dot: true,
          ),
          iconDrawer(
            text: AppString.logout,
            icon: AppIcon.logout,
          ),
        ],
      ),
    );
  }
}
