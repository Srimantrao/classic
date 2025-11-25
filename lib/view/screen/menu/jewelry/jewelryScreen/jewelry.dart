
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/hedder/appbar.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_icon.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:flutter/material.dart';

class Jewelry extends StatelessWidget {
  const Jewelry({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: appBarCategory(
        AppIcon.newcart,
        AppIcon.drawer,
        AppString.category,
      ),
      child: Column(
        children: [
        ],
      ),
    );
  }
}