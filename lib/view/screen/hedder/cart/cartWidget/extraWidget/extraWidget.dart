// ignore_for_file: file_names, non_constant_identifier_names, strict_top_level_inference

import 'package:classic/view/utils/app_Borderradius.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../menu/jewelry/jewelryWidget/body/productDetail.dart';

Widget cartValue({
  required String cartImage,
  required String PRICE_CT,
  required String stock,
  required String type,
  required String Weightm,
  required String title,
  void Function()? onTapIncrimant,
  void Function()? onTapDecrimant,
  required void Function() removeItem,
  int? value,
}) {
  final parsedPrice = double.tryParse(PRICE_CT);

  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: removeItem,
              child: Text(
                'Remove Item',
                style: TextStyle(
                  fontSize: Textsize.samisubHedding,
                  color: AppColor.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.primary,
                  decorationThickness: 1.5,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.005)),
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

            SizedBox(width: Get.width * 0.03),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  price(
                    parsedPrice != null
                        ? '\$${parsedPrice.toStringAsFixed(2)}'
                        : '\$$PRICE_CT',
                  ),
                  valuedetails(shape: 'PRICE/CT', valueDetails: PRICE_CT),
                  valuedetails(shape: 'Stock Id', valueDetails: stock),
                  valuedetails(shape: 'Weightm (Apx)', valueDetails: Weightm),
                  valuedetails(shape: 'Type', valueDetails: type),

                  Padding(
                    padding: EdgeInsetsGeometry.only(top: Get.height * 0.02),
                  ),
                  quantity(
                    value: value,
                    onTapDecrimant: onTapDecrimant,
                    onTapIncrimant: onTapIncrimant,
                  ),
                ],
              ),
            ),
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
        ? '\$${parsed.toStringAsFixed(2)}'
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
      color: AppColor.gray3,
      fontFamily: 'Sans-Bold',
      fontWeight: FontWeight.w500,
      fontSize: Textsize.small,
    ),
  );
}

Widget valuecart(text) {
  return Text(
    '$text, ',
    style: TextStyle(
      color: AppColor.black,
      fontFamily: 'Sans-Bold',
      fontWeight: FontWeight.w500,
      fontSize: Textsize.small,
    ),
  );
}
