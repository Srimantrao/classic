// SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); // hides Navigation bar
// SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: [SystemUiOverlay.top]); // Show Only Header
// SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]); // Show Only bootcamp
// SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); //show Everything

// ignore_for_file: avoid_print

import 'package:classic/view/screen/splash/logo.dart';
import 'package:classic/view/utils/app_Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();

  //Login
  isLogin = pref!.getBool('isLogin') ?? false;
  userName = pref!.getString('username') ?? '';
  password = pref!.getString('password') ?? '';
  token = pref!.getString('token') ?? '';
  userID = pref!.getString('userId') ?? '';

  print('isLogin $isLogin');
  print('userName $userName');
  print('password $password');
  print('token $token');
  print('userID $userID');

  //Sinup
  firstName = pref!.getString('FristName') ?? '';
  lastName = pref!.getString('LastName') ?? '';
  email = pref!.getString('Email') ?? '';
  password = pref!.getString('Password') ?? '';
  countryDrop = pref!.getString('Coundtry') ?? '';
  mobileNo = pref!.getString('MobileNo') ?? '';
  iAM = pref!.getString('IAM') ?? '';
  howDidHear = pref!.getString('HowDidHear') ?? '';
  company = pref!.getString('Company') ?? '';
  companyUser = pref!.getString('CompanyUser') ?? '';
  state = pref!.getString('State') ?? '';
  zipCode = pref!.getString('ZipCode') ?? '';
  address = pref!.getString('Address') ?? '';
  city = pref!.getString('City') ?? '';
  ReadandAgree = pref!.getString('ReadandAgree') ?? '';
  Stock = pref!.getString('Stock') ?? '';
  TokanRecaptcha = pref!.getString('TokanRecaptcha') ?? '';

  print('firstName $firstName');
  print('lastName $lastName');
  print('email $email');
  print('password $password');
  print('countryDrop $countryDrop');
  print('mobileNo $mobileNo');
  print('iAM $iAM');
  print('howDidHear $howDidHear');
  print('company $company');
  print('companyUser $companyUser');
  print('state $state');
  print('zipCode $zipCode');
  print('address $address');
  print('city $city');
  print('ReadandAgree $ReadandAgree');
  print('Stock $Stock');
  print('TokanRecaptcha $TokanRecaptcha');

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return ToastificationWrapper(
      child: GetMaterialApp(
        theme: ThemeData(fontFamily: 'Sans-Bold'),
        debugShowCheckedModeBanner: false,
        home: Logo(),
      ),
    );
  }
}
