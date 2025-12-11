import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen('Filter',filter: true),
      child: Column(
        children: [
          Text(AppString.metalType),
        ],
      ),
    );
  }
}
