// ignore_for_file: strict_top_level_inference, avoid_unnecessary_containers

import 'package:classic/view/screen/menu/jewelry/jewelryScreen/product.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:marquee/marquee.dart';
import '../../../../../utils/app_TextSize.dart';
import '../../../../../utils/widget/logo.dart';

Widget itemSelection(
  metaltype,
  stamps, {
  required void Function() onTapStamp,
  void Function(String metalType)? onMetalSelected,
  void Function(String metalStamp)? onStampSelected,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.009),
    child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: metaltype.length,
      itemBuilder: (context, index) {
        var metalItem = metaltype[index];
        return metalItemWidget(
          metalItem,
          stamps,
          onTapStamp: onTapStamp,
          onMetalSelected: onMetalSelected,
          onStampSelected: onStampSelected,
        );
      },
    ),
  );
}

Widget metalItemWidget(
  metalItem,
  stamps, {
  required void Function() onTapStamp,
  void Function(String metalType)? onMetalSelected,
  void Function(String metalStamp)? onStampSelected,
}) {
  final metalName = metalItem['metal'] ?? '';

  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.005),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            onMetalSelected?.call(metalName);
          },
          child: metalTitleRow(metalName),
        ),
        SizedBox(height: Get.height * 0.005),
        stampWrapWidget(
          stamps,
          onTapStamp,
          metalType: metalName,
          onStampSelected: onStampSelected,
          onMetalSelected: onMetalSelected,
        ),
      ],
    ),
  );
}

Widget metalTitleRow(String? metal) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          color: getMetalColor(metal ?? ""),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(5),
      ),
      SizedBox(width: Get.width * 0.025),
      subTitalHedding(metal ?? ""),
    ],
  );
}

Widget stampWrapWidget(
  stamps,
  void Function() onTapStamp, {
  String? metalType,
  void Function(String metalStamp)? onStampSelected,
  void Function(String metalType)? onMetalSelected,
}) {
  return Wrap(
    spacing: Get.width * 0.025,
    runSpacing: 5,
    children: List.generate(stamps.length, (i) {
      final stampName = stamps[i]['paraMtrName']?.toString() ?? "";
      return GestureDetector(
        onTap: () {
          if (metalType != null && metalType.isNotEmpty) {
            onMetalSelected?.call(metalType);
          }
          onStampSelected?.call(stampName);
          onTapStamp();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.gray),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: subTitalHedding(stampName, fontSize: Textsize.samisubHedding),
        ),
      );
    }),
  );
}

Color getMetalColor(String metal) {
  metal = metal.toLowerCase();
  if (metal.contains("rose")) {
    return AppColor.roseGold;
  } else if (metal.contains("yellow")) {
    return AppColor.yellowGold;
  } else if (metal.contains("white")) {
    return AppColor.silveGold;
  } else {
    return Colors.black;
  }
}

Widget imageDrawer(void Function()? onTap) {
  return horizontalPadding(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: Get.width * 0.025),
        image(height: Get.height * 0.02),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsetsDirectional.symmetric(
              vertical: Get.height * 0.03,
              horizontal: Get.width * 0.005,
            ),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Icon(Icons.cancel_outlined, color: AppColor.primary),
          ),
        ),
      ],
    ),
  );
}

Widget style(subCategories, engagementCategory) {
  return padddingVartival(
    child: gridViweing(
      itemCount: subCategories.length,
      itemBuilder: (BuildContext context, int index) {
        return styleWidget(
          text: (subCategories[index]['categoryName'] ?? "")
              .toString()
              .toUpperCase(),
          onTap: () {
            Get.to(
              () => Product(
                categoryId: engagementCategory['_id'],
                subCategoryId: subCategories[index]['_id'],
                categoryName: subCategories[index]['categoryName'],
              ),
            );
          },
        );
      },
    ),
  );
}

