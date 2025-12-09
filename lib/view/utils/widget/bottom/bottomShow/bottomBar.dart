// ignore_for_file: deprecated_member_use, file_names, unnecessary_import

import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/bottom/bottomWidget/bottomWidget.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottombar extends StatelessWidget {
  final bottomController = Get.put(BottombarController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Bottombar({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      key: scaffoldKey,
      bottomNavigationBar: Obx(() {
        if (bottomController.isDrawerOpen.value) {
          return const SizedBox.shrink(); // hide the bar
        }
        return SafeArea(
          child: Container(
            color: AppColor.white,
            width: double.infinity,
            padding: EdgeInsets.only(
              top: Get.height * 0.01,
              bottom: Get.height * 0.009,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                horizontalPadding(child: flotingBar(bottomController)),
                SizedBox(height: Get.height * 0.008),
              ],
            ),
          ),
        );
      }),
      body: Obx(() {
        return bottomController.selectscreen(
          bottomController.selectindex.value,
        );
      }),
    );
  }
}

//Foltong
// Scaffold(
//       backgroundColor: AppColor.white,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Main content - takes full screen
//             Obx(() {
//               return bottomController.selectscreen(
//                 bottomController.selectindex.value,
//               );
//             }),

//             Obx(() {
//               return // Floating bottom navigation bar
//               Positioned(
//                 left: 1,
//                 right: 1,
//                 bottom: Get.height * 0.02,
//                 child: horizontalPadding(child: flotingBar(bottomController)),
//               );
//             }),
//           ],
//         ),
//       ),
//     );

//Stadiy
// Scaffold(
//       extendBody: true,
//       bottomNavigationBar: Obx(() {
//         return SafeArea(
//           child: Container(
//             color: AppColor.white,
//             width: double.infinity,
//             padding: EdgeInsets.only(
//               top: Get.height * 0.01,
//               bottom: Get.height * 0.009,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 horizontalPadding(child: flotingBar(bottomController)),
//                 SizedBox(height: Get.height * 0.008),
//               ],
//             ),
//           ),
//         );
//       }),
//       body: Obx(() {
//         return bottomController.selectscreen(
//           bottomController.selectindex.value,
//         );
//       }),
//     );
