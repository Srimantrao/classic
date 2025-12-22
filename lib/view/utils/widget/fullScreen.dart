// ignore_for_file: file_names

import 'package:classic/controller/user_Interface/widget/bottaomBar/bottombar_Controller.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fullscreen extends StatelessWidget {
  final bottomCtrl = Get.put(BottombarController());
  final Widget? child;
  final String? image;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? body;
  Fullscreen({
    super.key,
    this.child,
    this.image,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.scaffoldKey,
    this.endDrawer,
    this.body,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: endDrawer,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      onEndDrawerChanged: (isOpened) {
        bottomCtrl.isDrawerOpen.value = isOpened;
      },
      body:
          body ??
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColor.white,
              image: (image != null)
                  ? DecorationImage(image: AssetImage(image!), fit: BoxFit.fill)
                  : null,
            ),
            child: SafeArea(child: child ?? SizedBox()),
          ),
    );
  }
}
