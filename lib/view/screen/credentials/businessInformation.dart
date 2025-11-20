import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/logo.dart';
import 'package:flutter/material.dart';

class Businessinformation extends StatelessWidget {
  const Businessinformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      image: AppImage.spalsh_background,
      child: horizontalPadding(
        child: SingleChildScrollView(
          child: Column(
            children: [
              image(),
            ],
          ),
        ),
      ),
    );
  }
}
