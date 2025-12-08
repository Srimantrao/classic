// ignore_for_file: file_names, non_constant_identifier_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/material.dart';

Widget cartValue({
  required String cartImage,
  required String shape,
  required String clarity,
  required String color,
  required String cut,
  required String lab,
  required String PRICE_CT,
  required String location,
  required String CVD,
  required String stock,
  required String type,
  required String certification,
}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(cartImage, scale: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '#LLA290D - 20',
                  style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: Textsize.normal,
                  ),
                ),
                price('116.72'),
                Row(
                  children: [
                    valuedetails(shape: 'Shape', valueDetails: shape),
                    valuedetails(shape: 'Clarity', valueDetails: clarity),
                    valuedetails(shape: 'Color', valueDetails: color),
                  ],
                ),
                Row(
                  children: [
                    valuedetails(shape: 'Cut', valueDetails: cut),
                    valuedetails(shape: 'Lab', valueDetails: lab),
                    valuedetails(shape: 'PRICE/CT', valueDetails: PRICE_CT),
                  ],
                ),
                Row(
                  children: [
                    valuedetails(shape: 'Location', valueDetails: location),
                    valuedetails(shape: 'CVD', valueDetails: CVD),
                  ],
                ),
                valuedetails(shape: 'Stock Id', valueDetails: stock),
                valuedetails(shape: 'Type', valueDetails: type),
                valuedetails(
                  shape: 'Certification',
                  valueDetails: certification,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget valuedetails({required String valueDetails, required String shape}) {
  return Row(children: [hedding(shape), valuecart(valueDetails)]);
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
