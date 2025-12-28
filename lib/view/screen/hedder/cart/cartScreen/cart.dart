// ignore_for_file: body_might_complete_normally_nullable

import 'package:classic/view/screen/hedder/cart/cartWidget/body/cartWidget.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/widget/bottomNavigationButton.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.myCart),
      bottomNavigationBar: buttonNavigation(
        child: button(
          AppString.proceed,
          bottomBottonFontSize: true,
          isLowercase: true,
        ),
      ),
      child: horizontalPadding(
        child: Column(
          children: [
            //List
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return cart(
                    cartImage: AppImage.necklace,
                    shape: 'Round',
                    clarity: 'IF',
                    color: 'D',
                    cut: 'Ideal',
                    lab: 'IGI',
                    PRICE_CT: '389.05',
                    location: 'India',
                    CVD: 'CVD',
                    stock: 'LLA290D',
                    type: 'CVD',
                    certification: '727568458',
                  );
                },
              ),
            ),

            //Price
            total('116.72'),
          ],
        ),
      ),
    );
  }
}
