import 'package:classic/view/screen/menu/home/homeWidget/body/homeBody.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:classic/view/utils/widget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../../utils/widget/cartcontainer.dart';

class Show extends StatelessWidget {
  const Show({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.show),
      body: Column(
        children: [
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.020)),
          fillTheForm(),
          whatClassic(),
        ],
      ),
    );
  }
}

Widget fillTheForm() {
  return horizontalPadding(
    child: cartConatiner(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please Fill The Form !',
            style: TextStyle(
              color: AppColor.primary,
              fontSize: Get.width * 0.050,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.020)),
          inputTyaping(
            text: AppString.fristname,
            hinttext: AppString.fristname,
            controller: TextEditingController(),
          ),
          inputTyaping(
            text: AppString.lastname,
            hinttext: AppString.lastname,
            controller: TextEditingController(),
          ),
          inputTyaping(
            text: AppString.emailId,
            hinttext: AppString.emailId,
            controller: TextEditingController(),
          ),
        ],
      ),
    ),
  );
}
