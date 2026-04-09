// ignore_for_file: file_names

import 'package:classic/controller/application_Programing_interface/callApi/callAPI.dart';
import 'package:classic/controller/user_Interface/hedder/myAccount/wishlist/wishlist_Controller.dart';
import 'package:classic/modal/headder/myAccount/wishlist.dart';
import 'package:classic/view/screen/menu/dashbord/dasboadWidget/body/diamondSection.dart';
import 'package:classic/view/screen/menu/dashbord/dashbordExtraWidget/dashbordExtraWidget.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../wishlistWidget/body/wishlistWidget.dart';

class Wishlist extends StatelessWidget {
  final wishlistUI = Get.put(WishlistUIController());
  final header = Get.put(CartAPICall());
  final value = WishlistList();
  Wishlist({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.wishlist, cart: true),
      child: Obx(() {
        return Column(
          children: [
            Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.02)),

            //Select Button
            indexButtons(
              isSelectDiamond: wishlistUI.isSelectDiamond,
              isSelectJewellwery: wishlistUI.isSelectJewellwery,
              onTapDiamond: () => wishlistUI.selectTab(0),
              onTapJewellwery: () => wishlistUI.selectTab(1),
            ),

            //Dimaond
            if (wishlistUI.selectedIndex.value == 0) diamondListWish(header),

            //Jewellwery
            if (wishlistUI.selectedIndex.value == 1)
              dashbordValueList(
                list: jewelryListViwe(
                  jewelryList: header
                      .fitterWish
                      .fitterWishData['data'][0]['productLookup'],
                ),
              ),
          ],
        );
      }),
    );
  }
}