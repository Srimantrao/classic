// ignore_for_file: non_constant_identifier_names, strict_top_level_inference

import 'package:classic/controller/user_Interface/hedder/drawer/myAccount/helpCenter/helpCenter_Controller.dart';
import 'package:classic/view/screen/credentials/businessInformation/businessInformationWidget/businessInformationWidget.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Image.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/button.dart';
import 'package:classic/view/utils/widget/cartcontainer.dart';
import 'package:classic/view/utils/widget/dropdownSelected.dart';
import 'package:classic/view/utils/widget/inputTyping.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget showCompanyInformation() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01)),
      helpCenterHeddingText(AppString.letsgetintouch),
      helpCenterSubHeddingText(AppString.companyInformation),
      helpCenterSetting(),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.03)),
      followUSText(),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.02)),
    ],
  );
}

Widget writetousContainer({
  required String country,
  required List<DropdownMenuItem<String>> listcountry,
  void Function(String?)? onChangedcountry,
  required TextEditingController fullnameController,
  required TextEditingController emailIdController,
  required TextEditingController mobileController,
  required TextEditingController messageController,
  Color? mobileNoColor,
  void Function(String)? onChanged_mobile,
  HelpcenterController? helpcenterUI,
  void Function()? SendMessageOnTap,
  Widget? loadingWait
}) {
  return cartConatiner(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        helpCenterHeddingText(
          AppString.letsgetintouch,
          color: AppColor.primary,
        ),
        helpCenterSubHeddingText(
          AppString.companyInformation2,
          color: AppColor.gray5,
        ),
        Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01)),

        //FullName
        inputTyaping(
          text: AppString.fullname,
          hinttext: AppString.fullname_hint,
          controller: fullnameController,
        ),

        //EmailId
        inputTyaping(
          text: AppString.emailId,
          hinttext: AppString.emailId_hint,
          controller: emailIdController,
        ),
        Row(
          children: [
            //Country Code
            Flexible(
              flex: 2,
              child: dropdowns(
                AppString.countryCode,
                value: country,
                list: listcountry,
                onChanged: onChangedcountry,
                hinttext: AppString.countryCode,
              ),
            ),
            Padding(padding: EdgeInsetsGeometry.only(right: Get.width * 0.02)),

            //Mobile Number
            Flexible(
              flex: 3,
              child: inputTyaping(
                text: AppString.mobileNo,
                controller: mobileController,
                hinttext: AppString.mobile_hint,
                color: mobileNoColor,
                onChanged: onChanged_mobile,
                maxLength: 10,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
          ],
        ),

        //Message
        inputTyaping(
          text: AppString.message,
          hinttext: AppString.message_hint,
          controller: messageController,
          height: Get.height * 0.15,
          expands: true,
          textAlignVertical: TextAlignVertical.top,
        ),

        imNotaRobat(helpcenterUI?.isCheck.value, helpcenterUI?.isCheckValue),
        Padding(padding: EdgeInsetsGeometry.only(right: Get.width * 0.02)),

        //Button
        button(
          bottomBottonFontSize: true,
          AppString.sendMessage,
          onTap: SendMessageOnTap,
          loadingWait: loadingWait
        )
      ],
    ),
  );
}

Widget followUSText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      helpCenterHeddingText(AppString.followUs),
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01)),
      Row(
        children: [
          Image.asset(AppImage.instagram, width: 35, height: 35),
          Padding(padding: EdgeInsetsGeometry.only(right: Get.width * 0.03)),
          Image.asset(AppImage.facebook, width: 35, height: 35),
          Padding(padding: EdgeInsetsGeometry.only(right: Get.width * 0.03)),
          Image.asset(AppImage.twitter, width: 35, height: 35),
          Padding(padding: EdgeInsetsGeometry.only(right: Get.width * 0.03)),
          Image.asset(AppImage.pinterest, width: 35, height: 35),
        ],
      ),
    ],
  );
}

Widget helpCenterHeddingText(text, {Color? color}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.heading,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.gray5,
    ),
  );
}

Widget helpCenterSubHeddingText(text, {Color? color}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: Textsize.samiHedding,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.gray5,
    ),
  );
}

Widget helpCenterSetting() {
  return Column(
    children: [
      iconInformaton(
        icon: Icons.map_outlined,
        hedding: "${AppString.address}:",
        subHedding: AppString.comapanyAdress,
      ),
      iconInformaton(
        icon: Icons.phone,
        hedding: "${AppString.phone}:",
        subHedding: AppString.phoneNo,
      ),
      iconInformaton(
        icon: Icons.mail_outlined,
        hedding: "${AppString.emailId}:",
        subHedding: AppString.comapntEmailId,
      ),
    ],
  );
}

Widget iconInformaton({
  required IconData icon,
  required String hedding,
  required String subHedding,
}) {
  return Column(
    children: [
      Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01)),
      Row(
        children: [
          helpIcon(icon),
          Padding(padding: EdgeInsetsGeometry.only(right: Get.width * 0.03)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                inromationtext(text: hedding, fontSize: Textsize.subheding),
                inromationtext(
                  text: subHedding,
                  fontSize: Textsize.samiHedding,
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget inromationtext({required String text, required double fontSize}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColor.gray5,
      fontFamily: 'FuturaCyrillic',
    ),
  );
}

Widget helpIcon(IconData image) {
  return CircleAvatar(
    radius: 28,
    backgroundColor: AppColor.ligthGray,
    child: Icon(image, size: 25, color: AppColor.black),
  );
}
