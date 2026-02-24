// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:classic/controller/application_Programing_interface/apiController/other/country_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../view/utils/app_Color.dart';

class ShowControllerUI extends GetxController{
  final Country = Get.put(CountryController());

  //cuntry
  var country = ''.obs;

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

  // I.M Robot
  var tokanRecaptcha = '';
  var isCheck = false.obs;

  void isCheckValue(bool? val) async {
    if (val == true) {
      bool verified = await _verifyRecaptcha();
      isCheck.value = verified;
    } else {
      isCheck.value = false;
    }
  }

  static const platform = MethodChannel('com.example.recaptcha');

  Future<bool> _verifyRecaptcha() async {
    try {
      final String token = await platform.invokeMethod('verifyRecaptcha');
      tokanRecaptcha = token;
      print('Full reCAPTCHA Token: $token');
      return true;
    } on PlatformException catch (e) {
      print('Recaptcha failed: ${e.message}');
      return false;
    } catch (e) {
      print('Unexpected error: $e');
      return false;
    }
  }
}