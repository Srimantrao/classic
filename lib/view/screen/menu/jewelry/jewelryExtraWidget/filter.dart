// ignore_for_file: strict_top_level_inference, unnecessary_import, unnecessary_underscores

import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../controller/user_Interface/menu/jewelry/filter_Controller.dart';
import '../../../../utils/app_Borderradius.dart';
import '../../../../utils/app_Color.dart';
import '../../diamondSearch/diamondSearchExtraWidget/diamondExtraWidget.dart';

Widget heddingFilter(text) {
  return shapeHedding(text);
}

Widget srinc(List<Widget> children) {
  return Wrap(spacing: 10, runSpacing: 10, children: children);
}

Widget filterContainer({
  void Function()? onTap,
  bool isSelected = false,
  required String name,
  String? image,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.04,
        vertical: Get.height * 0.010,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : AppColor.white,
        borderRadius: BorderRadius.circular(borderradius.buttonboder),
        border: Border.all(
          color: isSelected ? AppColor.primary : AppColor.secondary,
        ),
      ),
      child: Column(
        children: [
          if (image != null && image.isNotEmpty)
            Image.network(
              image,
              scale: 3,
              errorBuilder: (_, __, ___) => Icon(Icons.image_not_supported),
            ),
          Text(
            name,
            style: TextStyle(
              fontSize: Textsize.samisubHedding,
              color: isSelected ? AppColor.white : AppColor.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

// Widget showContainer({
//   required String heding,
//   required List listing,
//   required String listingName,
//   required FilterUIController filter,
//   required RxString selectedValue,
//   required void Function(String value) onSelect,
//   String? image,
// }) {
//   return Align(
//     alignment: Alignment.topLeft,
//     child: horizontalPadding(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.01)),
//           heddingFilter(heding),
//           Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.01)),
//           srinc(
//             List.generate(listing.length, (index) {
//               final item = listing[index];
//               final itemName = item[listingName];
//               final image = item['images'];
//               return filterContainer(
//                 image: image,
//                 name: itemName,
//                 onTap: () => onSelect(itemName),
//                 isSelected: selectedValue.value == itemName,
//               );
//             }),
//           ),
//           SizedBox(height: Get.height * 0.01),
//         ],
//       ),
//     ),
//   );
// }

Widget showContainer({
  required String heding,
  required List listing,
  required String nameKey,
  required String idKey,
  required RxString selectedValue,
  required void Function(String id) onSelect,
}) {
  return Align(
    alignment: Alignment.topLeft,
    child: horizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.01)),
          heddingFilter(heding),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01)),
          srinc(
            List.generate(listing.length, (index) {
              final item = listing[index];
              final String id = item[idKey];
              final String name = item[nameKey];
              final image = item['images'];
              return filterContainer(
                image: image,
                name: name,
                isSelected: selectedValue.value == id,
                onTap: () => onSelect(id),
              );
            }),
          ),
        ],
      ),
    ),
  );
}

Widget metalType({
  required List metalTypes,
  required FilterUIController filter,
}) {
  return Obx(() {
    return showContainer(
      heding: AppString.metalType,
      listing: metalTypes,
      nameKey: 'metal',
      idKey: '_id',
      selectedValue: filter.selectedMetalType,
      onSelect: filter.selectMetalType,
    );
  });
}

Widget metalStamps({
  required List metalStamps,
  required FilterUIController filter,
}) {
  return Obx(() {
    return showContainer(
      heding: AppString.metalStamp,
      listing: metalStamps,
      selectedValue: filter.selectedMetalStamp,
      onSelect: filter.selectMetalStamp,
      nameKey: 'paraMtrName',
      idKey: '_id',
    );
  });
}

Widget shape({
  required List shapes,
  required FilterUIController filter,
  String? image,
}) {
  return Obx(() {
    return showContainer(
      heding: AppString.shape,
      listing: shapes,
      selectedValue: filter.selectedShapes,
      onSelect: filter.selectShapes,
      nameKey: 'paraMtrName',
      idKey: '_id',
    );
  });
}

Widget stone({required List stone, required FilterUIController filter}) {
  return Obx(() {
    return showContainer(
      heding: AppString.stone,
      listing: stone,
      selectedValue: filter.selectedStoneTypes,
      onSelect: filter.selectStoneTypes,
      nameKey: 'paraMtrName',
      idKey: '_id',
    );
  });
}

Widget sortContainer(text, {required bool isSelected}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: Get.width * 0.05,
      vertical: Get.height * 0.012,
    ),
    decoration: BoxDecoration(
      color: isSelected ? AppColor.primary : AppColor.white,
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
      border: Border.all(color: AppColor.gray5),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: isSelected ? AppColor.white : AppColor.black,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        fontSize: Textsize.samisubHedding,
      ),
    ),
  );
}

Widget divider() {
  return Divider(color: AppColor.secondary, thickness: 1);
}


Widget shimmeContainer() {
  return horizontalPadding(
    child: Column(
      children: [
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.03)),
        Row(children: [shemmerWidget()]),
        Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.03)),
        Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    shemmerWidget(),
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: Get.width * 0.03),
                    ),
                    shemmerWidget(),
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: Get.width * 0.03),
                    ),
                    shemmerWidget(width: Get.width * 0.13),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsetsGeometry.only(top: Get.height * 0.01)),
            Row(
              children: [
                shemmerWidget(),
                Padding(
                  padding: EdgeInsetsGeometry.only(left: Get.width * 0.03),
                ),
                shemmerWidget(),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget shemmerWidget({double? width}) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: Get.height * 0.02,
      horizontal: width ?? Get.width * 0.15,
    ),
    color: AppColor.gray,
  );
}
