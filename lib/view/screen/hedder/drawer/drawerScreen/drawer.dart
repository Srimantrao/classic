import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.18),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderradius.boder),
          topLeft: Radius.circular(borderradius.boder),
        ),
      ),
      child: SafeArea(child: Column(children: [image()])),
    );
  }
}
