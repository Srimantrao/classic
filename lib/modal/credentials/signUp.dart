//Convert Map
// ignore_for_file: file_names

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CountryDropdownContoller extends GetxController{
  final Map<String, String> dropdownCountry = {
    'option1': 'India',
    'option2': 'U.S.A',
    'option3': 'England',
    'option4': 'Chaina',
    'option5': 'Pakistan',
  };
}

class SignupDropdownContoller extends GetxController {
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
}
