// ignore_for_file: unnecessary_null_comparison, file_names, avoid_print, non_constant_identifier_names

import 'package:classic/modal/credentials/signUp.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupuiContoller extends GetxController {
  //TextController
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final mobileController = TextEditingController();

  final countryDropdown = Get.put(CountryDropdownContoller());
  final signUpDropdown = Get.put(SignupDropdownContoller());

  //value
  var country = ''.obs;
  var selectedValueIAM = ''.obs;
  var selectedValueHowdidyourhear = ''.obs;
  var selectedValueMemberof = ''.obs;

  //validation value
  var fristnameColor = false.obs;
  var lastnameColor = false.obs;
  var emailIdColor = false.obs;
  var passwordColor = false.obs;
  var confirmPasswordColor = false.obs;
  var mobileNoColor = false.obs;

  //List
  List<DropdownMenuItem<String>> getDropdownCountry() {
    return countryDropdown.dropdownCountry.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    return signUpDropdown.dropdownOptions.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getDropdownItems2() {
    return signUpDropdown.dropdownOptions2.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getDropdownItems3() {
    return signUpDropdown.dropdownOptions3.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value, style: TextStyle(color: AppColor.black)),
      );
    }).toList();
  }

  //onChnage Value of Dropdown
  void countryValueChange(String? newValue) {
    country.value = newValue!;
    if (newValue != null) {
      print('Selected value: ${signUpDropdown.dropdownOptions[newValue]}');
    }
  }

  void iamvalueChange(String? newValue) {
    selectedValueIAM.value = newValue!;
    if (newValue != null) {
      print('Selected value: ${signUpDropdown.dropdownOptions[newValue]}');
    }
  }

  void howdidyourhearvalueChange(String? newValue) {
    selectedValueHowdidyourhear.value = newValue!;
    if (newValue != null) {
      print('Selected value: ${signUpDropdown.dropdownOptions[newValue]}');
    }
  }

  void memberoflueChange(String? newValue) {
    selectedValueMemberof.value = newValue!;
    if (newValue != null) {
      print('Selected value: ${signUpDropdown.dropdownOptions[newValue]}');
    }
  }

  //validation value
  void onChanged_fristname(String value) {
    if (value.isEmpty) {
      fristnameColor.value = true;
    } else {
      fristnameColor.value = false;
    }
  }

  void onChanged_lastname(String value){
    if (value.isEmpty) {
      lastnameColor.value = true;
    } else {
      lastnameColor.value = false;
    }
  }

  void onChanged_emailId(String value){
    if (value.isEmpty) {
      emailIdColor.value = true;
    } else {
      emailIdColor.value = false;
    }
  }

  void onChanged_password(String value){
    if (value.isEmpty) {
      passwordColor.value = true;
    } else {
      passwordColor.value = false;
    }
  }

  void onChanged_confirmPassword(String value){
    if (value.isEmpty) {
      confirmPasswordColor.value = true;
    } else {
      confirmPasswordColor.value = false;
    }
  }

  void onChanged_mobile(String value){
    if (value.isEmpty) {
      mobileNoColor.value = true;
    }else{
      mobileNoColor.value = false;
    }
  }


  Future<void> signUpNext() async {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailIdController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        mobileController.text.isEmpty) {
      if (firstNameController.text.isEmpty) {
        fristnameColor.value = true;
      } else {
        fristnameColor.value = false;
      }
      if (lastNameController.text.isEmpty) {
        lastnameColor.value = true;
      } else {
        lastnameColor.value = false;
      }
      if (emailIdController.text.isEmpty) {
        emailIdColor.value = true;
      } else {
        emailIdColor.value = false;
      }
      if (passwordController.text.isEmpty) {
        passwordColor.value = true;
      } else {
        passwordColor.value = false;
      }
      if (confirmPasswordController.text.isEmpty) {
        confirmPasswordColor.value = true;
      } else {
        confirmPasswordColor.value = false;
      }
      if (mobileController.text.isEmpty) {
        mobileNoColor.value = true;
      } else {
        mobileNoColor.value = false;
      }
    } else {
      fristnameColor.value = false;
      lastnameColor.value = false;
      emailIdColor.value = false;
      passwordColor.value = false;
      confirmPasswordColor.value = false;
      mobileNoColor.value = false;
    }
  }

  void allDoneGotonextPage(Widget page){
    signUpNext().then((value){
      if(firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          emailIdController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty &&
          mobileController.text.isNotEmpty){
        Get.to(() => page);
      }
    });
  }
}
