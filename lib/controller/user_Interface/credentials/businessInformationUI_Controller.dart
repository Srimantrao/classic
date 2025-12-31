// ignore_for_file: avoid_print, file_names, unused_field, invalid_use_of_protected_member, unused_local_variable, non_constant_identifier_names


import 'package:classic/controller/application_Programing_interface/apiController/credentials/singUpAPI_Controller.dart';
import 'package:classic/controller/application_Programing_interface/apiController/other/country_Controller.dart';
import 'package:classic/controller/user_Interface/credentials/loginUI_Controller.dart';
import 'package:classic/controller/user_Interface/credentials/signupUI_Contoller.dart';
import 'package:classic/modal/credentials/signUp.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BusinessinformationuiController extends GetxController {
  final Country = Get.put(CountryController());

  final signUpAIP = Get.put(SingUpApiController());
  final signUpUI = Get.put(SignupuiContoller());

  final countryDropdown = Get.put(CountryDropdownContoller());
  final signUpDropdown = Get.put(SignupDropdownContoller());
  final signupUi = Get.put(SignupuiContoller());
  final loginUI = Get.put(LoginuiController());

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

  Future<void> signUp(Widget page) async {
    // Validate required fields
    final hasEmptyFields = companyController.text.isEmpty ||
        stateController.text.isEmpty ||
        cityController.text.isEmpty;

    // Update color states
    companyColor.value = companyController.text.isEmpty;
    stateColor.value = stateController.text.isEmpty;
    cityColor.value = cityController.text.isEmpty;

    // If validation fails, return early
    if (hasEmptyFields) {
      return;
    }

    // Proceed with signup
    await okLetsGetSignUP(page);
  }

  Future<void> okLetsGetSignUP(Widget page) async {
    try {
      // Validate all conditions
      final isValid = isCheck.value == true &&
          companyController.text.isNotEmpty &&
          stateController.text.isNotEmpty &&
          cityController.text.isNotEmpty;

      if (!isValid) {
        throw Exception('Please fill all required fields and accept terms');
      }

      // Call application_Programing_interface
      final response = await signUpAIP.singUpuser(
        firstName: signupUi.firstNameController.text,
        lastName: signupUi.lastNameController.text,
        email: signupUi.emailIdController.text,
        password: signupUi.passwordController.text,
        confirmPassword: signupUi.confirmPasswordController.text,
        mobileNo: signupUi.mobileController.text,
        businessType: signUpDropdown.dropdownOptions[signupUi.selectedValueIAM.value],
        howDidYouHearAboutUs: signUpDropdown.dropdownOptions2[signupUi.selectedValueHowdidyourhear.value],
        memberOf: signUpDropdown.dropdownOptions3[signupUi.selectedValueMemberof.value],
        companyName: companyController.text,
        countryId: country.value,
        state: stateController.text,
        city: cityController.text,
        code: zipController.text,
        zipCode: zipController.text,
        termCondition: readandAgree.value.toString(),
        address: addressController.text,
        subscribing: stock.value.toString(),
        recaptcha: tokanRecaptcha,
      );

      // Check if response is successful
      final responseData = signUpAIP.sinupData.value;
      final message = responseData['message']?.toString();
      final String signed = 'You have signed up successfully!';

      if (message == signed) {

        //Set SharedPreferences
        pref!.setString('FristName', signupUi.firstNameController.text);
        pref!.setString('LastName', signupUi.lastNameController.text);
        pref!.setString('Email', signupUi.emailIdController.text);
        pref!.setString('Password', signupUi.passwordController.text);
        pref!.setString('Coundtry', signupUi.country.value);
        pref!.setString('MobileNo', signupUi.mobileController.text);
        pref!.setString('IAM', signupUi.selectedValueIAM.value);
        pref!.setString('HowDidHear', signupUi.selectedValueHowdidyourhear.value);
        pref!.setString('Company', companyController.text);
        pref!.setString('CompanyUser', country.value);
        pref!.setString('State', stateController.text);
        pref!.setString('ZipCode', zipController.text);
        pref!.setString('Address', zipController.text);
        pref!.setString('City', cityController.text);
        pref!.setString('ReadandAgree', readandAgree.value.toString());
        pref!.setString('Stock', stock.toString());
        pref!.setString('TokanRecaptcha', tokanRecaptcha);


        //Get Value in Loacl Store
        firstName = pref!.getString('FristName')!;
        lastName = pref!.getString('LastName')!;
        email = pref!.getString('Email')!;
        password = pref!.getString('Password')!;
        countryDrop = pref!.getString('Coundtry')!;
        mobileNo = pref!.getString('MobileNo')!;
        iAM =  pref!.getString('IAM')!;
        howDidHear = pref!.getString('HowDidHear')!;
        company = pref!.getString('Company')!;
        companyUser = pref!.getString('CompanyUser')!;
        state = pref!.getString('State')!;
        zipCode = pref!.getString('ZipCode')!;
        address = pref!.getString('Address')!;
        city = pref!.getString('City')!;
        ReadandAgree = pref!.getString('ReadandAgree')!;
        Stock = pref!.getString('Stock')!;
        TokanRecaptcha = pref!.getString('TokanRecaptcha')!;

        Get.offAll(() => page);
      }

    } catch (error) {
      // Handle errors
      print('Sign up error: $error');
      Get.snackbar(
        'Error',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
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

  Future<void> resetvalues() async {
    //businessinformation
    companyController.clear();
    stateController.clear();
    cityController.clear();
    zipController.clear();
    addressController.clear();

    //Sinupscreen
    signupUi.country.value = '';
    signupUi.selectedValueIAM.value = '';
    signupUi.selectedValueHowdidyourhear.value = '';
    signupUi.selectedValueMemberof.value = '';
    signupUi.firstNameController.clear();
    signupUi.lastNameController.clear();
    signupUi.mobileController.clear();
    signupUi.emailIdController.clear();
    signupUi.mobileController.clear();
    signupUi.confirmPasswordController.clear();
    signupUi.passwordController.clear();

    //logonScreen
    loginUI.usernameController.clear();
    loginUI.passwordController.clear();

    country.value = '';
    readandAgree.value = false;
    isCheck.value = false;
  }
}