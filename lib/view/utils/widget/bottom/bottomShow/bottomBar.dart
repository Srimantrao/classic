// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, file_names, unnecessary_import

import 'package:classic/controller/internetConnctionCheck/internetConnctionCheck.dart';
import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/drawer.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/bottom/bottomWidget/bottomWidget.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottombar extends StatelessWidget {
  Bottombar({super.key});
  final bottomController = Get.put(BottombarController());
  final internetController = Get.put(InternetController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      //No Internet
      if (!internetController.isConnected.value) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // No Internet Icon
                Icon(Icons.wifi_off_rounded, size: 90, color: AppColor.primary),
                SizedBox(height: Get.height * 0.025),

                // Title
                Text(
                  AppString.noInternet,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),

                SizedBox(height: Get.height * 0.008),

                // Subtitle
                Text(
                  AppString.checkInternet,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),

                SizedBox(height: Get.height * 0.038),

                // Retry Button
                ElevatedButton(
                  onPressed: () async {
                    await internetController.checkInternet();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        borderradius.buttonboder,
                      ),
                    ),
                  ),
                  child: Text(
                    AppString.retry,
                    style: TextStyle(fontSize: Get.width * 0.040),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      // Internet Available
      return Fullscreen(
        endDrawer: Drawers(),
        body: SafeArea(
          child: Stack(
            children: [
              Obx(() {
                return bottomController.selectscreen(
                  bottomController.selectindex.value,
                );
              }),

              Obx(() {
                if (bottomController.isDrawerOpen.value) {
                  return const SizedBox.shrink();
                }

                return Positioned(
                  left: 1,
                  right: 1,
                  bottom: Get.height * 0.02,
                  child: horizontalPadding(child: flotingBar(bottomController)),
                );
              }),
            ],
          ),
        ),
      );
    });
  }
}

/*
Fullscreen(
      key: scaffoldKey,
      body: Obx(() {
        return Stack(
          children: [
            /// Main Screen
            Positioned.fill(
              child: KeyedSubtree(
                key: ValueKey(bottomController.selectindex.value),
                child: bottomController.selectscreen(
                  bottomController.selectindex.value,
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                child: Container(
                  height: Get.height * 0.09,
                  color: AppColor.white,
                  padding: EdgeInsets.only(
                    top: Get.height * 0.01,
                    bottom: Get.height * 0.001,
                  ),
                  child: Column(
                    children: [
                      horizontalPadding(child: flotingBar(bottomController)),
                    ],
                  ),
                ),
              ),
            ),

            if (bottomController.isDrawerOpen.value)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: Get.width * 0.20,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => bottomController.isDrawerOpen.value = false,
                  child: Container(),
                ),
              ),

            if (bottomController.isDrawerOpen.value)
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                width: Get.width,
                child: Drawers(),
              ),
          ],
        );
      }),
    );
 */

//hide bottom bar When tab Drawar
// class Bottombar extends StatelessWidget {
//   final bottomController = Get.put(BottombarController());
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   Bottombar({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Fullscreen(
//       key: scaffoldKey,
//       bottomNavigationBar: Obx(() {
//         if (bottomController.isDrawerOpen.value) {
//           return const SizedBox.shrink();
//         }
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
//   }
// }

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
