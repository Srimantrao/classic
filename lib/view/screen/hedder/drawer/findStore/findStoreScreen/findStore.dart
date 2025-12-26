import 'package:classic/modal/headder/drawar/findStore.dart';
import 'package:classic/view/screen/hedder/drawer/findStore/findStoreWidget/body/findStoreWidget.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';

class Findstore extends StatelessWidget {
  final find = FindstoreList();
  Findstore({super.key});
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Fullscreen(
      appBar: allOtherScreen(AppString.findstore),
      child: Column(
        children: [
          sarchHeadder(searchController: searchController, onTap: () {}),
          findStoreList(list: find.findStore),
        ],
      ),
    );
  }
}
