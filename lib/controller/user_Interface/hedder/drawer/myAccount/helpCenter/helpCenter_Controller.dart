// ignore_for_file: unused_field, non_constant_identifier_names, avoid_print

import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/helpCenter/sendMessage_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/other/country_Controller.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HelpcenterController extends GetxController {
  //API
  final Country = Get.put(CountryController());
  final sendMessage = Get.put(SendMessageController());

  //Controller
  final fullName = TextEditingController();
  final emailId = TextEditingController();
  final mobile = TextEditingController();
  final message = TextEditingController();

  //Variable
  var country = ''.obs;
  var mobileNoColor = false.obs;

  //I,M Robort
  var isCheck = false.obs;
  var tokanRecaptcha = '';

  //List
  List<DropdownMenuItem<String>> getDropdownCountry() {
    final data = Country.countryData['data'];
    if (data == null || data is! List) return [];
    return data.map<DropdownMenuItem<String>>((item) {
      return DropdownMenuItem<String>(
        value: item['_id']?.toString() ?? '',
        child: Text(
          item['name']?.toString() ?? '',
          style: TextStyle(color: AppColor.black),
        ),
      );
    }).toList();
  }

  //onChnage Value of Dropdown
  void countryValueChange(String? newValue) {
    if (newValue == null) return;
    final data = Country.countryData['data'];
    if (data == null || data is! List) return;
    final selectedCountry = data.firstWhere(
      (item) => item['_id'] == newValue,
      orElse: () => null,
    );
    if (selectedCountry == null) return;
    country.value = newValue;
    print("Selected country ID: ${country.value}");
    print("Selected country Name: ${selectedCountry['name']}");
  }

  void onChanged_mobile(String value) {
    if (value.isEmpty) {
      mobileNoColor.value = true;
    } else {
      mobileNoColor.value = false;
    }
  }

  // I.M Robot
  void isCheckValue(bool? val) async {
    if (val == true) {
      bool verified = await _verifyRecaptcha();
      isCheck.value = verified;
    } else {
      isCheck.value = false;
    }
  }

  static const platform = MethodChannel('com.example.recaptcha');
  String _verificationStatus = 'Not Verified';

  Future<bool> _verifyRecaptcha() async {
    try {
      final String token = await platform.invokeMethod('verifyRecaptcha');
      _verificationStatus = 'Verified! Token: ${token.substring(0, 20)}...';
      tokanRecaptcha = token;
      print('Full reCAPTCHA Token: $token');
      return true;
    } on PlatformException catch (e) {
      _verificationStatus = 'Failed: ${e.message}';
      print('Recaptcha failed: ${e.message}');
      return false;
    } catch (e) {
      _verificationStatus = 'Error: $e';
      print('Unexpected error: $e');
      return false;
    }
  }

  void sendMessageButton() {
    sendMessage.sendMessage(
      fullName: fullName.text,
      email: emailId.text,
      mobile: mobile.text,
      message: message.text,
      countrycode: country.value,
      token: tokanRecaptcha,
    );
  }
}
