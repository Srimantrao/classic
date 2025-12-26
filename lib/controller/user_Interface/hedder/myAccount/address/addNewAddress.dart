import 'package:classic/modal/credentials/signUp.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddnewaddressUIController extends GetxController {
  final countryDropdown = Get.put(CountryDropdownContoller());
  final signUpDropdown = Get.put(SignupDropdownContoller());

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
    return countryDropdown.dropdownCountry.entries.map((entry) {
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

  //Defult Address
  void isDefaultAddressChange(bool value) {
    isDefaultAddress.value = value;
  }
}
