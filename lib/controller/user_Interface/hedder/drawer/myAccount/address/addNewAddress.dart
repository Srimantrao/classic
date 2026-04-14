// ignore: file_names
// ignore_for_file: unnecessary_null_comparison, file_names, duplicate_ignore, avoid_print, invalid_use_of_protected_member, non_constant_identifier_names

import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/address/addAddress_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/hedder/drawer/myAccount/address/getAddress_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/other/country_Controller.dart';
import 'package:classic/modal/credentials/signUp.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddnewaddressUIController extends GetxController {
  final countryDropdown = Get.put(CountryDropdownContoller());
  final signUpDropdown = Get.put(SignupDropdownContoller());
  final addnewAddress = Get.put(AddaddressController());
  final Country = Get.put(CountryController());
  final getAddress = Get.put(GetAddressController());

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController addressnameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var country = ''.obs;
  var isDefaultAddress = false.obs;

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

  //Defult Address
  void isDefaultAddressChange(bool value) {
    isDefaultAddress.value = value;
  }

  void addNewAddress() async {
    await addnewAddress.addAddressPost(
      firstName: firstnameController.text,
      lastName: lastnameController.text,
      email: emailController.text,
      address: addressnameController.text,
      countryId: country.value,
      state: stateController.text,
      city: cityController.text,
      code: country.value,
      phone: phoneController.text,
      customer: '',
      isDefault: isDefaultAddress.value,
      faxNo: '',
    );
    final errorCode = addnewAddress.addAddress.value['errorCode'];
    print("API Response Code: $errorCode");
    if (errorCode == 200) {
      getAddress.getAddress(userID);
      Get.back();
    } else {
      print("Something went wrong: $errorCode");
    }
  }

  @override
  void onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    addressnameController.dispose();
    stateController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
