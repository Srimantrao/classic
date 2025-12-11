import 'package:classic/view/screen/hedder/drawer/drawerWidget/body/drawarBody.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/logo.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [image(height: Get.height * 0.02)],
          ),
          Divider(color: AppColor.gray),
          SizedBox(height: Get.height * 0.015),
          iconDrawer(text: AppString.myAccount, icon: AppIcon.user1),
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
          iconDrawer(text: AppString.diamond, icon: AppIcon.diamond, dot: true),
          iconDrawer(
            text: AppString.shopebymetal,
            icon: AppIcon.jewelry,
            dot: true,
          ),
          iconDrawer(text: AppString.show, icon: AppIcon.hold, dot: true),
          iconDrawer(
            text: AppString.findstore,
            icon: AppIcon.findstore1,
            dot: true,
          ),
          iconDrawer(text: AppString.logout, icon: AppIcon.logout),
        ],
      ),
    );
  }
}

Widget iconDrawer({
  required String text,
  required String icon,
  bool? dot = false,
}) {
  final double size = 16;
  return horizontalPadding(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(
                      borderradius.buttonboder,
                    ),
                  ),
                  child: Image(
                    image: AssetImage(icon),
                    color: AppColor.white,
                    width: size,
                    height: size,
                  ),
                ),
                SizedBox(width: Get.width * 0.05),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Textsize.normal,
                  ),
                ),
              ],
            ),
            (dot == true)
                ? CircleAvatar(radius: 2, backgroundColor: AppColor.primary)
                : SizedBox(),
          ],
        ),
        Divider(color: AppColor.gray),
      ],
    ),
  );
}
