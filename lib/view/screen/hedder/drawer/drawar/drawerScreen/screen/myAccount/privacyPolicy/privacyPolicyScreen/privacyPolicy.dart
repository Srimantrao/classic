// ignore_for_file: use_key_in_widget_constructors

import 'package:classic/controller/user_Interface/hedder/drawer/myAccount/privacyPolicy/privacyPolicy_Controller.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../privacyPolicyWidget/privacyPolicyWidget.dart';

class Privacypolicy extends StatelessWidget {
  final privacyPolicyController = Get.put(PrivacyPolicyController());
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      child: Obx(() {
        final state = privacyPolicyController;
        final controller = state.controller;
        final isLoading = state.isLoading.value;

        if (isLoading) {
          return Center(child: privacyPolicyShirmmar());
        }

        return WebViewWidget(controller: controller);
      }),
    );
  }
}
