// ignore_for_file: unnecessary_null_comparison, file_names, avoid_print

import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupuiContoller extends GetxController{

  //TextController
  final fristnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final mobileController = TextEditingController();

  //value
  var country = ''.obs;
  var selectedValueIAM = ''.obs;
  var selectedValueHowdidyourhear = ''.obs;
  var selectedValueMemberof = ''.obs;

  //Convert Map
  final Map<String, String> dropdownCountry = {
    'option1': 'India',
    'option2': 'U.S.A',
    'option3': 'England',
    'option4': 'Chaina',
    'option5': 'Pakistan',
  };

  final Map<String, String> dropdownOptions = {
    'option1': 'Wholesaler',
    'option2': 'Dealer',
    'option3': 'Retailer',
    'option4': 'Manufacturer',
    'option5': 'Individual',
  };

  final Map<String, String> dropdownOptions2 = {
    'option1': 'Google / Social Media / Email',
    'option2': 'Sales Person',
  };

  final Map<String, String> dropdownOptions3 = {
    'option1': 'SJO',
    'option2': 'RJO',
    'option3': 'IJO',
    'option4': 'Other',
    'option5': 'None',
  };

  //List
  List<DropdownMenuItem<String>> getDropdownCountry() {
    return dropdownCountry.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value,style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    return dropdownOptions.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value,style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getDropdownItems2() {
    return dropdownOptions2.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value,style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getDropdownItems3() {
    return dropdownOptions3.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value,style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  //onChnage Value
  void countryValueChange(String? newValue){
    selectedValueIAM.value = newValue!;
    if (newValue != null) {
      print('Selected value: ${dropdownOptions[newValue]}');
    }
  }

  void iamvalueChange(String? newValue){
    selectedValueIAM.value = newValue!;
    if (newValue != null) {
      print('Selected value: ${dropdownOptions[newValue]}');
    }
  }

  void howdidyourhearvalueChange(String? newValue){
    selectedValueHowdidyourhear.value = newValue!;
    if (newValue != null) {
      print('Selected value: ${dropdownOptions[newValue]}');
    }
  }

  void memberoflueChange(String? newValue){
    selectedValueMemberof.value = newValue!;
    if (newValue != null) {
      print('Selected value: ${dropdownOptions[newValue]}');
    }
  }
}