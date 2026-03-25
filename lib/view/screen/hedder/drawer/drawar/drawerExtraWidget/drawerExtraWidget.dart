import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:marquee/marquee.dart';
import '../../../../../utils/app_TextSize.dart';
import '../../../../../utils/widget/logo.dart';

Widget imageDrawer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [image(height: Get.height * 0.02)],
  );
}

Widget allDrawersBody({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(borderradius.boder),
        topLeft: Radius.circular(borderradius.boder),
      ),
    ),
    child: SafeArea(child: child),
  );
}

Widget iconDrawer({
  required String text,
  required String icon,
  bool? dot = false,
  void Function()? onTap,
}) {
  final double size = 16;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(color: AppColor.white),
      child: horizontalPadding(
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
                      text.toUpperCase(),
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
      ),
    ),
  );
}

Widget listColltion({
  int? index,
  required String datalist,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.only(left: Get.width * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '*',
                style: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(right: Get.width * 0.02),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final textStyle = TextStyle(fontSize: Get.width * 0.038);
                    final textSpan = TextSpan(text: datalist, style: textStyle);
                    final textPainter = TextPainter(
                      text: textSpan,
                      maxLines: 1,
                      textDirection: TextDirection.ltr,
                    )..layout(maxWidth: constraints.maxWidth);
                    if (textPainter.didExceedMaxLines) {
                      return SizedBox(
                        height: textStyle.fontSize! * 1.4,
                        child: Marquee(
                          text: datalist,
                          style: textStyle,
                          scrollAxis: Axis.horizontal,
                          velocity: Get.width * 0.08,
                          blankSpace: Get.width * 0.2,
                          pauseAfterRound: Duration(seconds: 1),
                          startPadding: Get.width * 0.02,
                        ),
                      );
                    } else {
                      return Text(datalist, style: textStyle, maxLines: 1);
                    }
                  },
                ),
              ),
            ],
          ),
          Divider(color: AppColor.gray),
        ],
      ),
    ),
  );
}
