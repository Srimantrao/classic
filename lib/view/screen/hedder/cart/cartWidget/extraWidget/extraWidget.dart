// ignore_for_file: file_names, non_constant_identifier_names, strict_top_level_inference, unused_local_variable

import 'package:classic/controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/removeIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productDetail/productsize_Controller.dart';
import '../../../../menu/jewelry/jewelryWidget/body/productDetail.dart';

Widget cartValue({
  required String cartImage,
  required String PRICE_CT,
  required String stock,
  required String type,
  required String Weightm,
  required String title,
  required ProductDetailUIController productDetail,
  void Function()? onTapIncrimant,
  void Function()? onTapDecrimant,
  required void Function() removeItem,
  required String categoryId,
  int? value,
}) {
  final parsedPrice = double.tryParse(PRICE_CT);
  final bracelet = Get.put(BraceletPriceController());
  final ring = Get.put(RingsSizeController());
  final rings = '682181561353060d79b6e480';
  final bracelets = '67f3a6e10d01f3f9f578083b';
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: removeItem,
              child: removeIcon(),
            ),
          ],
        ),
        Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.010)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(Get.width * 0.005),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderradius.buttonboder),
                border: Border.all(color: AppColor.gray),
              ),
              child: SizedBox(
                height: Get.width * 0.22,
                width: Get.width * 0.22,
                child: Image.network(cartImage),
              ),
            ),
            Padding(padding: EdgeInsetsGeometry.only(right: Get.width * 0.03)),
            Expanded(
              child: Column(
                children: [
                  Text(
                    title,
                    softWrap: true,
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                      fontSize: Textsize.samisubHedding,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.005),
                  ),
                  Row(
                    children: [
                      price(
                        parsedPrice != null
                            ? '\$${parsedPrice.toStringAsFixed(2)}'
                            : '\$$PRICE_CT',
                      ),
                      Spacer(),
                      quantity(
                        value: value,
                        onTapDecrimant: onTapDecrimant,
                        onTapIncrimant: onTapIncrimant,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.005)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                valuedetails(shape: 'PRICE/CT', valueDetails: PRICE_CT),
                valuedetails(shape: 'Weightm', valueDetails: Weightm),
                valuedetails(shape: 'Type', valueDetails: type),
              ],
            ),
            valuedetails(shape: 'Stock Id', valueDetails: stock),
            (categoryId == rings || categoryId == bracelets)
                ? Padding(
                    padding: EdgeInsetsGeometry.only(top: Get.height * 0.02),
                  )
                : SizedBox(),
            //Rings
            (categoryId == rings)
                ? productSize(productDetail, AppString.ringSize)
                : SizedBox(),

            // Bracelet Size
            (categoryId == bracelets)
                ? productSize(productDetail, AppString.braceletSize)
                : SizedBox(),
          ],
        ),
      ],
    ),
  );
}

Widget valuedetails({required String valueDetails, required String shape}) {
  String displayValue = valueDetails;

  if (shape == 'PRICE/CT') {
    final parsed = double.tryParse(valueDetails);
    displayValue = parsed != null
        ? '\$${parsed.toStringAsFixed(1)}'
        : '\$$valueDetails';
  }

  return Row(children: [hedding(shape), valuecart(displayValue)]);
}

Widget price(text) {
  return Text(
    text,
    style: TextStyle(
      color: AppColor.primary,
      fontWeight: FontWeight.w500,
      fontSize: Textsize.normal,
    ),
  );
}

Widget hedding(text) {
  return Text(
    '$text : ',
    style: TextStyle(
      color: AppColor.gray5,
      fontFamily: 'Sans-Bold',
      fontWeight: FontWeight.w600,
      fontSize: Textsize.small,
    ),
  );
}

Widget valuecart(text) {
  return Text(
    '$text,  ',
    style: TextStyle(
      color: AppColor.black,
      fontFamily: 'Sans-Bold',
      fontWeight: FontWeight.w500,
      fontSize: Textsize.small,
    ),
  );
}

Widget checkOutContainer(Widget? child) {
  return Container(
    padding: EdgeInsetsGeometry.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.gray),
      borderRadius: BorderRadius.circular(borderradius.buttonboder),
    ),
    child: child,
  );
}

Widget checkoutHeddingText(text, {Color? color}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: Get.width * 0.04,
      color: color,
    ),
  );
}
