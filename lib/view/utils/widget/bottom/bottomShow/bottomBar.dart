// ignore_for_file: deprecated_member_use, file_names, unnecessary_import

import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/bottom/bottomWidget/bottomWidget.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottombar extends StatelessWidget {
  final bottomController = Get.put(BottombarController());
  Bottombar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return bottomController.selectscreen(
          bottomController.selectindex.value,
        );
      }),

      bottomNavigationBar: Obx(() {
        return Container(
          color: AppColor.white,
          height: Get.height * 0.11,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              horizontalPadding(child: flotingBar(bottomController)),
              SizedBox(height: Get.height * 0.025),
            ],
          ),
        );
      }),

      //Floating bottom bar
      // extendBody: true,
      // body: SafeArea(
      //   child: Stack(
      //     children: [
      //       // Main content - takes full screen
      //       Obx(() {
      //         return bottomController.selectscreen(
      //           bottomController.selectindex.value,
      //         );
      //       }),
      //
      //       Obx((){
      //         return // Floating bottom navigation bar
      //           Positioned(
      //             left: 1,
      //             right: 1,
      //             bottom: Get.height * 0.02,
      //             child: horizontalPadding(
      //               child: flotingBar(bottomController),
      //             ),
      //           );
      //       })
      //     ],
      //   ),
      // ),
    );
  }
}
