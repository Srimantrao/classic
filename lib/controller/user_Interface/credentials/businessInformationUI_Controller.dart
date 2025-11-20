// ignore_for_file: avoid_print, file_names

import 'package:classic/modal/credentials/signUp.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BusinessinformationuiController extends GetxController {
  final countryDropdown = Get.put(CountryDropdownContoller());
  final signUpDropdown = Get.put(SignupDropdownContoller());

  final companyController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final addressController = TextEditingController();

  var country = ''.obs;
  var readandAgree = false.obs;
  var stock = false.obs;

  //validation
  var companyColor = false.obs;
  var stateColor = false.obs;
  var cityColor = false.obs;

  //I,M Robort
  var isCheck = false.obs;
  var tokanRecaptcha = '';

  //onChnage Value of Dropdown
  List<DropdownMenuItem<String>> getDropdownCountry() {
    return countryDropdown.dropdownCountry.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  void countryValueChange(String? newValue) {
    country.value = newValue!;
    print('Selected value: ${signUpDropdown.dropdownOptions[newValue]}');
  }

  void readandAgreeValueChange(bool? newValue) {
    readandAgree.value = newValue ?? false;

    if (newValue != null) {
      print('Selected value: $newValue');
    }
  }

  void stockupdateValueChange(bool? newValue) {
    stock.value = newValue ?? false;

    if (newValue != null) {
      print('Selected value: $newValue');
    }
  }

  //validation
  void comapnyColor(String? value) {
    if (value!.isEmpty) {
      companyColor.value = true;
    } else {
      companyColor.value = false;
    }
  }

  void stateColors(String? value) {
    if (value!.isEmpty) {
      stateColor.value = true;
    } else {
      stateColor.value = false;
    }
  }

  void cityColors(String? value) {
    if (value!.isEmpty) {
      cityColor.value = true;
    } else {
      cityColor.value = false;
    }
  }

  Future<void> signUp() async {
    if (companyController.text.isEmpty ||
        stateController.text.isEmpty ||
        cityController.text.isEmpty) {
      if (companyController.text.isEmpty) {
        companyColor.value = true;
      } else {
        companyColor.value = false;
      }
      if (stateController.text.isEmpty) {
        stateColor.value = true;
      } else {
        stateColor.value = false;
      }
      if (cityController.text.isEmpty) {
        cityColor.value = true;
      } else {
        cityColor.value = false;
      }
    } else {
      companyColor.value = false;
      stateColor.value = false;
      cityColor.value = false;
    }
  }

  void okLetsGetSignUP(Widget page) {
    signUp().then((value) {
      if (isCheck.value == true &&
          companyController.text.isNotEmpty &&
          stateController.text.isNotEmpty &&
          cityController.text.isNotEmpty) {
        print('success');
        page;
      } else {
        print('error found');
      }
    });
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
}
