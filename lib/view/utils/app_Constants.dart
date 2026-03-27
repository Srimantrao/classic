// ignore_for_file: file_names, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dio = Dio();

SharedPreferences? pref;

String userName = '';
String password = '';
String firstName = '';
String lastName = '';
String email = '';
String countryDrop = '';
String countryUser = '';
String mobileNo = '';
String iAM = '';
String howDidHear = '';
String company = '';
String companyUser = '';
String state = '';
String zipCode = '';
String address = '';
String city = '';
String ReadandAgree = '';
String Stock = '';
String TokanRecaptcha = '';

String token ='';
bool isLogin = false;

String userID = '';

//cart
RxString cartItemCount = '0'.obs;
RxString wishItemCount = '0'.obs;
