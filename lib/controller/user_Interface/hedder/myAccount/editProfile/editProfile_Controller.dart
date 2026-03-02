// ignore_for_file: unnecessary_null_comparison, file_names, non_constant_identifier_names, avoid_print

import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/editProfile/editProfile_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/other/country_Controller.dart';
import 'package:classic/modal/credentials/signUp.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditprofileUIController extends GetxController {
  //TextController
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailIdController = TextEditingController();

  final mobileController = TextEditingController();
  final companyController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final addressController = TextEditingController();

  final countryDropdown = Get.put(CountryDropdownContoller());
  final signUpDropdown = Get.put(SignupDropdownContoller());
  final editprofileButton = Get.put(EditProfileController());
  final Country = Get.put(CountryController());

  var country = ''.obs;

  //value
  var country_PersonalInformation = ''.obs;
  var country_BusinessInformation = ''.obs;
  var selectedValueIAM = ''.obs;
  var selectedValueHowdidyourhear = ''.obs;
  var selectedValueMemberof = ''.obs;

  //validation value
  var fristnameColor = false.obs;
  var lastnameColor = false.obs;
  var emailIdColor = false.obs;
  var mobileNoColor = false.obs;
  var companyColor = false.obs;
  var stateColor = false.obs;
  var cityColor = false.obs;

  //Country
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
  void countryValueChangePersonalInformation(String? newValue) {
    country_PersonalInformation.value = newValue!;
    if (newValue != null) {
      print('Selected value: ${signUpDropdown.dropdownOptions[newValue]}');
    }
  }

  void countryValueChangeBusinessInformation(String? newValue) {
    country_BusinessInformation.value = newValue!;
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

  //validation value
  void onChanged_fristname(String value) {
    if (value.isEmpty) {
      fristnameColor.value = true;
    } else {
      fristnameColor.value = false;
    }
  }

  void onChanged_lastname(String value) {
    if (value.isEmpty) {
      lastnameColor.value = true;
    } else {
      lastnameColor.value = false;
    }
  }

  void onChanged_emailId(String value) {
    if (value.isEmpty) {
      emailIdColor.value = true;
    } else {
      emailIdColor.value = false;
    }
  }

  void onChanged_mobile(String value) {
    if (value.isEmpty) {
      mobileNoColor.value = true;
    } else {
      mobileNoColor.value = false;
    }
  }

  void editProfile_edit() {
    editprofileButton.editProfile(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailIdController.text,
      mobileno: mobileController.text,
      code: country_PersonalInformation.value,
      businessType: selectedValueIAM.value,
      companyName: companyController.text,
      countryId: country.value,
      city: cityController.text,
      state: stateController.text,
      address: addressController.text,
      memberOf: selectedValueMemberof.value,
      howDidYouHearAboutUs: selectedValueHowdidyourhear.value,
    );

    print('Fristname: - ${firstNameController.text}');
    print('Lastname: - ${lastNameController.text}');
    print('Email: - ${emailIdController.text}');
    print('Mobile: - ${mobileController.text}');
    print('Code: - ${country_PersonalInformation.value}');
    print('Business Type: - ${selectedValueIAM.value}');
    print('Company Name: - ${companyController.text}');
    print('Country: - ${country.value}');
    print('City: - ${cityController.text}');
    print('State: - ${stateController.text}');
    print('Address: - ${addressController.text}');
    print('Member Of: - ${selectedValueMemberof.value}');
    print('How Did You Hear About Us: - ${selectedValueHowdidyourhear.value}');
  }
}
