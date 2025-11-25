// ignore_for_file: deprecated_member_use, file_names, unnecessary_import

import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
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
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content - takes full screen
            Obx(() {
              return bottomController.selectscreen(
                bottomController.selectindex.value,
              );
            }),

            Obx((){
              return // Floating bottom navigation bar
                Positioned(
                  left: 1,
                  right: 1,
                  bottom: Get.height * 0.02,
                  child: horizontalPadding(
                    child: flotingBar(bottomController),
                  ),
                );
            })
          ],
        ),
      ),
    );
  }
}