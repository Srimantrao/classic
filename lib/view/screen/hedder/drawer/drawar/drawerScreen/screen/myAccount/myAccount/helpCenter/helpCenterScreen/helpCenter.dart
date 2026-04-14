// ignore_for_file: use_key_in_widget_constructors

import 'package:classic/controller/user_Interface/hedder/drawer/myAccount/helpCenter/helpCenter_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/myAccount/helpCenter/helpCenterWidget/helpCenterWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_cricularProgrssIndicator.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HelpCenter extends StatelessWidget {
  final helpcenterUI = Get.put(HelpcenterController());
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.contactUs),
      child: SingleChildScrollView(
        child: horizontalPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showCompanyInformation(),
              Obx(() {
                final api = helpcenterUI.sendMessage;
                final loading = api.isLoading.value;
                return writetousContainer(
                  country: helpcenterUI.country.value,
                  listcountry: helpcenterUI.getDropdownCountry(),
                  onChangedcountry: helpcenterUI.countryValueChange,
                  fullnameController: helpcenterUI.fullName,
                  emailIdController: helpcenterUI.emailId,
                  mobileController: helpcenterUI.mobile,
                  messageController: helpcenterUI.message,
                  onChanged_mobile: helpcenterUI.onChanged_mobile,
                  helpcenterUI: helpcenterUI,
                  mobileNoColor: helpcenterUI.mobileNoColor.value
                      ? AppColor.red
                      : AppColor.white,
                  SendMessageOnTap: helpcenterUI.sendMessageButton,
                  loadingWait: loading ? customCircular() : null,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
