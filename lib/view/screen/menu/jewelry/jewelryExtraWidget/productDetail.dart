// ignore_for_file: file_names, strict_top_level_inference, deprecated_member_use, duplicate_ignore

import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../../controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import '../../../../utils/app_Borderradius.dart';
import '../../../../utils/app_TextSize.dart';
import '../../../../utils/widget/horizontalpaddind.dart';

Widget productDetailsubHedding(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.samisubHedding,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget productDetailsubHedding2(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.samisubHedding,
      fontWeight: FontWeight.w500,
      color: AppColor.editColor,
    ),
  );
}

Widget productDetailtext(text) {
  return Text(text, style: TextStyle(fontWeight: FontWeight.w500));
}

Widget showItemImage(image) {
  return Container(
    padding: EdgeInsets.all(40),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.gray3),
      image: DecorationImage(image: NetworkImage(image)),
    ),
  );
}

Widget sahapeContainer({
  void Function()? onTap,
  required String shape,
  bool isSelected = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.015),
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.009),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.secondary.withOpacity(0.5)
            : Colors.transparent,
        border: Border.all(
          color: isSelected
              ? AppColor.primary.withOpacity(0.5)
              : AppColor.gray5,
        ),
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
      ),
      child: Center(
        child: Text(shape, style: TextStyle(color: Colors.black)),
      ),
    ),
  );
}

Widget caratButton(
  carat, {
  void Function()? onTap,
  bool isSelectcarat = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: Get.width * 0.009),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: (isSelectcarat)
            // ignore: deprecated_member_use
            ? AppColor.secondary.withOpacity(0.3)
            : AppColor.white,
        border: Border.all(color: AppColor.gray5),
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
      ),
      child: Center(
        child: Text(
          carat,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Textsize.small,
          ),
        ),
      ),
    ),
  );
}

Widget metaltypeselect(
  Color? backgroundColor, {
  bool isSelectmetaltype = false,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        border: Border.all(
          color: (isSelectmetaltype) ? AppColor.primary : AppColor.white,
        ),
      ),
      child: CircleAvatar(radius: 12, backgroundColor: backgroundColor),
    ),
  );
}

Widget editValue(text) {
  return GestureDetector(
    child: Container(
      color: AppColor.white,
      padding: EdgeInsetsGeometry.symmetric(horizontal: Get.width * 0.05),
      child: Text(
        text,
        style: TextStyle(color: AppColor.primary, fontSize: Get.width * 0.04),
      ),
    ),
  );
}

Widget changvalue(text, {void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: Get.width * 0.02),
      color: AppColor.primary,
      child: Text(
        text,
        style: TextStyle(color: AppColor.white, fontSize: Get.width * 0.05),
      ),
    ),
  );
}

Widget toggleIcon(text) {
  return Text(
    text,
    style: TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.w500),
  );
}

Widget metalHedding(text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(fontSize: Get.width * 0.033, fontWeight: FontWeight.w500),
  );
}

Widget metalDetailPadding({String? title, String? value}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.height * 0.005),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [productDetailsubHedding2(title), productDetailtext(value)],
    ),
  );
}

Widget imageContainer(ImageController imageController, image) {
  return Column(
    children: [
      imageViwe(imageController),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.009)),
      selectImage(imageController, image),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.009)),
    ],
  );
}

Widget imageViwe(ImageController imageController) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: AppColor.secondary)),
      color: AppColor.gray,
    ),
    child: InteractiveViewer(
      panEnabled: true,
      minScale: 1.0,
      maxScale: 4.0,
      child:
          (imageController.selectedImage.isEmpty)
          ? Center(child: Icon(Icons.image_not_supported, color: Colors.grey))
          : Image.network(
              imageController.selectedImage,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(Icons.image_not_supported, color: Colors.grey),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
            ),
    ),
  );
}

Widget selectImage(ImageController imageController, image) {
  return horizontalPadding(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: Get.width),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(image.length, (index) {
              final img = image[index]['zoom'];
              return GestureDetector(
                onTap: () => imageController.changeImage(index),
                child: Container(
                  margin: EdgeInsets.only(right: Get.width * 0.015),
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.secondary),
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    ),
  );
}

Widget commonHorizontalList({
  required String title,
  required List<Map<String, dynamic>> list,
  required String textKey,
  EdgeInsets? margin,
  Function(Map<String, dynamic>)? onItemSelected,
  required String
  compareKey, // Key to compare for selection (e.g., 'paraMtrName', 'metal', etc.)
  required dynamic
  selectedValue, // Current selected value for this specific list
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.006),
    child: horizontalPadding(
      child: Row(
        children: [
          productDetailsubHedding('$title :- '),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(list.length, (index) {
                  final item = list[index];
                  final value = (item.containsKey(textKey))
                      ? item[textKey]
                      : '';

                  // Check if this item is selected
                  bool isSelected = false;
                  if (compareKey == 'totalWgt') {
                    // For carat, we compare by totalWgt value
                    isSelected =
                        item[compareKey].toString() == selectedValue.toString();
                  } else {
                    isSelected = item[compareKey] == selectedValue;
                  }

                  return GestureDetector(
                    onTap: () {
                      if (onItemSelected != null) {
                        onItemSelected(item);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          borderradius.buttonboder,
                        ),
                        border: Border.all(
                          color: isSelected
                              ? AppColor.primary
                              : AppColor.secondary,
                          width: isSelected ? 1 : 1,
                        ),
                        color: isSelected
                            ? AppColor.secondary.withOpacity(0.3)
                            : Colors.transparent,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.025,
                        vertical: Get.height * 0.005,
                      ),
                      margin:
                          margin ??
                          EdgeInsets.symmetric(horizontal: Get.width * 0.009),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          color: isSelected ? AppColor.primary : Colors.black,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget like({
  required String image,
  required String name,
  required String price,
}) {
  final size = Get.width * 0.35;
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: EdgeInsets.all(Get.width * 0.18),
        margin: EdgeInsets.only(
          left: Get.width * 0.03,
          right: Get.width * 0.02,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.secondary),
          borderRadius: BorderRadius.circular(borderradius.buttonboder),
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(image)),
        ),
      ),
      SizedBox(height: Get.height * 0.005),
      SizedBox(
        width: size,
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        width: size,
        child: Text(
          "\$$price",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColor.primary),
        ),
      ),
    ],
  );
}
