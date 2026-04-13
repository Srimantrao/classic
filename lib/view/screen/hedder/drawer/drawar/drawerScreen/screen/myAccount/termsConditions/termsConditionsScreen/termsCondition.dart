// ignore_for_file: use_key_in_widget_constructors

import 'package:classic/controller/user_Interface/hedder/myAccount/termsConditions/termsConditions_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/privacyPolicy/privacyPolicyWidget/privacyPolicyWidget.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsCondition extends StatelessWidget {
  final termsConditionController = Get.put(TermsConditionsController());
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      child: Obx(() {
        final state = termsConditionController;
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
