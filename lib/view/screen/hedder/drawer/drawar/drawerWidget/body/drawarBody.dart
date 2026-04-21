// ignore_for_file: file_names, avoid_print

import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/hedder/drawer/drawers_Controller.dart';
import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerExtraWidget/drawerExtraWidget.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/show/showScreen/show.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/jewelryBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../../../../controller/user_Interface/menu/diamondSearch/diamondSearch_Controller.dart';
import '../../../../../menu/jewelry/jewelryScreen/product.dart';

Widget engagementSection({
  bool? metalvisible,
  bool? stylevisible,
  bool? shapvisible,
  void Function()? metalonTap,
  void Function()? styleonTap,
  void Function()? shapeonTap,
  Widget? metalvisiblechild,
  Widget? stylevisiblechild,
  Widget? shapvisiblechild,
  void Function()? viweButtononTap,
}) {
  return productBand(
    metalvisible: metalvisible ?? false,
    stylevisible: stylevisible ?? false,
    shapvisible: shapvisible ?? false,
    metalonTap: metalonTap,
    styleonTap: styleonTap,
    shapeonTap: shapeonTap,
    metalvisiblechild: metalvisiblechild,
    stylevisiblechild: stylevisiblechild,
    shapvisiblechild: shapvisiblechild,
    viweButtononTap: viweButtononTap,
  );
}

Widget weddingBandsSection({
  bool? metalvisible,
  bool? stylevisible,
  bool? shapvisible,
  void Function()? metalonTap,
  void Function()? styleonTap,
  void Function()? shapeonTap,
  Widget? metalvisiblechild,
  Widget? stylevisiblechild,
  Widget? shapvisiblechild,
  void Function()? viweButtononTap,
}) {
  return productBand(
    metalvisible: metalvisible ?? false,
    stylevisible: stylevisible ?? false,
    shapvisible: shapvisible ?? false,
    metalonTap: metalonTap,
    styleonTap: styleonTap,
    shapeonTap: shapeonTap,
    metalvisiblechild: metalvisiblechild,
    stylevisiblechild: stylevisiblechild,
    shapvisiblechild: shapvisiblechild,
    viweButtononTap: viweButtononTap,
  );
}

//Engagement Rings List
// Widget engagementRingsList() {
//   final jewellry = Get.find<JewelleryAPICall>();
//   final List categoryList = jewellry.categoryAPI.catagoryData['data'];
//   final engagementCategory = categoryList.firstWhere(
//     (element) => element['categoryName'] == "Engagement Rings",
//   );
//   final List subCategories = engagementCategory['subCategory'];
//   final engagement = '67ee85d43c2ae60318a28998';
//   return ListView.builder(
//     shrinkWrap: true,
//     physics: NeverScrollableScrollPhysics(),
//     itemCount: subCategories.length,
//     itemBuilder: (context, index) {
//       return listColltion(
//         index: index,
//         datalist: subCategories[index]['categoryName'],
//         onTap: () {
//           Get.to(
//             () => Product(
//               categoryId: engagement,
//               subCategoryId: subCategories[index]['_id'],
//               categoryName: subCategories[index]['categoryName'],
//             ),
//           );
//           print({
//             'categoryId': categoryList[index]['_id'],
//             'subCategoryId': subCategories[index]['_id'],
//             'categoryName': subCategories[index]['categoryName'],
//           });
//         },
//       );
//     },
//   );
// }

//Wedding Bands List
Widget weddingBandsList() {
  final jewellry = Get.find<JewelleryAPICall>();
  final List categoryList = jewellry.categoryAPI.catagoryData['data'];
  final weddingBand = categoryList.firstWhere(
    (element) => element['categoryName'] == "Wedding Bands",
  );
  final List subCategories = weddingBand['subCategory'];
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: subCategories.length,
    itemBuilder: (BuildContext context, int index) {
      return listColltion(
        index: index,
        datalist: subCategories[index]['categoryName'],
        onTap: () {
          Get.to(
            () => Product(
              categoryId: weddingBand['_id'],
              subCategoryId: subCategories[index]['_id'],
              categoryName: subCategories[index]['categoryName'],
            ),
          );
          print({
            'categoryId': weddingBand['_id'],
            'subCategoryId': subCategories[index]['_id'],
            'categoryName': subCategories[index]['categoryName'],
          });
        },
      );
    },
  );
}

//Jewellery List
Widget jewelryList({required List list}) {
  var newList = list
      .where(
        (item) => item['subCategory'] != null && item['subCategory'].isNotEmpty,
      )
      .toList();
  return ListView.builder(
    shrinkWrap: true,
    itemCount: newList.length,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      return listColltion(
        index: index,
        datalist: newList[index]['categoryName'],
        onTap: () => callProductList(newList, index),
      );
    },
  );
}

//Shop By Metal
Widget shopByMetal({required List list}) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: list.length,
    itemBuilder: (BuildContext context, int index) {
      return listColltion(
        index: index,
        datalist: list[index]['caption'],
        onTap: () {
          Get.to(
            () => Product(
              categoryId: list[index]['_id'],
              categoryName: list[index]['caption'],
            ),
          );
        },
      );
    },
  );
}

//Product List
Widget showListValue({required List list}) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: list.length,
    itemBuilder: (BuildContext context, int index) {
      return listColltion(
        index: index,
        datalist: list[index]['venue'],
        onTap: () {
          Get.to(() => Show(imageShow: list[index]['descriptionImage']));
        },
      );
    },
  );
}

//Diamond List
Widget diamondList({required List list}) {
  final bottomController = Get.put(BottombarController());
  final diamondSearch = Get.put(DiamondSearchUIController());
  final drawerUI = Get.put(DrawersUIController());
  return ListView.builder(
    shrinkWrap: true,
    itemCount: list.length,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      return listColltion(
        index: index,
        datalist: list[index]['paraMtrName'],
        onTap: () {
          if (drawerUI.shape.value) {
            diamondSearch.selectedIndex.value = 0;
          }
          if (drawerUI.shape2.value) {
            diamondSearch.selectedIndex.value = 1;
          }
          bottomController.isDrawerOpen.value = false;
          bottomController.selectindex.value = 3;
          bottomController.changePage(3);
        },
      );
    },
  );
}