Widget gridViweing({
  int? itemCount,
  required Widget? Function(BuildContext, int) itemBuilder,
}) {
  return GridView.builder(
    itemCount: itemCount,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 1,
      childAspectRatio: 6,
    ),
    itemBuilder: itemBuilder,
  );
}

Widget shape(filteredShapeList) {
  return padddingVartival(
    child: gridViweing(
      itemCount: filteredShapeList.length,
      itemBuilder: (BuildContext p1, int p2) {
        return subTitalHedding(
          (filteredShapeList[p2]['paraMtrName']).toString().toUpperCase(),
          fontSize: Textsize.samisubHedding,
        );
      },
    ),
  );
}

Widget styleWidget({String? text, void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: subTitalHedding(text, fontSize: Textsize.samisubHedding),
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
  final double size = 27;
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
                        fontWeight: FontWeight.w600,
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
                    final textStyle = TextStyle(
                      fontSize: Get.width * 0.038,
                      fontWeight: FontWeight.w500,
                    );
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

Widget drawarDivider() => Divider(color: AppColor.gray);

Widget padddingsubhedding({required Widget child}) {
  return Padding(
    padding: EdgeInsetsGeometry.only(
      left: Get.width * 0.07,
      right: Get.width * 0.03,
    ),
    child: child,
  );
}

Widget subheedingText(text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: Get.width * 0.042,
        ),
      ),
      dot(),
    ],
  );
}

Widget dot() {
  return CircleAvatar(radius: 2, backgroundColor: AppColor.primary);
}

Widget productBand({
  void Function()? metalonTap,
  void Function()? styleonTap,
  void Function()? shapeonTap,
  void Function()? viweButtononTap,
  bool? metalvisible,
  bool? stylevisible,
  bool? shapvisible,
  Widget? metalvisiblechild,
  Widget? stylevisiblechild,
  Widget? shapvisiblechild,
}) {
  return padddingsubhedding(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: metalonTap,
          child: Container(
            color: Colors.transparent,
            child: subheedingText(AppString.shopbyMetal),
          ),
        ),
        Visibility(
          visible: metalvisible ?? false,
          child: metalvisiblechild ?? SizedBox(),
        ),
        drawarDivider(),
        GestureDetector(
          onTap: styleonTap,
          child: Container(
            color: Colors.transparent,
            child: subheedingText(AppString.shopbyStyle),
          ),
        ),
        Visibility(
          visible: stylevisible ?? false,
          child: stylevisiblechild ?? SizedBox(),
        ),
        drawarDivider(),
        GestureDetector(
          onTap: shapeonTap,
          child: Container(
            color: Colors.transparent,
            child: subheedingText(AppString.shape),
          ),
        ),
        Visibility(
          visible: shapvisible ?? false,
          child: shapvisiblechild ?? SizedBox(),
        ),
        drawarDivider(),
        button(AppString.viewAll, onTap: viweButtononTap),
        Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.015)),
      ],
    ),
  );
}

Widget subTitalHedding(text, {double? fontSize, FontWeight? fontWeight}) {
  return Text(
    text,
    style: TextStyle(
      color: AppColor.black,
      fontSize: fontSize ?? Textsize.samiHedding,
      fontWeight: fontWeight ?? FontWeight.w500,
    ),
  );
}

Widget padddingVartival({required Widget child}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
    child: child,
  );
}

/*

Widget itemSelection(metaltype, stamps) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.009),
    child: Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: metaltype.length,
          itemBuilder: (BuildContext context, int index) {
            var metalItem = metaltype[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.005),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.003),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: getMetalColor(
                              metalItem['metal']?.toString() ?? "",
                            ),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsetsGeometry.all(5),
                        ),
                        SizedBox(width: 8),
                        Text(
                          metalItem['metal']?.toString() ?? "",
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: Textsize.samiHedding,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.003),
                    child: Wrap(
                      spacing: Get.width * 0.025,
                      runSpacing: 5,
                      children: List.generate(stamps.length, (i) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.gray),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          child: Text(
                            stamps[i]['paraMtrName']?.toString() ?? "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    ),
  );
}

*/
